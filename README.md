# allco/tap

Homebrew formulas for:

- [tdash](https://github.com/allco/tdash): a terminal dashboard of tables, Markdown and charts,
  described in one JSON file.
- [tglab](https://github.com/allco/tglab): a terminal dashboard for GitLab merge requests.

```sh
brew install allco/tap/tdash
brew install allco/tap/tglab
brew upgrade                    # picks up new releases once the formulas here are bumped
```

The formulas install the prebuilt release archives for macOS and Linux (arm64 and amd64).
A Homebrew install doesn't update itself; `brew upgrade` does that.

## Bumping a formula

```sh
scripts/bump.sh tdash v1.4.2    # reads the release's checksums.txt and rewrites Formula/tdash.rb
git commit -am "tdash v1.4.2" && git push
```

CI (`.github/workflows/test.yml`) installs and tests every formula on macOS and Linux on each push.
