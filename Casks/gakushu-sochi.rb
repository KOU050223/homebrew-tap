cask "gakushu-sochi" do
  version "0.1.0"

  arch arm: "arm64", intel: "x64"

  sha256 arm:   "965abef68345eb84ff5b6f5d3aee8c5fa611071e06416102011de2c861a68bef",
         intel: "a47e7cc342550effe71d2cc66f6221d450fabdc04d4f145cd500f442dee23ba9"

  url "https://github.com/KOU050223/edd_2026/releases/download/desktop-v#{version}/Gakushu-Sochi-#{version}-mac-#{arch}.dmg"
  name "Gakushu Sochi"
  desc "選択したテキストをすぐに質問できる常駐型 AI コンパニオン"
  homepage "https://github.com/KOU050223/edd_2026"

  app "Gakushu Sochi.app"
end
