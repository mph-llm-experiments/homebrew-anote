cask "anote" do
  version "0.1.4"
  sha256 "956f90c901c5c38ef0cbb236590484213dafb24e2edfa5f852c7168c6eab6806"

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
