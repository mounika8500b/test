$remoteFilePath = 'C:\Intel'
Copy-Item -Path C:\Users\Mounika.Bethu\email_cred.txt -Destination $remoteFilePath
Write-Host "I've just copied the file to $remoteFilePath"

$VerbosePreference = "Continue"
$LogPath = Split-Path $MyInvocation.MyCommand.Path
Get-ChildItem "$LogPath\*.log" | Where LastWriteTime -LT (Get-Date).AddDays(-15) | Remove-Item -Confirm:$false
$LogPathName = Join-Path -Path $LogPath -ChildPath "$($MyInvocation.MyCommand.Name)-$(Get-Date -Format 'MM-dd-yyyy').log"
Start-Transcript $LogPathName -Append