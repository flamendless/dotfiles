#! /bin/sh
# script for WSL2 -> Windows workflow
# - Brandon Blanker Lim-it

win_path=/mnt/c/Windows/System32
alias cmd.exe="$win_path"/cmd.exe
alias clip.exe="$win_path"/clip.exe

function activate()
{
	echo "activating venv..."
	source saleor-venv/bin/activate
	echo "activated venv"
}

function migrate()
{
	echo "migrating..."
	python3.8 manage.py makemigrations
	python3.8 manage.py migrate -v 3
	echo "migrated"
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

function gen_token()
{
	if [ "$#" -lt 2 ]; then
		echo "usage: ./wsl_run.sh gen_token <EMAIL> <PW>"
		echo "example: ./wsl_run.sh gen_token <EMAIL> <PW> https://develop.smop.asia"
		exit
	fi

	local email="$2"
	local pw="$3"
	local url="${4:-http://$(get_addr)}/graphql/"
	local origin="origin: $4"
	local sec_fetch_site="sec-fetch-site: same-origin"
	local sec_fetch_mode="sec-fetch-mode: cors"
	local sec_fetch_dest="sec-fetch-dest: empty"
	local ref="referer: $url"
	local filename=/tmp/smop_token.json

	while :; do
		local query=$(jq -Rs . <<< "mutation {tokenCreate(email: \"$email\", password: \"$pw\"){token}}")
		curl \
			-H "Content-Type: application/json" \
			-H "accept: */*" \
			-H "$origin" \
			-H "$sec_fetch_site" \
			-H "$sec_fetch_mode" \
			-H "$sec_fetch_dest" \
			-H "$ref" \
			-o "$filename" \
			"$url" -d "{\"query\": ${query}}"
		local res=$?

		if [ $res -eq 0  ]; then
			local data=$(jq .data.tokenCreate.token < "$filename")
			data=$(echo "$data" | tr -d '"')
			echo $data
			echo "{\"Authorization\":\"JWT $data\"}" | clip.exe
			rm "$filename"
			break
		else
			echo "the url might be incorrect or the server is down."
			echo "retrying after 3 seconds..."
			sleep 3
		fi
	done
}

function run()
{
	echo "running..."
	activate
	addr=$(get_addr)
	copy_to_clipboard "$addr"
	open_playground "$addr"
	serve
}

if [ "$#" -eq 0 ]; then
	echo "First use: chmod +x run.sh"
	echo "Usage: ./run.sh"
	echo "\tIt will run the API server and open graphql playground in Windows' chrome browser"
	echo "Possible commands: activate, get_addr, copy_to_clipboard, open_playground, serve, gen_token"
	cd ~/smopbackend
else
	cd ~/smopbackend
	"$1" "$@"
fi
