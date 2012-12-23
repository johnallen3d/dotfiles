# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mikeh"

# plugins=(git rbenv bundler brew gem git-flow-completion textmate vi-mode)
plugins=(git brew gem git-flow-completion vi-mode)

source $ZSH/oh-my-zsh.sh
unsetopt correct_all

setopt auto_cd
cdpath=($HOME/development/technekes/dev_ops/vagrant/dev_box/apps $HOME/development/technekes/dev_ops/vagrant/dev_box/gems)

export TERM="xterm-256color"

ARCH_FLAGS="-arch x86_64"

# Path config
# see /etc/paths and zshenv

if [[ -e $HOME/.rbenvrc ]]; then
  source $HOME/.rbenvrc
fi

if [[ -e $HOME/.app_vars ]]; then
  source $HOME/.app_vars
fi

if [[ -e $HOME/.app_vars ]]; then
  source $HOME/.app_vars
fi

if [[ -e $HOME/.custom_aliases ]]; then
  source $HOME/.custom_aliases
fi

if [[ -e $HOME/.custom_variables ]]; then
  source $HOME/.custom_variables
fi

if [[ -e $HOME/.custom_functions ]]; then
  source $HOME/.custom_functions
fi

# alias apps="cd /var/apps"
# alias gems="cd /var/gems"

# function start_app {
#   if [ "$1" == '' ]
#   then
#     echo "Please provide an app name"
#     list_apps
#     return
#   fi
  
#   app_dir=/var/apps/$1_app
#   x=`pwd`

#   if [ -x $app_dir/script/start.sh ]
#   then
#     echo "Starting $1..."
#     cd $app_dir
#     script/start.sh
#     echo "Started."
#   elif [ -d $app_dir ]
#   then
#     echo "Starting $1..."
#     cd $app_dir
#     bundle exec unicorn -c config/unicorn.rb -E development -D
#     echo "Started."
#   else
#     echo "No such app"
#     list_apps
#   fi

#   cd $x
# }

# function stop_app {
#   if [ "$1" == '' ]
#   then
#     echo "Please provide an app name"
#     list_apps
#     return
#   fi

#   app_dir=/var/apps/$1_app
#   x=`pwd`

#   if [ -x $app_dir/script/stop.sh ]
#   then
#     echo "Stopping $1..."
#     cd $app_dir
#     script/stop.sh
#     echo "Stopped."
#   elif [ -d $app_dir ]
#   then
#     echo "Stopping $1..."
#     cd $app_dir
#     kill `cat $app_dir/tmp/pids/unicorn.pid` &> /dev/null
#     echo "Stopped."
#   else
#     echo "No such app"
#     list_apps
#   fi

#   cd $x
# }

# function restart_app {
#   stop_app $1
#   start_app $1
# }

# function list_apps {
#   echo "Listing apps..."
#   echo
#   for d in `ls /var/apps`
#   do
#     echo ${d/_app/}
#   done
# }

# Editor config
if [[ -e /usr/bin/mvim ]]; then
  alias vi='/usr/bin/mvim -v -N'
  alias vim=vi
fi
export EDITOR=vim
set -o vi
set stty -ixon
alias tmux="TERM=screen-256color-bce tmux"

# Github/hub config
alias git=hub
if type compdef >/dev/null; then
   compdef hub=git
fi

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

