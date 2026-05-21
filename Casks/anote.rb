cask "anote" do
  version "0.2.4"
  sha256 "5c8ac3fca8f0b6659a29b1a76a78db81b44dd0646f54b6f616aaa915a9c185b2"

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
