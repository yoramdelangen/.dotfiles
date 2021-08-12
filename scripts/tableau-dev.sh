#!/bin/bash

## ALL AVAILABLE VERSION OF TABLEAU
##
## Can be found on the following link:
## - https://www.tableau.com/support/releases
##
## Alias scripts as for inspiration
## alias tableau="open /Applications/Talbeau\ Desktop\ 2021.2.app --args --remote-debugging-port=8696"

## Goal is to dynamicly be able to open A Tableau Desktop appliocation in development mode. 
## 
## ROADMAP
## - Adding port check for dynamicly open multiple Tableau versions on different ports.

# make tab cycle through commands after listing
bind '"\t":menu-complete'
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on"

echo 'Choose Tableau version by number or [Ctrl+c] to stop:'

unset options i
while IFS= read -r -d $'\0' f; do
  options[i++]="$f"
done < <(find /Applications -maxdepth 1 -name "Tableau*.app" -print0 | sort)

select opt in "${options[@]}"; do
  case $opt in
    *.app)
      echo "Tableau file $opt selected"
      open -a "$opt" --args --remote-debugging-port=8096
      break
      ;;
    "Do nothing ")
      echo "You chose to stop"
      break
      ;;
    *)
      ;;
  esac
done
