#!/bin/bash


if [ ! -f VagrantFile ]; then
    bundle exec vagrant init 'boxxu'
fi

bundle exec vagrant up
bundle exec vagrant ssh
