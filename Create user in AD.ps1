#Import Active Directory 

Import-module activedirectory

#Import CSV 
$users = Import-Csv -Path c:\scripts\newusers 

# Create a hash table with parameters
$users = @{
    'SamAccountName'        = $UserName
    'UserPrincipalName'     = $FirstnameSurname
    'Name'                  = $Forname
    'EmailAddress'          = $Email 
    'GivenName'             = $Fornavn 
    'Surname'               = $Etternavn 
    'DisplayName'           = $Displayname
    'AccountPassword'       = $password 
    'ChangePasswordAtLogon' = $true 
    'Enabled'               = $true 
    'Path'                  = $OUPath
    'Title'                 = $jobtitle
    'Department'            = $Department 
    'OfficePhone'           = $telephone
}

# Call New-ADUser with the parameters set above
New-ADUser @users

test
