#!/usr/bin/env bash
#
# unfreeze photoshop in bash
#
# Author: Dave Eddy <dave@daveeddy.com>]
# Date: 2/28/13

displayalert() {
	/usr/bin/osascript <<- EOF
	tell application "System Events"
	activate
	display dialog "$2" \
		with icon 1 \
		buttons {"OK"} \
		with title "$1"
	end tell
	EOF
}


commands=$(ps ax -o pid,state,command | grep '^/Applications/Adobe Photoshop')

if [[ -z $commands ]]; then
	displayalert 'unfreeze-ps' 'no photoshop process was found running'
	exit 1
fi

awk '{ print $1 }' <<< "$commands" | xargs kill -SIGCONT
displayalert 'unfreeze-ps' 'sent continue signal to photoshop'
