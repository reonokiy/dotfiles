# dotfiles

## initial setup

```
chezmoi init https://github.com/reonokiy/dotfiles
chezmoi apply -v
```

## tips

### link wsl op to windows op.exe

```
mkdir -p ~/.local/bin
ln -s $(which op.exe) ~/.local/bin/op
```
