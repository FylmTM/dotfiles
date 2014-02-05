# Dotfiles

So, I decided to collect useful configurations:

* Linux environment
* Development tools (php, rails, ruby)
* VCS (Git)

## Install
Just clone them in home directory.
```
$ git clone git@github.com:FylmTM/dotfiles.git ~/dotfiles
```

## Awesome
Tile window manager. 

```
$ ln -s ~/dotfiles/awesome ~/.config/awesome
```

## Linux
Some configuration files, for linux environment.

#### bashrc
```
$ echo "source ~/dotfiles/linux/bashrc" >> ~/.bashrc
```

#### inputrc
```
$ ln -s ~/dotfiles/linux/inputrc ~/.inputrc
```

## VIM
Vim configuration file. Inspired by several examples:

- https://github.com/carlhuda/janus
- https://github.com/joedicastro/dotfiles/tree/master/vim

### Setup
**1. Install latest vim**
```
$ sudo add-apt-repository ppa:fcwu-tw/ppa
$ sudo apt-get update
$ sudo apt-get install vim-nox
```
**2. Link .vimrc**
```
$ ln -s ~/dotfiles/vim/vimrc ~/.vimrc
```

**3. Run vim first time**

Vim will auto install NeoBundle and all plugins.

**4. Setup [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) plugin**

Install dependecies:
```
$ sudo apt-get install build-essential cmake
$ sudo apt-get install python-dev
```
Compile YMC:
```
$ cd ~/.vim/bundle/YouCompleteMe
$ sudo ./install.sh
```


