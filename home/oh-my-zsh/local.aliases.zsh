# always use mvim
alias vi='mvim -v'
alias vim='mvim -v'
alias mvim='mvim -v'

# heroku
alias hlogqa='heroku logs --tail --remote qa'
alias hlogp='heroku logs --tail --remote prod'
alias hconqa='heroku run console --remote qa'
alias hconp='heroku run console --remote prod'
alias hpsqa='heroku ps --remote qa'
alias hpsp='heroku ps --remote prod'

# qa & prod ssh
alias ssqa='ssh deploy@tk-qa'
alias ssp='ssh deploy@tk-prod'

# Github/hub config
alias git=hub
if type compdef >/dev/null; then
   compdef hub=git
fi

# app shortcuts
alias sam="cd ~/development/web/rails/samgreen"
alias tix="cd ~/development/web/rails/futuretix"

# devbox
alias vup="cd $DEV_BOX;vagrant up;"
alias vhalt="cd $DEV_BOX; vagrant halt;"
alias vssh="cd $DEV_BOX; vagrant ssh;"
alias apps="cd $DEV_BOX/apps"
alias gems="cd $DEV_BOX/gems"

function run_command_on_devbox() {
  ssh -p 2222 -i ~/.vagrant.d/insecure_private_key vagrant@localhost "source ~/.bash_profile; $1"
}

function restart_app() {
  run_command_on_devbox "stop_app $1; start_app $1"
}

function bundle_app() {
  run_command_on_devbox "cd /var/apps/$1_app; bundle; stop_app $1; start_app $1"
}
