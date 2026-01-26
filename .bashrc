[ -n "$PS1" ] && source ~/.bash_profile;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/.cargo/env"

# Enables autocompletion of options for bashfuscator
eval "$(/usr/local/bin/register-python-argcomplete bashfuscator)"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/hiphipjorge/.cache/lm-studio/bin"
. "$HOME/.cargo/env"
