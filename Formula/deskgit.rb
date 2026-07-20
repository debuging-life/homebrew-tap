class Deskgit < Formula
  desc "DeskTimers terminal git client — lazygit fork with task-code integration"
  homepage "https://desktimers.com"
  license "MIT"

  # To cut a stable release: push a `deskgit-vX.Y.Z` tag on the dtgit branch,
  # then uncomment and fill in (sha256 from `curl -L <url> | shasum -a 256`):
  #
  # url "https://github.com/debuging-life/lazygit/archive/refs/tags/deskgit-v0.1.0.tar.gz"
  # sha256 "REPLACE_ME"
  # version "0.1.0"
  #
  # Until then, install with: brew install --HEAD debuging-life/tap/deskgit
  head "git@github.com:debuging-life/lazygit.git", branch: "dtgit", using: :git

  depends_on "go" => :build

  def install
    ldflags = %W[
      -X main.version=#{version}
      -X main.buildSource=homebrew
    ].join(" ")

    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"deskgit"), "."
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"dt-hook"), "./cmd/dt-hook"
  end

  test do
    assert_match "deskgit", shell_output("#{bin}/deskgit --version")
    assert_match "dt-hook", shell_output("#{bin}/dt-hook version")
  end
end
