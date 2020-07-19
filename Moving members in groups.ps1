Import-Module ActiveDirectory

$MemberList = (Get-ADGroupmember -Identity "Leadership Team") | 
Add-ADGroupMember -Identity "Weeklybooking Group" -Members $MemberList

Or

Get-ADGroupMember "Leadership Team" | ForEach-Object {Add-ADGroupMember -Identity "Weeklybooking Group" -Members $_}