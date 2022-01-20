<#
.SYNOPSIS
    Generate JWT token ready to be pasted in the GraphQL playground
.DESCRIPTION
    Generate JWT token ready to be pasted in the GraphQL playground
.PARAMETER flag
	Environment flag to use.
	Possible:
		-s (Staging)
		-u (UAT)
		-p (Production)
		-d (Local)
.EXAMPLE
		C:\PS>./get_token.ps1 -s
		C:\PS>./get_token.ps1 -u
		C:\PS>./get_token.ps1 -p
		C:\PS>./get_token.ps1 -d
.NOTES
    Author: Brandon Blanker Lim-it
    Date:   January 13, 2022
#>

param (
	[Parameter(HelpMessage="-s for Staging env (env vars: SMOP_EMAIL_S, SMOP_PW_S, SMOP_URL_S)")]
	[switch]$s,

	[Parameter(HelpMessage="-u for UAT env (env vars: SMOP_EMAIL_U, SMOP_PW_U, SMOP_URL_U)")]
	[switch]$u,

	[Parameter(HelpMessage="-p for Production env (env vars: SMOP_EMAIL_P, SMOP_PW_P, SMOP_URL_P)")]
	[switch]$p,

	[Parameter(HelpMessage="-d for Local env (env vars: SMOP_EMAIL_D, SMOP_PW_D, SMOP_URL_D)")]
	[switch]$d
)

$c_env = ""
if ($s) {$c_env = "S"}
elseif ($u) {$c_env = "U"}
elseif ($p) {$c_env = "P"}
elseif ($d) {$c_env = "D"}
else
{
	echo "no flag for environment was passed"
	exit
}

$str_email = "SMOP_EMAIL_" + $c_env
$str_pw = "SMOP_PW_" + $c_env
$str_url = "SMOP_URL_" + $c_env

echo "checking for env variables..."
if ((Test-Path Env:$str_email) -eq $False)
{
	$new_email = Read-Host -Prompt "Enter email to be set to env var: $str_email"
	[Environment]::SetEnvironmentVariable($str_email, $new_email, "User")
	[Environment]::SetEnvironmentVariable($str_email, $new_email, "Process")
	echo "saving this in env vars so you wont need to retype next time"
}
if ((Test-Path Env:$str_pw) -eq $False)
{
	$new_pw = Read-Host -Prompt "Enter password to be set to env var: $str_pw"
	[Environment]::SetEnvironmentVariable($str_pw, $new_pw, "User")
	[Environment]::SetEnvironmentVariable($str_pw, $new_pw, "Process")
	echo "saving this in env vars so you wont need to retype next time"
}
if ((Test-Path Env:$str_url) -eq $False)
{
	$new_url = Read-Host -Prompt "Enter url to be set to env var: $str_url"
	[Environment]::SetEnvironmentVariable($str_url, $new_url, "User")
	[Environment]::SetEnvironmentVariable($str_url, $new_url, "Process")
	echo "saving this in env vars so you wont need to retype next time"
}

$email = (Get-Item Env:$str_email).Value
$pw = (Get-Item Env:$str_pw).Value
$url = (Get-Item Env:$str_url).Value
echo "Using email: $email"
echo "Using pw: $pw"
echo "Using url: $url"

$response = Invoke-WebRequest -UseBasicParsing -Uri "$url/graphql/" `
	-Method "POST" `
	-Headers @{
		"accept"="*/*"
		"Origin"="$url"
	} `
	-ContentType "application/json" `
	-Body "{`"query`":`"mutation {tokenCreate(email: \`"$email\`", password: \`"$pw\`") {token}}`"}"

if ($response.statuscode -eq "200")
{
	$token = (ConvertFrom-Json $response.Content).data.tokenCreate.token
	$str = "{""Authorization"":""JWT $token""}"
	echo $token
	echo $str | clip.exe
	echo "paste into your graphql playground now"
}
else
{
	echo $response
}
