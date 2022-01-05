#!/bin/sh
# script for WSL2 -> Windows workflow
# - Brandon Blanker Lim-it

win_path=/mnt/c/Windows/System32
alias cmd.exe="$win_path"/cmd.exe
alias clip.exe="$win_path"/clip.exe

function activate()
{
	echo "activating..."
	source saleor-venv/bin/activate
}

function migrate()
{
	echo "migrating..."
	python3.8 manage.py migrate -v 3
}

function serve()
{
	echo "serving..."
	python3.8 manage.py runserver 0.0.0.0:8000
}

function get_addr()
{
	local addr=$(ip a | grep inet | grep eth0 | grep -P "((\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}).*?" -o | head -n 1)
	echo $addr:8000
}

function copy_to_clipboard()
{
	local addr="${1:-$(get_addr)}"

	if ! command -v clip.exe &> /dev/null; then
		echo "clip.exe not found... Trying x server... Make sure VcXsrv is running!"
		echo $addr | xclip -sel clipboard
	else
		echo "using Windows clip.exe..."
		echo $addr | clip.exe
	fi
}

function open_playground()
{
	local addr="${1:-$(get_addr)}"

	if ! command -v cmd.exe &> /dev/null; then
		echo "cmd.exe not found"
		return
	fi

	cmd.exe /c "start chrome $1/graphql/"
}

if [ "$#" -eq 0 ]; then
	echo "First use: chmod +x run.sh"
	echo "Usage: ./run.sh"
	echo "\tIt will run the API server and open graphql playground in Windows' chrome browser"
	echo "Possible commands: activate, get_addr, copy_to_clipboard, open_playground, serve"
	activate
	addr=$(get_addr)
	copy_to_clipboard "$addr"
	open_playground "$addr"
	serve
elif [ "$#" -eq 1 ]; then
	"$1"
fi
