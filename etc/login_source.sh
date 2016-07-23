#!/bin/sh -e


safe_source() {
	for f in "$@"; do
		[ -f $f ] && . $f
	done
}


echo "login_source"
safe_source "$DOTPATH/init/aliases" \
			"$DOTPATH/init/functions" \
			"$DOTPATH/init/exports" \
			"$DOTPATH/etc/vital.sh"