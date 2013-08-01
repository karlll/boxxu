#!/bin/bash

OP=$1

if [ "$OP" == "build" ]; then

	echo "## Installing gems"
	bundle install
	echo "## Building"
	bundle exec veewee vbox build 'boxxu' --force --nogui
	echo "## Verifying build"
	bundle exec veewee vbox validate 'boxxu'
	echo "## Exporting"
	bundle exec vagrant basebox export 'boxxu' # Workaround since the line below does not work
	# bundle exec veewee vbox export 'boxxu'
	bundle exec vagrant box add 'boxxu' 'boxxu.box'

elif [ "$OP" == "start" ]; then

	bundle exec vagrant up
	bundle exec vagrant ssh

elif [ "$OP" == "connect" ]; then

	bundle exec vagrant ssh

elif [ "$OP" == "stop" ]; then

	bundle exec vagrant halt

else

	echo "usage: $0 [build|start|connect|stop]"
	exit 1

fi
