#!/bin/bash

echo "## Installing gems"
bundle install
echo "## Building"
bundle exec veewee vbox build 'boxxu' --nogui
echo "## Verifying build"
bundle exec veewee vbox validate 'boxxu'
echo "## Exporting"
bundle exec vagrant basebox export 'boxxu' # Workaround since the line below does not work
# bundle exec veewee vbox export 'boxxu'
bundle exec vagrant box add 'boxxu' 'boxxu.box'
