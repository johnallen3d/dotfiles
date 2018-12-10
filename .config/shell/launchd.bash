#! /usr/bin/env bash

function _service-name() {
  echo "dev.${1}"
}

function _service-path() {
  echo "${HOME}/Library/LaunchAgents/${service_name}.plist"
}

function _start-service() {
  launchctl load "${1}"
}

function _stop-service() {
  if launchctl list | grep -q "${1}"; then
    launchctl unload "${2}"
  fi
}

# services START|STOP|RESTART NAME
function services() {
  local action
  local service_name
  local service_path

  action="${1}"
  service_name=$(_service-name "${2}")
  service_path=$(_service-path "${service_name}")

  case "${action}" in
    start )
      _start-service "${service_path}"
      ;;
    stop )
      _stop-service "${service_name}" "${service_path}"
      ;;
    restart )
      _stop-service "${service_name}" "${service_path}"
      _start-service "${service_path}"
      ;;
  esac
}
