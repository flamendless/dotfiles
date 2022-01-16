<#
.SYNOPSIS
    Generate customer JWT token ready to be pasted in the GraphQL playground
.DESCRIPTION
    Generate customer JWT token ready to be pasted in the GraphQL playground
.PARAMETER mobile_number
	mobile_number to use
.EXAMPLE
	* First usage is omitting the arguments:
		C:\PS>./get_token_customer.ps1
		the script will prompt you for mobile_number

	* Second usage is passing arguments to CLI:
		C:\PS>./get_token_customer.ps1 -mobile_number 639505124351
.NOTES
    Author: Brandon Blanker Lim-it
    Date:   January 16, 2022
#>

param (
	[Parameter(Mandatory = $true)] $mobile_number
)

$url = "https://develop.smop.asia/graphql/"

$res_otp = Invoke-WebRequest -UseBasicParsing -Uri "$url" `
	-Method "POST" `
	-Headers @{
		"accept"="*/*"
		"Origin"="$url"
	} `
	-ContentType "application/json" `
	-Body "{`"query`":`"mutation {mobileOtpGenerate(input: {mobileNo: \`"$mobile_number\`"}){mobileOtp {id, dateGenerated, status, attempt}}}`"}"
if ($res_otp.statuscode -ne "200") { echo $res_otp.statuscode ; Exit }
$id = (ConvertFrom-Json $res_otp.Content).data.mobileOtpGenerate.mobileOtp.id
echo "ID: $id"
$pin = Read-Host -Prompt "Enter PIN"

$res_verify = Invoke-WebRequest -UseBasicParsing -Uri "$url" `
	-Method "POST" `
	-Headers @{
		"accept"="*/*"
		"Origin"="$url"
	} `
	-ContentType "application/json" `
	-Body "{`"query`":`"mutation {mobileOtpVerify(id: \`"$id\`", pin: \`"$pin\`"){mobileOtp {id, status} otpErrors {field, message}}}`"}"
if ($res_verify.statuscode -ne "200") { echo $res_verify.statuscode ; Exit }
$status_ver = (ConvertFrom-Json $res_verify.Content).data.mobileOtpVerify.mobileOtp.status
echo "Verification status: $status_ver"

$should_create_customer = Read-Host -Prompt "Do you want to create smop customer? [y/n] (no input defaults to no)"
if ($should_create_customer -eq "y")
{
	$fname = Read-Host -Prompt "Enter first name"
	$lname = Read-Host -Prompt "Enter last name"
	$gender = Read-Host -Prompt "Enter gender [MALE, FEMALE, NON_BINARY, PREFER_NOT_TO_SAY]"
	$year = Read-Host -Prompt "Enter year (ex. 1997)"
	$month = Read-Host -Prompt "Enter month (ex. 11)"
	$day = Read-Host -Prompt "Enter day (ex. 02)"
	$email = Read-Host -Prompt "Enter email"

	$res_create = Invoke-WebRequest -UseBasicParsing -Uri "$url" `
		-Method "POST" `
		-Headers @{
			"accept"="*/*"
			"Origin"="$url"
		} `
		-ContentType "application/json" `
		-Body "{`"query`":`"mutation {smopCustomerCreate(mobileOtp: \`"$id\`" input: {firstName: \`"$fname\`" lastName: \`"$fname\`" gender: $gender dateOfBirth: \`"$year-$month-$day\`" email: \`"$email\`" contactNo: \`"$mobile_number\`"}) {user {id, status} accountErrors {field, message}}}`"}"
	if ($res_create.statuscode -ne "200") { echo $res_create.statuscode ; Exit }
	$status_creation = (ConvertFrom-Json $res_create.Content).data.smopCustomerCreate.user.status
	echo "Creation status: $status_creation"
}


$res_login = Invoke-WebRequest -UseBasicParsing -Uri "$url" `
	-Method "POST" `
	-Headers @{
		"accept"="*/*"
		"Origin"="$url"
	} `
	-ContentType "application/json" `
	-Body "{`"query`":`"mutation {smopCustomerLogin(contactNo: \`"$mobile_number\`", mobileOtp: \`"$id\`"){token accountErrors {field, message}}}`"}"
if ($res_login.statuscode -ne "200") { echo $res_login.statuscode ; Exit }
$token = (ConvertFrom-Json $res_login.Content).data.smopCustomerLogin.token
echo "Token: $token"
$str = "{""Authorization"":""JWT $token""}"
echo $str | clip.exe
echo "paste into your graphql playground now"
