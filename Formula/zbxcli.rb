class Zbxcli < Formula
  desc "Command-line client for Zabbix"
  homepage "https://github.com/jblesener/zbxcli"
  version "1.5.1"

  on_macos do
    on_arm do
      url "https://github.com/jblesener/zbxcli/releases/download/1.5.1/zbxcli_1.5.1_darwin-arm64.tar.gz"
      sha256 "9825fb3546bcdc8a655c0b9950c5cd30119a0a90efd64932e1ba3465fa74971b"
    end
    on_intel do
      url "https://github.com/jblesener/zbxcli/releases/download/1.5.1/zbxcli_1.5.1_darwin-amd64.tar.gz"
      sha256 "6f791b49a7f47f6a2462cd77557d65ff36f1181304e0638d6f27786c7174136a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jblesener/zbxcli/releases/download/1.5.1/zbxcli_1.5.1_linux-amd64.tar.gz"
      sha256 "158715349a01155b51471d2b60be0cc9eb10688103fb62656c16cc784dffc075"
    end
  end

  def install
    bin.install "zbxcli"
  end

  test do
    system "#{bin}/zbxcli", "--help"
  end
end
