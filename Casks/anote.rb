cask "anote" do
  version "0.2.2"
  sha256 "52deb850dc18c52732773bd9c7d4e7188c7344665d014ae03a1f45d2b81d182c"

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
