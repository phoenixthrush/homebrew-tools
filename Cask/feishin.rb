cask "feishin" do
  latest_yml_url = `curl -s https://api.github.com/repos/jeffvli/feishin/releases/latest | jq -r '.assets[] | select(.name=="latest-mac.yml") | .browser_download_url'`.strip
  release_info = `curl -sL "#{latest_yml_url}"`.strip

  version release_info.lines.first.match(/^version:\s*(.+)$/)[1].strip

  on_arm do
    arm64_match = release_info.match(/- url: (Feishin-.+-mac-arm64\.dmg)\s+sha512: ([a-zA-Z0-9+\/=]+)/)
    filename, sha512_hash = arm64_match[1], arm64_match[2]
    
    sha256 :no_check
    url "https://github.com/jeffvli/feishin/releases/download/v#{version}/#{filename}",
        verified: "github.com/jeffvli/feishin/"
  end
  
  on_intel do
    intel_match = release_info.match(/- url: (Feishin-.+-mac-x64\.dmg)\s+sha512: ([a-zA-Z0-9+\/=]+)/)
    filename, sha512_hash = intel_match[1], intel_match[2]
    
    sha256 :no_check
    url "https://github.com/jeffvli/feishin/releases/download/v#{version}/#{filename}",
        verified: "github.com/jeffvli/feishin/"
  end

  name "Feishin"
  desc "A modern self-hosted music player."
  homepage "https://github.com/jeffvli/feishin"

  auto_updates true
  app "Feishin.app"

  zap trash: [
    "~/Library/Application Support/feishin",
    "~/Library/Caches/feishin", 
    "~/Library/Logs/feishin",
    "~/Library/Preferences/com.jeffvli.feishin.plist",
    "~/Library/Saved Application State/com.jeffvli.feishin.savedState",
  ]
end
