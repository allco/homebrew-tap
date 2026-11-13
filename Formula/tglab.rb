# Written by scripts/bump.sh; run it again for a new release rather than editing this by hand.
class Tglab < Formula
  desc "Terminal dashboard for GitLab merge requests"
  homepage "https://github.com/allco/tglab"

  on_macos do
    on_arm do
      url "https://github.com/allco/tglab/releases/download/v1.2.0/tglab_v1.2.0_darwin_arm64.tar.gz"
      sha256 "109e6f9db84a05e2aa801da333c73e2f3d365f60b2eb3eaea6f26c7d60383311"
    end
    on_intel do
      url "https://github.com/allco/tglab/releases/download/v1.2.0/tglab_v1.2.0_darwin_amd64.tar.gz"
      sha256 "74a36ead55557ea8c6c1c7cb3fcb3299f2feaa3c8e77823853ba30e4cd0f1f38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allco/tglab/releases/download/v1.2.0/tglab_v1.2.0_linux_arm64.tar.gz"
      sha256 "9a6bb937386d315bdf97d147707b9b88d2017c037bfe94a8c2d0b38b21a8bd1d"
    end
    on_intel do
      url "https://github.com/allco/tglab/releases/download/v1.2.0/tglab_v1.2.0_linux_amd64.tar.gz"
      sha256 "450416367cee88664f79f372fec3d24845b0537b847cc7d98c309eeb7f99aa92"
    end
  end

  def install
    bin.install "tglab"
    pkgshare.install "config.example.yaml"
    doc.install "README.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tglab --version")
  end
end
