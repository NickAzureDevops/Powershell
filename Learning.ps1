$computerName = 'IPD19298'
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