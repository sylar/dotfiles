# Dotfiles

I maintain my own dotfiles to customize and set up my development environment. I regularly update and validate them to ensure they are current. I utilize `stow` to manage them and conveniently update the repository whenever any changes occur.

Currently it manages

- ssh config
- brew goodies (formulae, apps, mac app store apps, vscode plugins)
- iterm2 config
- fish configs and functions
- templates for [.gitconfig](templates/.gitconfig) and [macos defaults](templates/defaults.sh) files

## Install

```bash
$ cd ~
$ git clone --depth 1 https://github.com/sylar/dotfiles
$ cd dotfiles
$ ./install.sh
```

## License

[MIT](LICENSE)
