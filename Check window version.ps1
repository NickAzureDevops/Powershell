#Import-Module activedirectory

Get-ADComputer -Filter * -Property * | Select-Object Name,OperatingSystem,OperatingSystemVersion,ipv4Address,ReleaseId
Export-CSV ADcomputerslist.csv | Select-Object OperatingSystemVersion 

(Get-Item -Path "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion").getvalue('ReleaseID') 

#HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ReleaseId

Get-ADComputer -Filter * -Properties Name, OperatingSystem, OperatingSystemVersion |
Select-Object Name, OperatingSystem, OperatingSystemVersion | Sort-Object Name | Format-Table 


#Get Computers from txt file 
Get-Content -path C:\users\nicholas.chang\Documents\Checkserveronline.txt | ForEach-Object {
    if (Test-Connection -ComputerName $_ -Quiet -Count 1) {
       $operating_stystem = Get-CimInstance -ComputerName $_ -ClassName 'Win32_OperatingSystem' | Select-Object BuildNumber,Caption
       $operating_stystem
    }
}