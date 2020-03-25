#deployed inf windows driver from folder. 
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Get-ChildItem "\\fsp-sr1\Departmental\Software\Hewlett Packard\x64" -Recurse -Filter "*inf"| 
ForEach-Object { PNPUtil.exe /add-driver $_.FullName /install } 