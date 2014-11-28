# Dotfiles

So, I decided to collect useful configurations:

* Linux environment
* Development tools (php, rails, ruby)
* VCS (Git)

## Install
Just clone them in home directory.
```
$ git clone https://github.com/FylmTM/dotfiles.git ~/.dotfiles
```

## Linux
Some configuration files, for linux environment.

#### bashrc
```
$ echo "source ~/.dotfiles/linux/bashrc" >> ~/.bashrc
```

#### inputrc
```
$ ln -s ~/.dotfiles/linux/inputrc ~/.inputrc
```

## VIM
Vim configuration file. Inspired by several examples:

- https://github.com/carlhuda/janus
- https://github.com/joedicastro/dotfiles/tree/master/vim

```shell
$ ln -s ~/.dotfiles/vim/vimrc ~/.vimrc
```

### Setup [Ubuntu]
**1. Install latest vim**

```shell
$ sudo add-apt-repository ppa:fcwu-tw/ppa
$ sudo apt-get update
$ sudo apt-get install vim-nox
```

**2. Run vim first time**

Vim will auto install NeoBundle and all plugins.

**3. Setup [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) plugin**

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

