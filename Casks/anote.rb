cask "anote" do
  version "0.2.3"
  sha256 "0c9f8e1683602799bc533f05d50242c294c1b701b7111c088a1b1afbbbd1ab7c"

  url "https://dist.puddingtime.net/anote/v#{version}/aNote_#{version}_aarch64.dmg"
  name "aNote"
  desc "Personal notes editor (Tauri shell over the anote.puddingtime.net worker)"
  homepage "https://github.com/mph-llm-experiments/anote-editor"

  depends_on arch: :arm64

  app "aNote.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/aNote.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/org.puddingtime.notes-editor",
    "~/Library/Caches/org.puddingtime.notes-editor",
    "~/Library/WebKit/org.puddingtime.notes-editor"
  ]
end
