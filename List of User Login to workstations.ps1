#Current user logon to a machine 

Get-WmiObject -class Win32_ComputerSystem | Format-List Username 

#list of user who currently login into a workstation if it is a local or domain and how long for? 