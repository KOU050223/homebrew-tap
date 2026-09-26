cask "gakushu-sochi" do
  version "0.1.1"

  arch arm: "arm64", intel: "x64"

  sha256 arm:   "b52c6fdae14f779edfccae971fb6436f40862356ce567c8509f4056fc75dc963",
         intel: "7463c9ec7961f64cb622b67c8af95f03c18c1056c5c1fb2d3f24286b11a8959b"

  url "https://github.com/KOU050223/edd_2026/releases/download/desktop-v#{version}/Gakushu-Sochi-#{version}-mac-#{arch}.dmg"
  name "Gakushu Sochi"
  desc "選択したテキストをすぐに質問できる常駐型 AI コンパニオン"
  homepage "https://github.com/KOU050223/edd_2026"

  app "Gakushu Sochi.app"

  # インストーラは未署名（adhoc）なので、quarantine が残ると Gatekeeper が
  # 「壊れている」と判定して開けない。署名・公証が入るまではインストール時に外す。
  # postflight_steps は Homebrew 7+ の構文で、古い brew ではパースが落ちる。
  # postflight は新旧両方で動くが、新しい brew では deprecated 警告が出るため分岐する。
  if respond_to?(:postflight_steps)
    postflight_steps do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Gakushu Sochi.app"]
    end
  else
    postflight do
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{appdir}/Gakushu Sochi.app"]
    end
  end
end
