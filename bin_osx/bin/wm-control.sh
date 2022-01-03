#!/bin/bash

cmd=$1

echo "First command: $cmd"

if [[ "$cmd" == "start" ]]; then
  brew services start yabai
  brew services start skhd
elif [[ "$cmd" == "stop" ]]; then
  brew services stop yabai
  brew services stop skhd
elif [[ "$cmd" == "status" ]]; then
  brew services | egrep "skhd|yabai"
else
  echo "Unknown command. Only available: start, stop and status"
fi
