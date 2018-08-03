# Jorge's Dotfiles

## Setup

1. Clone Repo Into ~/dotfiles and copy into ~

```
git clone https://github.com/thejsj/dotfiles.git && cd dotfiles && cp * ../
```

2. Change OSX preferences programmatically

```
source ~/.osx
```

3. Install Homebrew

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

4. Install Homebrew Packages (Doesn't work)

```
brew bundle
```

5. Setup VIM

```
source ~/setup_vim.sh
# Go in and Bundle Install
# Try to install Powerline fonts
cd ~/.vim/bundle/YouCompleteMe
 ./install.py --clang-completer --gocode-completer
``````

6. Install Karabiner and map ESC and CAPS Lock

7. Install Iterm Settings

## Vim


### Currently Learning

- [ ] Moving to the end of the bracket `%`
- [ ] Relative replacing `:.,.+10s/foo/bar/g`
- [ ] `zt` to move current line to top of screen
- [ ] `zz` to move current line to middle of screen
- [ ] Use <Leader><Leader> for easy motion

### Pain points

- [ ] Moving around
 - [ ] Using EasyMotion
 - [ ] Going to the previous point
- [ ] Escaping neocomplete
- [ ] Searching for keywords in project (ag?)
- [ ] Using vim in the command line (zsh? tmux?)
- [ ] Saving sessions

## Backup

If you ever need to backup your files, these are probably the things you need to backup.

1. ~/Documents
2. ~/Desktop
3. ~/Sites
4. ~/.ssh
5. MySQL datbases
6. Mongo Databases
7. RethinkDB Databases

## Credit

Based on [mathiasbynens's dotfiles](https://github.com/mathiasbynens/dotfiles).
