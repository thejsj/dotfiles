# Add `~/bin` to the `$PATH`
start=`gdate '+%s.%N'`

# export PATH="/Users/hiphipjorge/personal/wc/webrtc-lib/depot_tools:$PATH"
export PATH="/Users/hiphipjorge/personal/depot_tools:$PATH"
export PATH="/Users/hiphipjorge/personal/gn/out/gn:$PATH"

export KUBECONFIG=~/figma/figma-kuberentes-talk/tf/kubeconfig_jorge-eks-5q2DmkjB

export PATH="$HOME/bin:$PATH";
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/Applications/ARM/bin/:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/opt/homebrew/opt/python3/libexec:$PATH"
export PATH="/opt/homebrew/opt/python/libexec:$PATH"
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"

export RIPGREP_CONFIG_PATH=~/.ripgreprc
# export FZF_DEFAULT_COMMAND='rg --files --follow --ignore-vcs -g \"!{node_modules/*,.git/*}\"'
export FZF_DEFAULT_COMMAND='rg --files --follow --ignore-vcs'

# Hombrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/usr/local/bin:$PATH";
export PATH="/usr/local/sbin:$PATH";
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export PATH="$HOME/.cask/bin:$PATH"


export PATH="/Users/hiphipjorge/personal/gn/out/gn:$PATH"

export GPG_TTY=$(tty)
export GPGKEY=8C7B9EAD5C000D383B63B3D17271AEB952836D33

export HOMEBREW_AUTO_UPDATE_SECS="86400"
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_AUTO_UPDATE=1

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home/"
# Go
# export GOPATH=$HOME/mulesoft
# export GOPATH=$HOME/Sites/go-projects
# export GOROOT=/opt/homebrew/Cellar/go@1.18/1.18.9/
# export GOROOT=/opt/homebrew/Cellar/go/1.19.4/libexec
# export PATH="/opt/homebrew/opt/go@1.18/bin/go:$PATH"
# export PATH="$GOPATH/bin:$PATH"

export KUBERNETS_NAMESPACE=default
export KUBERNETES_NAMESPACE=default

export PATH=${JAVA_HOME}/bin:$PATH

# Archflags
export ARCHFLAGS="-arch x86_64"

# Python
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/opt/python/libexec/bin/python

# Ruby
export GEM_HOME="$HOME/.gem"
export GEM_PATH="$HOME/.gem"
export PATH=$GEM_HOME/bin:$PATH
export RUBYOPT='-W0' # for running ./figma IRB

export PATH="/Users/hiphipjorge/personal/gn/out/gn:$PATH"

# Java

# Mac CLI
# export PATH=$PATH:/usr/local/m-cli

# History
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history

# Node Environment
export NODE_ENV=development

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.

if [[ $SHELL == *'bash'* ]] then
  source ~/.bash_prompt

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
  [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

  if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    complete -o default -o nospace -F _git g;
  fi;

  # Add tab completion for `defaults read|write NSGlobalDomain`
  # You could just use `-g` instead, but I like being explicit
  complete -W "NSGlobalDomain" defaults;

  # Add `killall` tab completion for common apps
  complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
fi

unset file;

for file in ~/.{path,aliases,exports,private-aliases,functions,private-functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;

if [ -f "~/.iterm2_shell_integration.bash" ]
then
  source ~/.iterm2_shell_integration.bash
fi

eval "$(rbenv init -)"

print-execution-time $start 'Bash profile loaded in'
source "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if which direnv > /dev/null; then
  eval "$(direnv hook bash)"
fi

# FIGMA
export PATH="$HOME/.rbenv/shims:$PATH"
eval "$(rbenv init -)"
export RACK_ENV=development
export PATH="/usr/local/opt/python@2.X.X/libexec/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export AWS_CONFIG_FILE="$HOME/figma/figma/config/aws/sso_config"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig:/usr/local/opt/openssl@3/lib/pkgconfig:$PKG_CONFIG_PATH"

print-execution-time $start 'Bash profile loaded in'
source "$HOME/.cargo/env"
