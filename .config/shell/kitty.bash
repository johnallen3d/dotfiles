#! /usr/bin/env bash

function t {
  kitty @ set-window-title " "
  kitty @ set-tab-title "${1}"
}

function jt {
  j "${1}"
  t "${PWD##*/}"
}
