# Written by scripts/bump.sh; run it again for a new release rather than editing this by hand.
class Tdash < Formula
  desc "Terminal dashboard of tables, Markdown and charts, described in one JSON file"
  homepage "https://github.com/allco/tdash"

  on_macos do
    on_arm do
      url "https://github.com/allco/tdash/releases/download/v1.5.0/tdash_v1.5.0_darwin_arm64.tar.gz"
      sha256 "3833517936096f3469d3eec40bd385ebad8b6b1fabe7266ed40bb988319d2fff"
    end
    on_intel do
      url "https://github.com/allco/tdash/releases/download/v1.5.0/tdash_v1.5.0_darwin_amd64.tar.gz"
      sha256 "bcebd252e1fdda511e595e36dcb12494c98361e6529addd99cfde044ca73e171"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allco/tdash/releases/download/v1.5.0/tdash_v1.5.0_linux_arm64.tar.gz"
      sha256 "611909b0333beadcbe56a1928d26ef5634bea89b39bb684e85170b4c1bbc745f"
    end
    on_intel do
      url "https://github.com/allco/tdash/releases/download/v1.5.0/tdash_v1.5.0_linux_amd64.tar.gz"
      sha256 "b21f9d66305511a5c99a5bbde506831981ed1e21834836704446d89d657928aa"
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
