$user = "ppgna\s003968"
$credential = Get-Credential –credential $user

$server = "wsus1111-fp2"

$TempFolder = "\\$server\C$\Temp"
If (Test-Path $TempFolder) {
        Write-Output "$TempFolder exists. Skipping."
    }
Else {
    Write-Output "The folder '$TempFolder' doesn't exist. This folder will be used for storing logs created after the script runs. Creating now."
    Start-Sleep 1
    New-Item -Path "$TempFolder" -ItemType Directory
    Write-Output "The folder $TempFolder was successfully created."
}

Invoke-Command -Computername $server -Credential $credential -ScriptBlock {&cmd.exe  /c "C:\PPG\FormulaPro\1\Build_1_install.cmd" }