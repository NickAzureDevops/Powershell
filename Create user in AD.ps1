#Automate AD 

#Prompt for needed information
$firstname = Read-Host -Prompt 'Please enter the first name of the new user'
$surname = Read-Host -Prompt 'Please enter the last name of the new user'
$User    = Read-Host 'Please enter a USPN'
$Email   = Read-Host 'Enter Email'
#$member = Read-Host 'Please Enter a Group to Add to user'


#hash table  

$newuser = @{
    'SamAccountName'        = $User
    'UserPrincipalName'     = $User 
    'Name'                  = $firstname
    'EmailAddress'          = $Email 
    'GivenName'             = $firstname 
    'Surname'               = $surname 
    'DisplayName'           = “$Displayname” 
    'AccountPassword'       = Read-Host -AsSecureString "Input Password"
    'ChangePasswordAtLogon' = $false  
    'Enabled'               = $true 
   # 'GroupMember'           = $member
  
}
  
   New-ADUser @newuser