#!/bin/sh
alias cbh="echo 'Fully clearing bash history, then exiting...' && cat /dev/null > ~/.bash_history && history -c && history -w && exit"
