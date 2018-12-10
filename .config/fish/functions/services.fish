function services --description 'Manage launchd services: services START|STOP|RESTART NAME'
  function start
    launchctl load $argv[1]
  end

  function stop
    if launchctl list | grep -q $argv[1]
      launchctl unload $argv[2]
    end
  end

  set -l action $argv[1]
  set -l service $argv[2]
  set -l service_name dev.$service
  set -l service_path $HOME/Library/LaunchAgents/$service_name.plist

  switch $action
    case start
      echo starting service $service
      start $service_path
    case stop
      echo stopping service $service
      stop $service_name $service_path
    case restart
      echo restarting service $service
      stop $service_name $service_path
      start $service_path
  end
end
