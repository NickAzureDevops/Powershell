Import-Module activedirectory

#Get-ADComputer -Filter * -Property * | Select-Object Name,OperatingSystem,OperatingSystemVersion,ipv4Address |
 #Export-CSV ADcomputerslist.csv | Select-Object OperatingSystemVersion 

Get-Item -Path HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductName\
#HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ReleaseId