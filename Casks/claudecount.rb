cask "claudecount" do
  version "1.0.2"
  sha256 "889fefdde1fcf8da12a0b8ddc9f4436b621c73a2dd52fb3cc086f36a79e56f8c"

  url "https://github.com/hellocket/ClaudeCount/releases/download/v#{version}/ClaudeCount.zip"
  name "ClaudeCount"
  desc "Menu bar app showing Claude 5-hour and weekly usage limits"
  homepage "https://github.com/hellocket/ClaudeCount"

  depends_on macos: :ventura

  app "ClaudeCount/ClaudeCount.app"

  uninstall launchctl: "com.local.claudecount",
            quit:      "com.local.claudecount"

  zap trash: [
    "~/Library/Caches/ClaudeCount",
    "~/Library/LaunchAgents/com.local.claudecount.plist",
    "~/Library/Logs/ClaudeCount.log",
    "~/Library/Preferences/com.local.claudecount.plist",
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
