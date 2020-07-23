Get-Content -path C:\users\nicholas.chang\Documents\Checkserveronline.txt | ForEach-Object {
    if (Test-Connection -ComputerName $_ -Quiet -Count 1) {
       $operating_stystem = Get-CimInstance -ComputerName $_ -ClassName 'Win32_OperatingSystem' | Select-Object -ExpandProperty Caption
       "$_ - $operating_stystem"
    }
}