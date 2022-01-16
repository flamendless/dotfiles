<#
.SYNOPSIS
    Generate JWT token ready to be pasted in the GraphQL playground
.DESCRIPTION
    Generate JWT token ready to be pasted in the GraphQL playground
.PARAMETER email
	email address to use
.PARAMETER pw
	password to use
.PARAMETER url
	url to use (to query to)
.EXAMPLE
	* First usage is omitting the arguments:
		C:\PS>./get_token.ps1
		the script will prompt you for email, pw, and url

	* Second usage is passing arguments to CLI:
		C:\PS>./get_token.ps1 -email myemail@mail.com -pw mypassword -url localhost
.NOTES
    Author: Brandon Blanker Lim-it
    Date:   January 13, 2022
#>

param (
	[Parameter(Mandatory = $true)] $email,
	[Parameter(Mandatory = $true)] $pw,
	[Parameter(Mandatory = $true)] $url
)

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
