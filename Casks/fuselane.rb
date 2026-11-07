cask "fuselane" do
  version "1.0.0"
  sha256 "c616e44a5831929cf84c7425f967ed147895bf423e48652168ffe53a851b6f6e"

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
