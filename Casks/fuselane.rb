cask "fuselane" do
  version "1.0.3"
  sha256 "715f7c5559e4fc486495038dffd87556e02b1343dd9a072ca60203548ddd9447"

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
