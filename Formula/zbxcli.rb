class Zbxcli < Formula
  desc "Command-line client for Zabbix"
  homepage "https://github.com/jblesener/zbxcli"
  version "1.6.0"

  on_macos do
    on_arm do
      url "https://github.com/jblesener/zbxcli/releases/download/1.6.0/zbxcli_1.6.0_darwin-arm64.tar.gz"
      sha256 "e09e1661eca768a4e1968a13f392ba2e3c65a4aa54a6ceda0cc7e959570ad0dc"
    end
    on_intel do
      url "https://github.com/jblesener/zbxcli/releases/download/1.6.0/zbxcli_1.6.0_darwin-amd64.tar.gz"
      sha256 "d99f238558028fd02246b585d3f46675572787e4c5ae9be96c6782d9cf67015e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jblesener/zbxcli/releases/download/1.6.0/zbxcli_1.6.0_linux-amd64.tar.gz"
      sha256 "9f87a791a0a81335a05e112b4c20dc78025824c99ff7797bddb31c9dc16800c7"
    end
  end

  def install
    bin.install "zbxcli"
  end

  test do
    system "#{bin}/zbxcli", "--help"
  end
end
