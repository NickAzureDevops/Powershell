#Import Active Directory Module 
Import-Module ActiveDirectory 

#Import CSV with job title 
$JobsTitles = Import-Csv C:\tmp\Users.csv

Get-ADUser -Filter * | Select-Object *

foreach($User in $JobsTitles) 
{
    Get-ADUser $User.SamAccountName | Set-ADUser -Title $User.JobTitle
}