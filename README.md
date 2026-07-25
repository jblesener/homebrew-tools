# Homebrew Tools

This repository is the Homebrew tap for the command-line tools maintained by
[@jblesener](https://github.com/jblesener).

```sh
brew tap jblesener/tools
brew install zbxcli
brew install nbxcli
```

Formulas are generated from stable GitHub Release archives. The `zbxcli` and
`nbxcli` release workflows update the corresponding formula after a release is
published.

## Maintainer setup

Create a fine-grained personal access token with **Contents: Read and write**
permission for this repository. Save that token as `HOMEBREW_TAP_TOKEN` in both
the `zbxcli` and `nbxcli` repositories. The release workflows use it only to
commit formula updates to this tap.

## License

This project is licensed under the [MIT License](LICENSE).
Copyright © 2026 John Blesener.
