class Nbxcli < Formula
  desc "Command-line client for NetBox"
  homepage "https://github.com/jblesener/nbxcli"
  version "1.5.2"

  on_macos do
    on_arm do
      url "https://github.com/jblesener/nbxcli/releases/download/1.5.2/nbxcli_1.5.2_darwin_arm64.tar.gz"
      sha256 "3692a454d302aeb753fec40e1ce2077d40303555773b579f2967412470434aac"
    end
    on_intel do
      url "https://github.com/jblesener/nbxcli/releases/download/1.5.2/nbxcli_1.5.2_darwin_amd64.tar.gz"
      sha256 "64b63ae11b40b04fb8b7dd2f05ed8e235148ab18ef4e85e023483f90551bd88b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jblesener/nbxcli/releases/download/1.5.2/nbxcli_1.5.2_linux_arm64.tar.gz"
      sha256 "c194a1175bef053a9f10e70d3fd87be3aac2d6472eac7c086959f93c7422f7cb"
    end
    on_intel do
      url "https://github.com/jblesener/nbxcli/releases/download/1.5.2/nbxcli_1.5.2_linux_amd64.tar.gz"
      sha256 "f5d37be52678b42ae376d96dad85b0aeae72b8ad9949ed98bc9285a8389167e0"
    end
  end

  def install
    bin.install "nbxcli"
  end

  test do
    system "#{bin}/nbxcli", "--help"
  end
end
