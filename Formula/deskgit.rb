class Deskgit < Formula
  desc "DeskTimers terminal git client — lazygit fork with task-code integration"
  homepage "https://desktimers.com"
  url "https://github.com/debuging-life/lazygit/archive/refs/tags/deskgit-v0.5.1.tar.gz"
  sha256 "1b4ad098be2ffbaf9b9ba8e3d0349495170383830ef65461352344bd28df985f"
  version "0.5.1"
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
