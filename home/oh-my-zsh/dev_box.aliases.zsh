function start_app {
  if [[ "$1" == '' ]]
  then
    echo "Please provide an app name"
    list_apps
    return
  fi

  app_dir=/var/apps/$1_app
  x=`pwd`

  if [[ -x $app_dir/script/start.sh ]]
  then
    echo "Starting $1..."
    cd $app_dir
    script/start.sh
    echo "Started."
  elif [[ -d $app_dir ]]
  then
    echo "Starting $1..."
    cd $app_dir
    bundle exec unicorn -c config/unicorn.rb -r development -D
    echo "Started."
  else
    echo "No such app"
    list_apps
  fi

  cd $x
}

function stop_app {
  if [[ "$1" == '' ]]
  then
    echo "Please provide an app name"
    list_apps
    return
  fi

  app_dir=/var/apps/$1_app
  x=`pwd`

  if [[ -x $app_dir/script/stop.sh ]]
  then
    echo "Stopping $1..."
    cd $app_dir
    script/stop.sh
    echo "Stopped."
  elif [[ -d $app_dir ]]
  then
    echo "Stopping $1..."
    cd $app_dir
    kill `cat $app_dir/tmp/pids/unicorn.pid` &> /dev/null
    echo "Stopped."
  else
    echo "No such app"
    list_apps
  fi

  cd $x
}

function restart_app {
  stop_app $1
  start_app $1
}

function list_apps {
  echo "Listing apps..."
  echo
  for d in `ls /var/apps`
  do
    echo ${d/_app/}
  done
}
