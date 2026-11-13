# Written by scripts/bump.sh; run it again for a new release rather than editing this by hand.
class Tglab < Formula
  desc "Terminal dashboard for GitLab merge requests"
  homepage "https://github.com/allco/tglab"

  on_macos do
    on_arm do
      url "https://github.com/allco/tglab/releases/download/v1.3.0/tglab_v1.3.0_darwin_arm64.tar.gz"
      sha256 "8f0671fd33973d009a7d6131f80140cf869982efad06ff306c183aa8b25bdfc7"
    end
    on_intel do
      url "https://github.com/allco/tglab/releases/download/v1.3.0/tglab_v1.3.0_darwin_amd64.tar.gz"
      sha256 "db23fc6597bdbf47943e5122026e681091a21e5febbec90946f761b81277fd58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allco/tglab/releases/download/v1.3.0/tglab_v1.3.0_linux_arm64.tar.gz"
      sha256 "9f0330c1183318eb295465fb19384250c4c913dabdfc89eecbe0d8605bbfadc9"
    end
    on_intel do
      url "https://github.com/allco/tglab/releases/download/v1.3.0/tglab_v1.3.0_linux_amd64.tar.gz"
      sha256 "cc46e7a5628da43ccd73440b6bd012913512bcb4f4c0b0753550c2d4bfd80b10"
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
