Dotfiles.
========

So, i decided to collect useful configurations:
* Linux environment
* Development tools (php, rails, ruby)
* VCS (Git)

# Linux

## commands
Collection of useful commands, that i can use in different situations.

## bashrc
### sshfs mount
Mount directory, by ssh, with symlink support.

## inputrc

### Command history search
Type in some letters, press up and cycle through command, that start with those letters.

```bash
$ cd /var/www/project
$ git commit -am 'Message'
$ git push
$ ls
$ mkdir ~/path
# some other stuff
$ cd <up> # Type cd in, press up and you cycle in history. In this example "cd /var/www/project"
```

# VIM
Vim configuration file. Inspired by several examples:
- https://github.com/carlhuda/janus
- https://github.com/joedicastro/dotfiles/tree/master/vim
