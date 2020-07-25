#Import Active Directory 
#$AddGroup = Users

Import-Module ActiveDirectory

$Users = Import-Csv -Path "c:\Users\nicholas.chang\Documents\Scripts\newusers.csv"            
foreach ($User in $Users)            
{            
    $Displayname = $User.FirstName + " " + $User.Lastname            
    $UserFirstname = $User.Firstname            
    $UserLastname = $User.Lastname            
    $OU = $User.OU           
    $SAM = $User.SAM      
    $email = $User.$email  
    $telephone = $User.$telephone
    $Description = $User.Description
    $department = $User.department 
    $jobtitle   = $User.jobtitle
    $Password = $User.Password  
    
    New-ADUser `
    -Name $Displayname -DisplayName $Displayname -SamAccountName $SAM -UserPrincipalName "$SAM@cloudtechgenius.com" `
    -GivenName $UserFirstname -Surname $UserLastname -Department $department `
    -Description $Description -EmailAddress $User.email -Title $jobtitle -OfficePhone $telephone `
    -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true `
    -Path "$OU"  -ChangePasswordAtLogon $true  –PasswordNeverExpires $false 
   
     Write-Host $User.SAM "created successfully"
 #   Add-ADGroupMember -Identity $group -Members $AddGroup
}