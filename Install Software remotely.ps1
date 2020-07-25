$computers = Import-Csv C:\Users\nicholaschang\Documents\Computers.csv 
#$ADGroupmember =  (later wants to make all the user in certain AD group run the script )
$installer = C:\Users\nicholaschang\Documents\VPNClient\Forcepoint-6.6.0.6605.exe
#$Arg = '/s' #installer silently 
$TempDirectory = C:\temp
#$GroupOU = "OU=Software Distribution,DC=Test,DC=LOCAL" 

#copy item from network share to local computer in temp folder. 
foreach ($computer in $computers) 
{

try {
    Copy-Item -Path $installer -Destination $TempDirectory -Force  
    }
    
    catch { "An error occurred." } 
    
    If ($TempDirectory = $False) 
    {New-Item -ItemType Directory -Force -Path C:\Temp #create new directory if folder do not exist
         {
            #Install the application from temp folder 
            (Start-Process -FilePath C:\Software\chrome.exe -ArgumentList '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' -Wait -Passthru).ExitCode
           # Invoke-Command -ComputerName $computers.name -ScriptBlock $TempDirectory -ArgumentList "--quiet" -Verb RunAs -Wait -NoNewWindow }
            Remove-Item $TempDirectory
        }
}  