#!/bin/sh -e

for f in $DOTPATH/etc/init/common/source*; do
	[ -f $f ] && . $f
done