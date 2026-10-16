cask "fuselane" do
  version "0.1.0-beta.17"
  sha256 "c7ac1535e3d9ffcf99e7220c007bf1147bf00628c0f6d82ea5dbe973cedc7b04"

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
