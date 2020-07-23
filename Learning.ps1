$computerName = 'ADUK02'
$credentials = Get-Credential

$cimsession = New-CimSession -ComputerName $computerName -Credential $credentials
$cimsession 

#view stopped services 
$hostname = Read-Host 'Enter Computer Name'
$stoppedservices = get-service -ComputerName $hostname |  Where-Object -Property status -EQ 'Stopped'
Write-Output $stoppedservices

$computername = read-host "Please Enter Computer Name"
Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $computername | Select-Object -Property CSName,LastBootupTime

#Add variable to invoke- $data = invoke-command -Computer $computerName -Credentials $credentials -scriptblock {get-service -ComputerName $using:ComputerName} need to use $using variable in order to be read into the script block

Get-Alias Get-ChildItem
Set-ADAccountPassword jfrost -NewPassword
Set-ADUser jfrost -ChangePasswordAtLogon $True - changed at login 
get-aduser -filter "enabled -eq 'false'" - Or I could pipe in a bunch of users and delete them with one simple command:
-property WhenChanged -SearchBase "OU=Employees,
etsn -ComputerName
Get-service b* | where-Object {$_.DisplayName -match “.+user”}