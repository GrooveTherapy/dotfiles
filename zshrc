# echo '.zshrc loaded'

# Use root profile for common stuff 
source ~/.aliases
export PATH=$PATH:~/dotfiles/cmds

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # ssh-agent
    git 
    docker 
    docker-compose
    tmux 
    npm 
    go 
    golang
    pip 
	terraform
	virtualenvwrapper
	python
)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# make this mod https://github.com/agnoster/agnoster-zsh-theme/issues/39
# comment out guts of prompt_context to get rid of username@host part
ZSH_THEME="agnoster"
# ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Dont share history between sessions
# See https://stackoverflow.com/questions/32057760/is-it-possible-to-not-share-history-between-panes-windows-in-tmux-with-zsh
setopt noincappendhistory
setopt nosharehistory

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc

# BUG: the if ... lines are added by google-cloud-sdk. They don't appear to modify my path properly, so im gonna do this manually
# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/kent/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kent/google-cloud-sdk/path.zsh.inc'; fi
# export PATH="$HOME/google-cloud-sdk/bin:$PATH"

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/kent/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kent/google-cloud-sdk/completion.zsh.inc'; fi

# override agnoster prompt with this cute thing from https://github.com/agnoster/agnoster-zsh-theme/issues/39#issuecomment-470603968
prompt_context() {
  # Custom (Random emoji)
  emojis=("⚡️" "🔥" "💀" "👑" "😎" "🐸" "🐵" "🦄" "🌈" "🍻" "🚀" "💡" "🎉" "🔑" "🇹🇭" "🚦" "🌙" "💻" "💥")
  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
  prompt_segment black default "${emojis[$RAND_EMOJI_N]}"
  # prompt_segment black default ""
}
