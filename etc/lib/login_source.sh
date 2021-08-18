#!/bin/sh -e

for f in $DOTPATH/etc/init/*/login_source_*; do
	[ -f $f ] && . $f
done
