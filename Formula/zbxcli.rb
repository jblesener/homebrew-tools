class Zbxcli < Formula
  desc "Command-line client for Zabbix"
  homepage "https://github.com/jblesener/zbxcli"
  version "1.3.0"

  on_macos do
    on_arm do
      url "https://github.com/jblesener/zbxcli/releases/download/1.3.0/zbxcli_1.3.0_darwin-arm64.tar.gz"
      sha256 "1a8f208e86ad3c0f310266d17270ef6bdfe01733f3ce2cb2464aa997dd31c3d2"
    end
    on_intel do
      url "https://github.com/jblesener/zbxcli/releases/download/1.3.0/zbxcli_1.3.0_darwin-amd64.tar.gz"
      sha256 "b0eb6d3c164530046f523d1cd453cc49aa49dc41e43bde77b7016e94a4bf6b8c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jblesener/zbxcli/releases/download/1.3.0/zbxcli_1.3.0_linux-amd64.tar.gz"
      sha256 "4e85b906b012713c0a19192fd6e59bafac513e4135511dccd72a07a80ac0716a"
    end
  end

  def install
    bin.install "zbxcli"
  end

  test do
    system "#{bin}/zbxcli", "--help"
  end
end
