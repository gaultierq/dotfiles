#!/bin/zsh

zle -N kcs-widget kcs
bindkey '^K' kcs-widget
