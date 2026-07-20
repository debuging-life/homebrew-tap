class Deskgit < Formula
  desc "DeskTimers terminal git client — lazygit fork with task-code integration"
  homepage "https://desktimers.com"
  url "https://github.com/debuging-life/lazygit/archive/refs/tags/deskgit-v0.3.0.tar.gz"
  sha256 "7efc11fdc2417b297b840562b1aa92e1a169314bc4d1c1920f440473be0ac012"
  version "0.3.0"
  license "MIT"

  head "https://github.com/debuging-life/lazygit.git", branch: "main"

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
