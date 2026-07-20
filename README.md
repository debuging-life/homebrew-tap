# debuging-life Homebrew Tap

Homebrew formulae for DeskTimers tooling.

```sh
brew install debuging-life/tap/deskgit          # tagged release
brew install --HEAD debuging-life/tap/deskgit   # latest dtgit branch
```

Installs `deskgit` (the DeskTimers git client, a lazygit fork) and its hook
companion `dt-hook`. See the [deskgit README](https://github.com/debuging-life/lazygit/blob/main/README.md).

> This repo must be named `homebrew-tap` on GitHub so that
> `brew install debuging-life/tap/<formula>` resolves.

## Windows (Scoop)

```powershell
scoop bucket add loudowls https://github.com/debuging-life/homebrew-tap
scoop install deskgit
```

Or download `deskgit_<ver>_windows_amd64.zip` from the
[releases page](https://github.com/debuging-life/lazygit/releases) and put both
executables on your PATH.
