#!/bin/sh -e

[ -f ~/.source_vital ] && . ~/.source_vital

# sourcing my own functions and exports etc.
[ -f "$DOTPATH/etc/lib/login_source.sh" ] && . "$DOTPATH/etc/lib/login_source.sh"

