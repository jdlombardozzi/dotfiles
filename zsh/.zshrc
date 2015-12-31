# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bureau"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# redis-server /usr/local/etc/redis.conf

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx git git-flow rails python ruby brew pow svn)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#---------------------------------------------------------------------
# prompt and path
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:~/Library/Android/sdk/platform-tools:$PATH

# search current directory, home directory, and projects folder
export CDPATH=".:~:~/Sites:~/Webserver/Documents"


# Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
#HISTSIZE=1000
#SAVEHIST=1000
#bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
#zstyle :compinstall filename '/Users/jlombardozzi/.zshrc'

#autoload -Uz compinit
#compinit
# End of lines added by compinstall

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# If you need to install libv8, use the following line
#gem install libv8 -v 3.16.14.3 -- --with-system-v8
#

function t() {
	tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}
