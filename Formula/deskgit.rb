class Deskgit < Formula
  desc "DeskTimers terminal git client — lazygit fork with task-code integration"
  homepage "https://desktimers.com"
  url "https://github.com/debuging-life/lazygit/archive/refs/tags/deskgit-v0.4.1.tar.gz"
  sha256 "b88028b4780ef2a836090fd33783bf0ab1b8c3688fc50f127f07fb7eadc31815"
  version "0.4.1"
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
