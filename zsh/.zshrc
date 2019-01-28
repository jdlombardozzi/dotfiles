fpath=(~/.zsh $fpath)

# Path to your oh-my-zsh installation.
export ZSH=/Users/jlombardozzi/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# bullet-train
ZSH_THEME="amuse"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git codeclimate jira kubectl postgres systemadmin rvm)

# User configuration

export ACTIVE_RECORD_LOGGER_LEVEL='0'
export GOPATH=$HOME/projects/go
export HUBOT_JIRA_URL="https://stayntouch.atlassian.net"
export HUBOT_JIRA_USERNAME=""
export HUBOT_JIRA_PASSWORD=""
export HUBOT_JIRA_PROJECTS="CICO,OPS"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# OSX key override
# defaults write -g InitialKeyRepeat -int 1
# defaults write NSGlobalDomain KeyRepeat -int 1
# defaults write NSGlobalDomain InitialKeyRepeat -int 12

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias devserver='cd ~/Projects/stayntouch/ && invoker start ~/Projects/stayntouch/invoker.ini'
 alias resetorigindevelop='git fetch origin && git reset --hard origin/develop && git clean -f -d'
 alias resetoriginrelease='git fetch origin && git reset --hard origin/release && git clean -f -d'
 alias resetupstreamdevelop='git fetch upstream && git reset --hard upstream/develop && git clean -f -d'
 alias resetupstreamrelease='git fetch upstream && git reset --hard upstream/release && git clean -f -d'
 alias igod='~/.rvm/bin/rvm in ~/Projects/stayntouch/ifc do bundle exec god -p 17166'
 alias igods='igod && igod load ~/Projects/stayntouch/ifc/config/sneakers.god'
 alias pgod='~/.rvm/bin/rvm in ~/Projects/stayntouch/pms do bundle exec god -p 17164'
 alias pgods='pgod && pgod load ~/Projects/stayntouch/pms/config/bunny.god'
 alias rgod='~/.rvm/bin/rvm in ~/Projects/stayntouch/report do bundle exec god -p 17165'
 alias rgods='rgod && rgod load ~/Projects/stayntouch/report/config/sneakers.god'
 alias bot='cd /Users/jlombardozzi/Projects/stayntouch/snt-hubot && HUBOT_SLACK_TOKEN= ./bin/hubot --adapter slack'
 alias resetdns='sudo killall -HUP mDNSResponder;sudo killall mDNSResponderHelper;sudo dscacheutil -flushcache'

 # Show Disk Use of subdirectories, sort by size
 alias duss="sudo du -d 1 -h | sort -hr | egrep -v ^0"

# Git aliases
 alias ci='git commit'
 alias co='git checkout'
 alias d='git diff'
 alias dc='git diff --cached'
 alias l='git log --oneline --graph --all --decorate'
 alias ru='git remote update'
 alias s='git status'
 alias gitstat="git log --stat"

# Set default user prompt
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="jason"

autoload -U compinit
compinit -i
src(){cd ~/Projects/$1;}
compctl -W ~/Projects -/ src

ssh_hosts () {
  local -a config_hosts
  local config
  integer ind

  # If users-hosts matches, we shouldn't complete anything else.
  if [[ "$IPREFIX" == *@ ]]; then
    _combination -s '[:@]' my-accounts users-hosts "users=${IPREFIX/@}" hosts "$@" && return
  else
    _combination -s '[:@]' my-accounts users-hosts \
      ${opt_args[-l]:+"users=${opt_args[-l]:q}"} hosts "$@" && return
  fi
  if (( ind = ${words[(I)-F]} )); then
    config=${~words[ind+1]}
  else
    config="$HOME/.ssh/config"
  fi
  if [[ -r $config ]]; then
    local IFS=$'\t ' key hosts host
    while read key hosts; do
      if [[ "$key" == (#i)host ]]; then
         for host in ${(z)hosts}; do
            case $host in
            (*[*?]*) ;;
            (*) config_hosts+=("$host") ;;
            esac
         done
      fi
    done < "$config"
    if (( ${#config_hosts} )); then
      _wanted hosts expl 'remote host name' \
        compadd -M 'm:{a-zA-Z}={A-Za-z} r:|.=* r:|=*' "$@" $config_hosts
    fi
  fi
}
compctl -W ssh -/ ssh_hosts

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jlombardozzi/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/jlombardozzi/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jlombardozzi/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/jlombardozzi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH=~/.local/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$HOME/.rvm/bin:$PATH

export PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/node@8/bin:$PATH"
export PATH=~/Library/Python/3.7/bin/:$PATH
export PATH=/usr/local/Cellar/python/3.7.1/Frameworks/Python.framework/Versions/3.7/bin:$PATH
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Keyboard repeat rate
# defaults write NSGlobalDomain InitialKeyRepeat -int 15
