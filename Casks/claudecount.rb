cask "claudecount" do
  version "1.0.3"
  sha256 "5b8057cf313476fcc870946dc8d66981fe2a53d2e7db03094656bae348ce59b3"

  url "https://github.com/hellocket/ClaudeCount/releases/download/v#{version}/ClaudeCount.zip"
  name "ClaudeCount"
  desc "Menu bar app showing Claude 5-hour and weekly usage limits"
  homepage "https://github.com/hellocket/ClaudeCount"

  depends_on macos: :ventura

  app "ClaudeCount/ClaudeCount.app"

  uninstall launchctl: [
              "io.github.hellocket.claudecount",
              "com.local.claudecount",
            ],
            quit:      [
              "io.github.hellocket.claudecount",
              "com.local.claudecount",
            ]

  zap trash: [
    "~/Library/Caches/ClaudeCount",
    "~/Library/LaunchAgents/com.local.claudecount.plist",
    "~/Library/LaunchAgents/io.github.hellocket.claudecount.plist",
    "~/Library/Logs/ClaudeCount.log",
    "~/Library/Preferences/com.local.claudecount.plist",
    "~/Library/Preferences/io.github.hellocket.claudecount.plist",
  ]

  caveats <<~EOS
    ClaudeCount reads the Claude Code login from your keychain.
    Install Claude Code and log in first:
      curl -fsSL https://claude.ai/install.sh | bash
      claude

    The app is not notarized by Apple. If macOS says it can't be opened,
    go to System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
