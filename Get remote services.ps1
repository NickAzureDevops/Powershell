#get-services 
Param ( 
        
        [Parameter(Mandatory=$true)]
        [string[]]    # [] After the string accepts multiple inputs 
        $Computername
        
)
# create varible objects for get-service 

$Service = Get-service -ComputerName $Computername

# Foreach to perform action on each objects in $service

Foreach ($service in $services) {

    #create a varible containing status and displayname using member enumeration

    $ServiceStatus = $service.status
    $ServiceDisplayName = $Service.displayname

    if ($ServiceStatus -eq 'Running') {
        Write-Output "Service OK - Status of $ServiceDisplayName is $ServiceStatus"
    }
    Else { 
        Write-Output "Check Service - Status of $ServiceDisplayName is $ServiceStatus"
    }
    }