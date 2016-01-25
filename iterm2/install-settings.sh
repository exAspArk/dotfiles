#!/usr/bin/env bash
set -e

plist="com.googlecode.iterm2.plist"
new_plist="$PWD/../iterm2/$plist"
installed_plist="$HOME/Library/Preferences/$plist"

log()   { printf -- "-----> $*\n" ; return $? ; }
warn()  { printf -- ">>>>>> $*\n" ; return $? ; }

if [[ "$TERM_PROGRAM" == "iTerm.app" ]] ; then
  warn "You appear to be running this script from within iTerm.app which could"
  warn "overwrite your new preferences on quit.\n"
  warn "Please quit iTerm and run this from Terminal.app or an SSH session.\n"
  exit 2
fi

if ps wwwaux | egrep -q 'iTerm\.app' >/dev/null ; then
  warn "You appear to have iTerm.app currently running. Please quit the"
  warn "application so your updates won't get overridden on quit.\n"
  exit 3
fi

if [[ $? -eq 0 ]] ; then
  cp -f "$new_plist" "$installed_plist"
  defaults read com.googlecode.iterm2
  log "iTerm preferences installed/updated in $installed_plist, w00t"
else
  warn "The download or conversion from XML to binary failed. Your current"
  warn "preferences have not been changed.\n"
  exit 4
fi

exit $?
