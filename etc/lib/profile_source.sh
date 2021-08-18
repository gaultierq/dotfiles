#!/bin/sh -e

for f in $DOTPATH/etc/init/*/profile_source_*; do
	[ -f $f ] && . $f
done
