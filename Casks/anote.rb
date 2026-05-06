cask "anote" do
  version "0.1.0"
  sha256 "079051d8530966e97a9f754afe0135c1ff5047c2a45243562478368efcf45853"

  url "https://github.com/mph-llm-experiments/anote-editor/releases/download/v#{version}/aNote_#{version}_aarch64.dmg"
  name "aNote"
  desc "Personal notes editor (Tauri shell over the anote.puddingtime.net worker)"
  homepage "https://github.com/mph-llm-experiments/anote-editor"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  quarantine false

  app "aNote.app"

  zap trash: [
    "~/Library/Application Support/org.puddingtime.notes-editor",
    "~/Library/Caches/org.puddingtime.notes-editor",
    "~/Library/WebKit/org.puddingtime.notes-editor"
  ]
end
