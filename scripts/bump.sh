#!/usr/bin/env bash
# bump.sh <app> <tag>: write Formula/<app>.rb for a GitHub release of allco/<app>, using the
# release's checksums.txt. The release must exist and have its darwin and linux archives.
set -euo pipefail
cd "$(dirname "$0")/.."

app=${1:?usage: bump.sh <tdash|tglab> <tag>}
tag=${2:?usage: bump.sh <tdash|tglab> <tag>}
version=${tag#v}

case $app in
tdash)
  desc="Terminal dashboard of tables, Markdown and charts, described in one JSON file"
  extra='    pkgshare.install "examples"
    doc.install "README.md", "SPEC.md"'
  ;;
tglab)
  desc="Terminal dashboard for GitLab merge requests"
  extra='    pkgshare.install "config.example.yaml"
    doc.install "README.md"'
  ;;
*) echo "unknown app: $app" >&2; exit 1 ;;
esac

base="https://github.com/allco/$app/releases/download/$tag"
sums=$(curl -fsSL "$base/checksums.txt")
sha() {
  local f="${app}_${tag}_$1.tar.gz" s
  s=$(awk -v f="$f" '$2 == f || $2 == "*" f { print $1 }' <<<"$sums")
  [ -n "$s" ] || { echo "$f is not in $tag's checksums.txt" >&2; exit 1; }
  echo "$s"
}
url() { echo "$base/${app}_${tag}_$1.tar.gz" | sed "s|$tag|v#{version}|g"; }

class=$(tr '[:lower:]' '[:upper:]' <<<"${app:0:1}")${app:1}
cat >"Formula/$app.rb" <<RUBY
# Written by scripts/bump.sh; run it again for a new release rather than editing this by hand.
class $class < Formula
  desc "$desc"
  homepage "https://github.com/allco/$app"
  version "$version"

  on_macos do
    on_arm do
      url "$(url darwin_arm64)"
      sha256 "$(sha darwin_arm64)"
    end
    on_intel do
      url "$(url darwin_amd64)"
      sha256 "$(sha darwin_amd64)"
    end
  end

  on_linux do
    on_arm do
      url "$(url linux_arm64)"
      sha256 "$(sha linux_arm64)"
    end
    on_intel do
      url "$(url linux_amd64)"
      sha256 "$(sha linux_amd64)"
    end
  end

  def install
    bin.install "$app"
$extra
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/$app --version")
  end
end
RUBY
echo "Formula/$app.rb: $tag"
