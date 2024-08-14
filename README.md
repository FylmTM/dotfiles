# Dotfiles

Config:
```
# ~/.config/chezmoi/chezmoi.toml
[data]
email="dmitry@vrublevsky.me"
```

Setup:

```shell
chezmoi init --apply --verbose https://github.com/FylmTM/dotfiles.git
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
