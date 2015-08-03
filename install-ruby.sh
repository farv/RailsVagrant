#!/usr/bin/env bash
source /usr/local/rvm/scripts/rvm
rvm group add rvm "$USER"
rvm use --install $1
shift
if (( $# )) 
	then gem install $@
fi
rvm use ruby --default 2.2.1
rvm group add rvm "vagrant"