class Nbxcli < Formula
  desc "Command-line client for NetBox"
  homepage "https://github.com/jblesener/nbxcli"
  version "1.5.1"

  on_macos do
    on_arm do
      url "https://github.com/jblesener/nbxcli/releases/download/1.5.1/nbxcli_1.5.1_darwin_arm64.tar.gz"
      sha256 "e741f84314628cc6d22ec36590bc3bb993d05c597d0c4cb14663bbedf1f7663d"
    end
    on_intel do
      url "https://github.com/jblesener/nbxcli/releases/download/1.5.1/nbxcli_1.5.1_darwin_amd64.tar.gz"
      sha256 "bee3e4fd5d0aabb35dec48cba8f70f884a3d23b000d746296a204e493857bc38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jblesener/nbxcli/releases/download/1.5.1/nbxcli_1.5.1_linux_arm64.tar.gz"
      sha256 "4fc7fc0b6ea1b8be3901e699162d0d47cd996da8addf8c554b97bee3085d3157"
    end
    on_intel do
      url "https://github.com/jblesener/nbxcli/releases/download/1.5.1/nbxcli_1.5.1_linux_amd64.tar.gz"
      sha256 "c6f60bd5c95a546b8842b41ade9a47ab50e56fd46b074ff621d151586465e685"
    end
  end

  def install
    bin.install "nbxcli"
  end

  test do
    system "#{bin}/nbxcli", "--help"
  end
end
