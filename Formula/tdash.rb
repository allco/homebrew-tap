# Written by scripts/bump.sh; run it again for a new release rather than editing this by hand.
class Tdash < Formula
  desc "Terminal dashboard of tables, Markdown and charts, described in one JSON file"
  homepage "https://github.com/allco/tdash"

  on_macos do
    on_arm do
      url "https://github.com/allco/tdash/releases/download/v1.4.1/tdash_v1.4.1_darwin_arm64.tar.gz"
      sha256 "6a01202c598983c57e67a5efc0f3a2104bee1398037b7cbac26695a9d1e378e4"
    end
    on_intel do
      url "https://github.com/allco/tdash/releases/download/v1.4.1/tdash_v1.4.1_darwin_amd64.tar.gz"
      sha256 "12efbacd8119d589d1f4801e9fca05bcacc20e6407b9b21860d669d7397b1ebf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/allco/tdash/releases/download/v1.4.1/tdash_v1.4.1_linux_arm64.tar.gz"
      sha256 "a46ff919c4163662fc6ab7ba2b11854ab552f3c4a15be6872214216889b2e8e8"
    end
    on_intel do
      url "https://github.com/allco/tdash/releases/download/v1.4.1/tdash_v1.4.1_linux_amd64.tar.gz"
      sha256 "d475fa96c4bd0dad1ff531a2cdba4d9ed605e485aa820757157e51a23b5995d4"
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
