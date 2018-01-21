# Add `~/bin` to the `$PATH` 
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# Necessary for YouCompleteMe
# export PATH="/usr/local/opt/python/Frameworks/Python.framework/Versions/2.7/bin/:$PATH"
export PATH="$HOME/bin:$PATH";
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Hombrew
export PATH="/usr/local/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";
export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export DEVOPS_SCRIPTS_PATH=/Users/hiphipjorge/runnable/devops-scripts
export PATH="$HOME/.cask/bin:$PATH"

# Go
export GOPATH=$HOME/Sites/go-projects
export GOPATH=$HOME/mulesoft
export PATH=$PATH:$GOPATH/bin
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home/"

# Archflags
export ARCHFLAGS="-arch x86_64"

# Runnable
export RUN_ROOT=~/runnable

# Python
export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/libexec/bin/python
export PATH=~/Library/Python/2.7/bin/:$PATH

# Ruby
export GEM_HOME="$HOME/.gem"
export GEM_PATH="$HOME/.gem"

# Java
# export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=${JAVA_HOME}/bin:$PATH

# Mac CLI
export PATH=$PATH:/usr/local/m-cli

# History
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Node Environment
export NODE_ENV=development

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,aliases,exports,private-aliases,functions,private-functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;


# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi



# Powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /Library/Python/2.7/site-packages/powerline/bindings/bash/powerline.sh

if [ -f "~/.iterm2_shell_integration.bash" ]
then
  source ~/.iterm2_shell_integration.bash
fi

# echo "Start nvm"
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# # Add check to make sure file exists
# if [ -e "~/.iterm2_shell_integration.bash" ]
# then
    # source ~/.iterm2_shell_integration.bash
# fi

# Powerline
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /Library/Python/2.7/site-packages/powerline/bindings/bash/powerline.sh

# TMUX
# if command -v tmux>/dev/null; then
  # [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
# fi

eval "$(rbenv init -)"
# eval "$(direnv hook bash)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hiphipjorge/Downloads/google-cloud-sdk/path.bash.inc' ]; then source '/Users/hiphipjorge/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hiphipjorge/Downloads/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/hiphipjorge/Downloads/google-cloud-sdk/completion.bash.inc'; fi

# VIM
# Create the temporary directory for VIM swap files
if [ ! -d "~/.vim" ]; then
  if [ ! -d "~/.vim/tmp" ]; then
    mkdir -p ~/.vim/tmp
  fi
fi

if [ -f "/usr/local/bin/virtualenvwrapper.sh" ]
then
  source /usr/local/bin/virtualenvwrapper.sh
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if which direnv > /dev/null; then
  eval "$(direnv hook bash)"
fi
