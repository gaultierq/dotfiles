#!/bin/sh -e

for f in $DOTPATH/etc/init/*/source_*; do
	[ -f $f ] && . $f
done
