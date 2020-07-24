# Get operating systems 
$OS = (Get-CimInstance Win32_OperatingSystem -ComputerName DC01).caption
$OS

#Disk freespace from c drive
$drive = Get-WmiObject -class win32_logicaldisk | where-object DeviceID -EQ 'C:'
$Freespace = (($drive.Freespace/1gb)) # divide by 1
$drive
$freespace

#Amount of system memory 
$MemoryGB = (((Get-CimInstance Win32_PhysicalMemory -ComputerName Dc01).Capacity|measure -Sum).Sum/1GB)
$MemoryGB

#memory of remote 
Get-CimInstance Win32_PhysicalMemory -ComputerName DC01
(Get-CimInstance Win32_PhysicalMemory -ComputerNAme DC01).Capacity
(Get-CimInstance Win32_PhysicalMemory -ComputerNAme DC01).Capacity | measure -Sum
(((Get-CimInstance Win32_PhysicalMemory -ComputerName DC01).Capacity | measure -Sum).Sum)# memory enumerate
((((Get-CimInstance Win32_PhysicalMemory -ComputerName DC01).Capacity | measure -Sum).Sum)/1GB) # remote memory of gb

#last reboot of remote server

$lastReboot = (Get-CimInstance -Class Win32_OperatingSystem -ComputerName DC01).LastBootUpTime
$lastReboot

#DNS and IP Info
$DNS = Resolve-DNSName -Name DC01 | where-object Type -eq "AAA"
$DNSName = $DNS.Name 
$DNSIP = $DNS.IPaddress 
$DNS
$DNSName
$DNSIP

#DNS and IP Info
$CimSession = New-CimSession -ComputerName aduk02 -Credential (Get-Credential)
(Get-DNSClientServerAddress -cimsession $cimsession -InterfaceAlias "ethernet" -AddressFamily IPV4).ServerAddress

# Set the admin credential
# ForEach {
    "Processing computername $_"
    Invoke-Command -ComputerName $_ -ScriptBlock {
    # Get the DNS address information for the target
    Get-DnsClientServerAddress
    } -Credential $Creds
    "`n" # line break

$Session = New-CimSession -ComputerName aduk02
Get-DnsClientServerAddress -CimSession $Session