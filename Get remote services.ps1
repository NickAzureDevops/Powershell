Param ( 
        [Parameter(Mandatory=$true)]
        [string[]]    # [] After the string accepts multiple inputs 
        $Computername  
    )

    foreach ($target in $Computername) 
    {
        get-service -ComputerName $Computername | 
        Where-Object -Property Status -eq 'Stopped'
    }
    
#     find all the stopped services 
#     $Computername = "Client02"
#   get-service -ComputerName $Computername | Where-Object -Property Status -eq 'Stopped' 