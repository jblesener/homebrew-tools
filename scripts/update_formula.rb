#!/usr/bin/env ruby
# frozen_string_literal: true

require "digest"
require "fileutils"
require "optparse"

FORMULAS = {
  "zbxcli" => {
    description: "Command-line client for Zabbix",
    binary: "zbxcli",
    platforms: %w[darwin-arm64 darwin-amd64 linux-amd64]
  },
  "nbxcli" => {
    description: "Command-line client for NetBox",
    binary: "nbxcli",
    platforms: %w[darwin-arm64 darwin-amd64 linux-arm64 linux-amd64]
  }
}.freeze

options = { assets: {} }
OptionParser.new do |parser|
  parser.banner = "Usage: update_formula.rb --formula NAME --repo OWNER/REPO --tag TAG --tap-dir PATH --asset PLATFORM=PATH"
  parser.on("--formula NAME") { |value| options[:formula] = value }
  parser.on("--repo OWNER/REPO") { |value| options[:repo] = value }
  parser.on("--tag TAG") { |value| options[:tag] = value }
  parser.on("--tap-dir PATH") { |value| options[:tap_dir] = value }
  parser.on("--asset PLATFORM=PATH") do |value|
    platform, path = value.split("=", 2)
    abort "invalid asset #{value.inspect}" if platform.nil? || path.nil? || platform.empty? || path.empty?

    options[:assets][platform] = path
  end
end.parse!

%i[formula repo tag tap_dir].each do |key|
  abort "--#{key.to_s.tr('_', '-')} is required" if options[key].nil? || options[key].empty?
end

definition = FORMULAS[options[:formula]]
abort "unsupported formula #{options[:formula].inspect}" if definition.nil?

version = options[:tag].sub(/\Av/, "")
abort "release tag must contain a semantic version" unless version.match?(/\A\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?\z/)

missing = definition[:platforms] - options[:assets].keys
abort "missing assets for #{missing.join(', ')}" unless missing.empty?

checksums = definition[:platforms].to_h do |platform|
  path = options[:assets][platform]
  abort "release asset not found: #{path}" unless File.file?(path)

  [platform, Digest::SHA256.file(path).hexdigest]
end

asset_url = lambda do |platform|
  filename = File.basename(options[:assets].fetch(platform))
  "https://github.com/#{options[:repo]}/releases/download/#{options[:tag]}/#{filename}"
end

resource = lambda do |platform|
  <<~RUBY.chomp
    url "#{asset_url.call(platform)}"
    sha256 "#{checksums.fetch(platform)}"
  RUBY
end

indent = lambda do |block, spaces|
  prefix = " " * spaces
  block.lines.map { |line| "#{prefix}#{line}" }.join
end

platforms = definition[:platforms]
platform_block = lambda do |os, entries|
  lines = ["on_#{os} do"]
  entries.each do |architecture, platform|
    lines << "  on_#{architecture} do"
    resource.call(platform).lines(chomp: true).each { |line| lines << "    #{line}" }
    lines << "  end"
  end
  lines << "end"
  lines.join("\n")
end

macos = platform_block.call("macos", { "arm" => "darwin-arm64", "intel" => "darwin-amd64" })
linux_entries = { "intel" => "linux-amd64" }
linux_entries = { "arm" => "linux-arm64", "intel" => "linux-amd64" } if platforms.include?("linux-arm64")
linux = platform_block.call("linux", linux_entries)

formula = [
  "class #{options[:formula].split("-").map(&:capitalize).join} < Formula",
  "  desc \"#{definition[:description]}\"",
  "  homepage \"https://github.com/#{options[:repo]}\"",
  "  version \"#{version}\"",
  "",
  indent.call(macos, 2),
  "",
  indent.call(linux, 2),
  "",
  "  def install",
  "    bin.install \"#{definition[:binary]}\"",
  "  end",
  "",
  "  test do",
  "    system \"\#{bin}/#{definition[:binary]}\", \"--help\"",
  "  end",
  "end",
  ""
].join("\n")

formula_path = File.join(options[:tap_dir], "Formula", "#{options[:formula]}.rb")
FileUtils.mkdir_p(File.dirname(formula_path))
File.write(formula_path, formula)
