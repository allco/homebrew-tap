# Written by scripts/bump.sh; run it again for a new release rather than editing this by hand.
class Tdash < Formula
  desc "Terminal dashboard of tables, Markdown and charts, described in one JSON file"
  homepage "https://github.com/allco/tdash"

  on_macos do
    on_arm do
      url "https://github.com/allco/tdash/releases/download/v1.6.0/tdash_v1.6.0_darwin_arm64.tar.gz"
      sha256 "0258a613de20a996cfc572283bff8ecafd31d97a82201f574142983decd6e2e1"
    end
    on_intel do
      url "https://github.com/allco/tdash/releases/download/v1.6.0/tdash_v1.6.0_darwin_amd64.tar.gz"
      sha256 "30e5ce632161607cf846cf0530d9f4141b4cdf48b774bb1cfde32041fd1848af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allco/tdash/releases/download/v1.6.0/tdash_v1.6.0_linux_arm64.tar.gz"
      sha256 "c69d9ca5a5462d9d6d7939638b49b327a7e0724701fd8bc946fffafa99d34d93"
    end
    on_intel do
      url "https://github.com/allco/tdash/releases/download/v1.6.0/tdash_v1.6.0_linux_amd64.tar.gz"
      sha256 "7491d9bb41e552643382a056c41ef38ab04f88532a0b17da932462dd70a71047"
    end
  end

  def install
    bin.install "tdash"
    pkgshare.install "examples"
    doc.install "README.md", "SPEC.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tdash --version")
  end
end
