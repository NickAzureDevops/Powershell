#Install Montior Driver to all domain computers 

#Export Computers from AD
#Get-ADComputer -Filter * -Property * | Select-Object Name | Export-CSV C:\Users\nicholaschang\Documents\ExportedADComputers.csv

#Import computer Extracted 
$computers = Import-Csv C:\Users\nicholaschang\Documents\Computers.csv

#display message
$messagebox = [System.Windows.Forms.MessageBox]::Show("Installation in progress.")

#Path to Driver on network share inside a script block 
$path = Start-Process '\\fsp-sr1\Departmental\Software\Hewlett Packard\DisplayLinkUSBGraphicsSoftwareforWindows.exe' -ArgumentList "/q" -Wait

foreach($computer in $computers) {
   
    Invoke-Command -ComputerName $computers.name -ScriptBlock $path $messagebox 
}








