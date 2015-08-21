# Jorge's Dotfiles

### Setup

1. Clone Repo Into ~/.../dotfiles and copy into ~

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

4. Install Homebrew Packages

```
source ~/brew.sh
```

5. Install Cask Packages

```
brew bundle ~/Caskfile
```

6. Install Sublime Settings
```
source ~/sublime
```

7. Install SPF13 for VIM

```
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh
```

### Backup

If you ever need to backup your files, these are probably the things you need to backup.

1. ~/Documents
2. ~/Desktop
3. ~/Sites
4. ~/.ssh
5. MySQL datbases
6. Mongo Databases
 
### Credit
Based on [mathiasbynens's dotfiles](https://github.com/mathiasbynens/dotfiles).
