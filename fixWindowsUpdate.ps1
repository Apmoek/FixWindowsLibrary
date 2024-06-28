# Ensure each command completes before proceeding
function Run-CommandWithWait {
    param (
        [string]$command
    )

    Start-Process -FilePath "cmd.exe" -ArgumentList "/c", $command -Wait
}

# Run commands
Run-CommandWithWait -command "net stop bits"
Run-CommandWithWait -command "net stop wuauserv"
Run-CommandWithWait -command "net stop appidsvc"
Run-CommandWithWait -command "net stop cryptsvc"
Run-CommandWithWait -command "Del `"$env:ALLUSERSPROFILE\Application Data\Microsoft\Network\Downloader\*.*`""
Run-CommandWithWait -command "rmdir `"$env:SystemRoot\SoftwareDistribution`" /S /Q"
Run-CommandWithWait -command "rmdir `"$env:SystemRoot\system32\catroot2`" /S /Q"
Run-CommandWithWait -command "regsvr32.exe /s atl.dll"
Run-CommandWithWait -command "regsvr32.exe /s urlmon.dll"
Run-CommandWithWait -command "regsvr32.exe /s mshtml.dll"
Run-CommandWithWait -command "netsh winsock reset"
Run-CommandWithWait -command "netsh winsock reset proxy"
Run-CommandWithWait -command "net start bits"
Run-CommandWithWait -command "net start wuauserv"
Run-CommandWithWait -command "net start appidsvc"
Run-CommandWithWait -command "net start cryptsvc"
Run-CommandWithWait -command "shutdown /r /f /t 5"
