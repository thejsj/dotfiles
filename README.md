# Jorge's Dotfiles

My dotfiles. A work in progress.

### Setup

1. Clone Repo Into ~/.../dotfiles and run bootstrap.sh

```
git clone https://github.com/thejsj/dotfiles.git && cd dotfiles && source bootstrap.sh
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
Based on [mathiasbynens's dotfiles](https://github.com/mathiasbynens/dotfiles).