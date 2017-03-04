#!/bin/bash

declare -r BASH=$HOME/.bashrc
declare -r HOME_BIN=$HOME/.bin
declare -r HOME_BASH=$HOME/.bashrc.d
declare -r HOME_COMPLETION=$HOME/.bash_completion.d

function install_home_bin {
cat >> $BASH <<EOF 
# $HOME_BIN
export PATH=$PATH:$HOME/.bin

EOF
}

function install_home_bash {
cat >> $BASH <<EOF
# $HOME_BASH
for file in $HOME/$HOME_BASH; do
	[ -f $file ] && source $file
done

EOF
}

function install_home_completion {
cat >> $BASH <<EOF
# $HOME_COMPLETION
for file in $HOME/$HOME_COMPLETION; do
	[ -f $file ] && source $file
done

EOF
}

if [ ! -d $HOME/$HOME_BIN ]; then
	mkdir $HOME/$HOME_BIN 2> /dev/null
	install_home_bin
fi

if [ ! -d $HOME/$HOME_BASH ]; then
	mkdir $HOME/$HOME_BASH 2> /dev/null
	install_home_bash
fi

if [ ! -d $HOME/$HOME_COMPLETION ]; then
	mkdir $HOME/$HOME_COMPLETION 2> /dev/null
	install_home_completion
fi
