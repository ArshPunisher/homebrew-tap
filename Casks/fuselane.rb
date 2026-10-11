cask "fuselane" do
  version "0.1.0-beta.14"
  sha256 "a0eadff4a5b79546a8acbe6888fb9d9ff54a0b3658d7c12e62b8f3909fdba968"

  url "https://github.com/ArshPunisher/fuselane/releases/download/v#{version}/Fuselane_#{version}_macos-universal.dmg"
  name "Fuselane"
  desc "Download one file over every network you have at once"
  homepage "https://fuselane.app/"

  depends_on macos: :ventura

  app "Fuselane.app"

  # Open source, signed with the project's own certificate, not notarized (no paid
  # Apple account, by policy).
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Fuselane.app"]
  end

  zap trash: "~/Library/Application Support/app.fuselane"
end
