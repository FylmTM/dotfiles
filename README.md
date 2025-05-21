# Dotfiles

Config (`~/.config/chezmoi/chezmoi.toml`):
```
[diff]
exclude=["scripts"]

[data]
email="dmitry.v@gravityteam.co"
```

Setup:

```shell
chezmoi init --apply --verbose git@github.com:FylmTM/dotfiles.git
```

Check changes:

```shell
chezmoi diff
```

Apply remote changes:

```shell
chezmoi apply
```

Add local changes to chezmoi repo:

```shell
chezmoi add $FILE
chezmoi re-add
```

Which files are managed by chezmoi?

```shell
chezmoi managed
```
