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

function check_for_deps()
{
	local deps=(curl jq)
	local urls=(https://curl.se https://stedolan.github.io/jq/)

	for ((i = 0; i < ${#deps[@]}; ++i)); do
		local cmd="${deps[$i]}"
		local url="${urls[$i]}"
		echo "checking for dep: $cmd $url"
		type -P $cmd &>/dev/null  && continue  ||
			{
				echo "$cmd command not found.";
				echo "please install $url"
				exit 1;
			}
	done
}

function get_input()
{
	local str="$1"
	local is_pw="$2"
	local not_strict="$3"

	while :; do
		if [[ ! "$is_pw" ]] || [[ "$is_pw" == false ]]; then
			read -p "$str" input
		else
			read -sp "$str" input
		fi

		if [[ $not_strict ]]; then
			echo $input
			break
		fi

		if [[ $input != "" ]]; then
			echo $input
			break
		fi
	done
}

function curl_req()
{
	local url="$1"
	local query="$2"
	local props="$3"
	local is_token="$4"

	local origin="origin: $4"
	local sec_fetch_site="sec-fetch-site: same-origin"
	local sec_fetch_mode="sec-fetch-mode: cors"
	local sec_fetch_dest="sec-fetch-dest: empty"
	local filename=/tmp/smop_token.json

	while :; do
		curl \
			-H "Content-Type: application/json" \
			-H "accept: */*" \
			-H "$origin" \
			-H "$sec_fetch_site" \
			-H "$sec_fetch_mode" \
			-H "$sec_fetch_dest" \
			-o "$filename" \
			"$url" -d "{\"query\": ${query}}"
		local res=$?

		if [ $res -eq 0  ]; then
			local data=$(parse_token $filename $props)
			echo $data
			if [ $is_token ]; then
				echo "{\"Authorization\":\"JWT $data\"}" | clip.exe
			fi
			rm "$filename"
			break
		else
			echo "the url might be incorrect or the server is down."
			echo "retrying after 3 seconds..."
			sleep 2
		fi
	done
}

function parse_token()
{
	local filename="$1"
	local props="$2"
	local data=$(jq "$props" < "$filename")
	data=$(echo "$data" | tr -d '"')
	echo $data
}

function gen_token()
{
	echo "Usage #1: (prompt-mode) ./smop_wsl.sh gen_token (will ask for email, password, and url)"
	echo "Usage #2: (direct-mode) ./smop_wsl.sh gen_token <email> <password> <url>"
	echo "    example: ./smop_wsl.sh gen_token my@email.com somepassword develop.smop.asia"
	echo
	check_for_deps

	local email=${2:-$(echo $(get_input "Enter email: "))}
	local pw=${3:-$(echo $(get_input "Enter password: " true))}

	if [[ -z "$4" ]]; then
		echo
		local use_local_addr=$(echo $(get_input "Enter URL: (example: develop.smop.asia) (no input will use localhost): " false true))

		if [[ -z "$use_local_addr" ]]; then
			url=http://$(get_addr)
		else
			url=https://$use_local_addr
		fi
	else
		url=https://"$4"
	fi

	url="$url/graphql/"
	echo "will use $url"

	local query=$(jq -Rs . <<< "mutation
		{
			tokenCreate(email: \"$email\", password: \"$pw\")
			{
				token
			}
		}")
	local data=$(curl_req "$url" "$query" ".data.tokenCreate.token" true)
	echo $data
}

function gen_token_customer()
{
	echo "Usage #1: (prompt-mode) ./smop_wsl.sh gen_token_customer (will ask for mobile number)"
	echo "Usage #2: (direct-mode) ./smop_wsl.sh gen_token_customer <mobile_number>"
	echo "    example: ./smop_wsl.sh gen_token_customer 639500241705"
	echo
	check_for_deps

	local mobile_number=${2:-$(echo $(get_input "Enter mobile_number: "))}
	local url="https://develop.smop.asia/graphql/"
	local query_otp_gen=$(jq -Rs . <<< "mutation
		{
			mobileOtpGenerate(input: { mobileNo: \"$mobile_number\" })
			{
				mobileOtp {id dateGenerated status attempt}
				otpErrors { field message code }
			}
		}")
	local id=$(curl_req "$url" "$query_otp_gen" ".data.mobileOtpGenerate.mobileOtp.id")
	echo "id: $id"

	local pin=$(get_input "Enter PIN: ")
	local query_otp_verify=$(jq -Rs . <<< "mutation
		{
			mobileOtpVerify(id: \"$id\", pin: \"$pin\")
			{
				mobileOtp {id, status}
				otpErrors {field, message}
			}
		}")
	local status_ver=$(curl_req "$url" "$query_otp_verify" ".data.mobileOtpVerify.mobileOtp.status")
	echo "verification status: $status_ver"

	local should_create_customer=$(get_input "Do you want to create smop customer? [y/n] (no input defaults to no): " false true)
	if [[ "$should_create_customer" == "y" ]]; then
		local fname=$(get_input "Enter first name: ")
		local lname=$(get_input "Enter last name: ")
		local gender=$(get_input "Enter gender: [MALE, FEMALE, NON_BINARY, PREFER_NOT_TO_SAY] ")
		local year=$(get_input "Enter year: (ex: 1997) ")
		local month=$(get_input "Enter month: (ex: 11) ")
		local day=$(get_input "Enter day: (ex: 02) ")
		local email=$(get_input "Enter email: ")

		local query_customer_create=$(jq -Rs . <<< "mutation
			{
				smopCustomerCreate(
					mobileOtp: \"$id\"
					input: {
						firstName: \"$fname\"
						lastName: \"$lname\"
						gender: $gender
						dateOfBirth: \"$year-$month-$day\"
						email: \"$email\"
						contactNo: \"$mobile_number\"
					})
				{
					user {id, status}
					accountErrors {field, message}
				}
			}")
		local status_creation=$(curl_req "$url" "$query_customer_create" ".data.smopCustomerCreate.user.status")
		echo "creation status: $status_creation"
	elif [[ -z "$should_create_customer" ]] || [[ "$should_create_customer" == "n" ]]; then
		echo "skipping smop customer creation..."
	else
		echo "invalid input. skipping smop customer creation..."
	fi

	local query_customer_login=$(jq -Rs . <<< "mutation
		{
			smopCustomerLogin(contactNo: \"$mobile_number\", mobileOtp: \"$id\")
			{
				token
				accountErrors {field, message}
			}
		}")
	local token=$(curl_req "$url" "$query_customer_login" ".data.smopCustomerLogin.token" true)
	echo "token: $token"
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
	echo "Possible commands: activate, get_addr, copy_to_clipboard, open_playground, serve, gen_token, gen_token_customer"
	cd ~/smopbackend
else
	cd ~/smopbackend
	"$1" "$@"
fi
