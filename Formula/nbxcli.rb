class Nbxcli < Formula
  desc "Command-line client for NetBox"
  homepage "https://github.com/jblesener/nbxcli"
  version "1.3.0"

  on_macos do
    on_arm do
      url "https://github.com/jblesener/nbxcli/releases/download/1.3.0/nbxcli_1.3.0_darwin_arm64.tar.gz"
      sha256 "db62b17e75218c1dc65043033fa6b922d4bd2957a01de0c8f42e60f6d5203c5f"
    end
    on_intel do
      url "https://github.com/jblesener/nbxcli/releases/download/1.3.0/nbxcli_1.3.0_darwin_amd64.tar.gz"
      sha256 "22e8ecea9d12cc386d37ab4aec65241b63a126bafd364f7290889ffa1e493efe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/jblesener/nbxcli/releases/download/1.3.0/nbxcli_1.3.0_linux_arm64.tar.gz"
      sha256 "6fd3cc094534da8ba4781d0eec0c6e07e5b70a9d9aedb6177f8c9a18c92788ad"
    end
    on_intel do
      url "https://github.com/jblesener/nbxcli/releases/download/1.3.0/nbxcli_1.3.0_linux_amd64.tar.gz"
      sha256 "ac8aaf674732eb02100c57e435077e73f6550d88e31aa1e8f49a05876591269c"
    end
  end

  def install
    bin.install "nbxcli"
  end

  test do
    system "#{bin}/nbxcli", "--help"
  end
end
