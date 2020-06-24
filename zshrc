# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/lixia/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="Agnoster11"
#ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# COMPLETION_WAITING_DOTS="true"

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

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git zsh-syntax-highlighting zsh-autosuggestions
)

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
#exports
export GOPATH=/Users/lixia/Documents/GOLang
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN


#for go
alias gb='go build'
alias gbb='go build ./...'
alias gr='go run'
alias gi='go install'
alias gbi='go build;go install'
alias gf='gofmt -w'

#for git
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git pull'
alias gplod='git pull origin dev'
alias gpod='git push origin dev'
alias gac='git add .;git commit -m'
alias grhh='git reset --hard HEAD'
alias gacp='git add .;git commit;git push'
alias gs='git st'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gst='git stash'
alias gstp='git stash pop'
alias gcl='go clean ./...'
alias gll="git for-each-ref --sort=committerdate refs/heads/ --format='%(refname:short)'"
alias glll="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"
alias gclb="limit=`date -v-1w -v-thu '+%Y-%m-%d'`;echo delete git granch before $limit; line=0; for i in `glll`; do flag=0; if ((line++%2==0)) then; flag=1; pre=$i; fi; [[ $pre < $limit && $flag -eq 0 ]] && echo delete $i && git branch -D $i;done"


#for shell
alias p='pwd'
alias g='cd'
alias ll='ls -lhS'
alias l='ls '
alias la='ls -a'
alias cp='cp -rf'
alias rm='rm -r'
alias md='mkdir -p'
alias mcd='mkdir -p'
alias k='killall -9'
alias cl='clear'
alias m='make -j8'
alias mc='make clean'
alias tf='tail -f '

#for shell short cuts
alias src='cd  /Users/lixia/Documents/GOLang/src'
alias lzf='cd  /Users/lixia/Documents/GOLang/src/git.garena.com/zhufeng.li'
alias gn='cd  /Users/lixia/Documents/GOLang/src/git.garena.com/'
alias test='cd  /Users/lixia/Documents/GOLang/src/test'
alias sc='cd  /Users/lixia/Documents/GOLang/src/test/scatchpad'
alias doc='cd ~/Documents/'
alias cb='cd -'
alias cf='cd ..'
alias cff='cd ...'
alias cfff='cd ....'
alias cv='cd ~/.vim'
alias vi='vi 2&>/dev/null'
alias vv='vi ~/.vimrc'
alias vz='vi ~/.zshrc'
alias zl='z -l'
alias hi='history'
alias mm='make clean;make'
alias rmswp='find . -name "*.swp" -exec rm {} \; ;find . -name "*.swo"  -exec rm {} \;'
alias tf='tail -f'
alias tailf='tail -f'

source ~/z.sh

#for gnu-sed
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
#for confluentic go kafka
export PKG_CONFIG_PATH=/usr/lib/pkgconfig

export PATH="$PATH:/Users/lixia/Library/Python/2.7/bin/"

# smc cmd  alias for dp
for cid in sg my tw id th vn ph
do
    for env in stable test staging uat liveish live
    do
            for mod in messenger mailsubscriber essynchronizer item order api admin cron orderproducer internalapi promotion userinfo isssynchronizer promotionsubscriber
            do
                alias ${mod}-${env}-${cid}="smc -e $env services enter dp-$mod-$env-$cid"
                alias logs-${mod}-${env}-${cid}="smc -e $env services logs dp-$mod-$env-$cid"
            done
    done
done

