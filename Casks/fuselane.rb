cask "fuselane" do
  version "0.1.0-beta.12"
  sha256 "3546487a5dd9c3672e8dce4bc9516b36aba200b544b1730f2fb4f24dc98fbccf"

  url "https://github.com/ArshPunisher/fuselane/releases/download/v#{version}/Fuselane_#{version}_macos-universal.dmg"
  name "Fuselane"
  desc "Download one file over every network you have at once"
  homepage "https://fuselane.app"

  depends_on macos: :ventura

  app "Fuselane.app"

  # Open source and ad-hoc signed, not notarized (no paid Apple account, by policy).
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Fuselane.app"]
  end

  zap trash: "~/Library/Application Support/app.fuselane"
end
