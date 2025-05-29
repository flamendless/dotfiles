#!/usr/bin/env bash

rgq() {
	if [ "$#" -lt 2 ]; then
		echo "Usage: rgq <pattern> <path>"
		return 1
	fi

	local pattern=$1
	local path=$2
	local tmpfile="/tmp/rg_results"

	rg -S -n "$pattern" "$path" > "$tmpfile" && nvim -q "$tmpfile" -c copen
}

if [ "$1" = "rgq" ] && [ "$#" -eq 3 ]; then
	echo "Running: $1 '$2' '$3'"
	rgq "$2" "$3"
else
	echo "Error: Invalid command"
	exit 1
fi
