#Import-Module activedirectory

Get-ADComputer -Filter * -Property * | Select-Object Name,OperatingSystem,OperatingSystemVersion,ipv4Address,ReleaseId
Export-CSV ADcomputerslist.csv | Select-Object OperatingSystemVersion 

(Get-Item -Path "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion").getvalue('ReleaseID') 

#HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ReleaseId

Get-ADComputer -Filter * -Properties Name, OperatingSystem, OperatingSystemVersion |
Select-Object Name, OperatingSystem, OperatingSystemVersion | Sort-Object Name | Format-Table 
