cask "anote" do
  version "0.1.7"
  sha256 "2d388518c25090610d15880999a17b71671247f480b40c6b7c19b445cf391634"

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
