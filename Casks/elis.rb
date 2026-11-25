cask "elis" do
  version "1.0.0"
  sha256 "47f7b0ca29b4eca34f63c131cf20ae6b0967f5706dd17a0d69a75a6cafc97339"

  url "https://github.com/NaikSoftware/elis/releases/download/v#{version}/Elis-#{version}.dmg"
  name "Elis"
  desc "Terminal workspace for AI coding agents"
  homepage "https://naiksoftware.github.io/elis/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Elis.app"
  binary "#{appdir}/Elis.app/Contents/MacOS/elisctl"

  # The app is not notarized: strip quarantine on the staged copy, before the move,
  # because TCC can refuse brew's worker on the bundle in appdir. A failure only warns.
  preflight_steps do
    run "/bin/sh",
        args: [
          "-c",
          'err=$(/usr/bin/xattr -dr com.apple.quarantine "$1" 2>&1 >/dev/null) || ' \
          'echo "Warning: could not remove quarantine from $1 ($(printf "%s\n" "$err" | head -n 1)); ' \
          'run: xattr -dr com.apple.quarantine /Applications/Elis.app" >&2',
          "sh",
          "{{staged_path}}/Elis.app",
        ]
  end

  zap trash: [
    "~/Library/Application Support/elis",
    "~/Library/Caches/ua.naiksoftware.elis",
    "~/Library/Preferences/ua.naiksoftware.elis.plist",
    "~/Library/Saved Application State/ua.naiksoftware.elis.savedState",
  ]
end
