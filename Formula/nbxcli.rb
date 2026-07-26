class Nbxcli < Formula
  desc "Command-line client for NetBox"
  homepage "https://github.com/jblesener/nbxcli"
  version "1.6.0"

  on_macos do
    on_arm do
      url "https://github.com/jblesener/nbxcli/releases/download/1.6.0/nbxcli_1.6.0_darwin_arm64.tar.gz"
      sha256 "1417bd31b03743a4de9fcd5afb48704c5adaf5351d8a1be6b8deede9dbb8c6f7"
    end
    on_intel do
      url "https://github.com/jblesener/nbxcli/releases/download/1.6.0/nbxcli_1.6.0_darwin_amd64.tar.gz"
      sha256 "d0775594268126ebab8449ba691af94dd1abd608338d9fce0f1f35c8e3225465"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jblesener/nbxcli/releases/download/1.6.0/nbxcli_1.6.0_linux_arm64.tar.gz"
      sha256 "71f7f9fd0935dfe8236f105f83f5f77cf4ec16ec2c594c55bdd5b8cedd65546f"
    end
    on_intel do
      url "https://github.com/jblesener/nbxcli/releases/download/1.6.0/nbxcli_1.6.0_linux_amd64.tar.gz"
      sha256 "3b46260b0f0207929829f9cc1eb30715957de0e3e868593f2940614d1dce4cfe"
    end
  end

  def install
    bin.install "nbxcli"
  end

  test do
    system "#{bin}/nbxcli", "--help"
  end
end
