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
  
}
  
   New-ADUser @newuser

   #Another Method 

   Import-Csv "NewUsers.csv" | ForEach-Object {
      $userPrinc = $_."Logon Username" + "@pca.hq"
      New-QADUser -Name $_.Name `
      -ParentContainer $_."Container" `
      -SamAccountName $_."Logon Username" `
      -UserPassword "pass123!ForWhat" `
      -FirstName $_."First Name" `
      -LastName $_."Last Name" `
      -LogonScript "students.bat" `
      -Description $_."Graduating Year" `
      -UserPrincipalName $userPrinc `
      -DisplayName $_."Name" ;`
      Add-QADGroupMember -identity $_."Graduating Year" -Member $_."Logon Username" ;`
      Set-QADUser -identity $_."Logon Username" `
      -UserMustChangePassword $true `
     }