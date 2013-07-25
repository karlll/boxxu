#!/bin/bash

OP=$1

#if [ ! -f VagrantFile ]; then
#    bundle exec vagrant init 'boxxu'
#fi

if [ "$OP" == "start" ]; then
	bundle exec vagrant up
	bundle exec vagrant ssh

elif [ "$OP" == "stop" ]; then
	bundle exec vagrant halt
else
	echo "usage: $0 [start|stop]"
fi
