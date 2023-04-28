#!/bin/sh

# Set name and mail adress
git config --global user.name "Julian Buecher"
git config --global user.email "julian.buecher@gmx.de"

# Set rebase as default pull strategy
git config --global pull.rebase true

alias graph='log --graph --pretty="%C(bold blue) Hash: %h %C(bold green)Date: %ad %C(black) Message: %s " --date=human'
