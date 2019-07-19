#
# Copyright (c) 2019 Stefaan Coussement
# MIT License
#
# more info: https://github.com/stefaanc/ptsession
#
# use:
#
#     New-PTSession.ps1 "root@my-server" -Theme "$Theme"
#
# with f.i. $Theme = "$ROOT\colors\ptsession-putty-improved.json"
#
#     {
#         "Colour0": "160,160,160",
#         "Colour1": "255,255,255",
#         "Colour2": "0,0,0",
#         "Colour3": "85,85,85",
#         "Colour4": "0,0,0",
#         "Colour5": "0,255,0",
#         "Colour6": "0,0,0",
#         "Colour7": "85,85,85",
#         "Colour8": "187,0,0",
#         "Colour9": "255,85,85",
#         "Colour10": "0,187,0",
#         "Colour11": "85,255,85",
#         "Colour12": "187,187,0",
#         "Colour13": "255,255,85",
#         "Colour14": "74,74,255",
#         "Colour15": "140,140,255",
#         "Colour16": "187,0,187",
#         "Colour17": "255,85,255",
#         "Colour18": "0,187,187",
#         "Colour19": "85,255,255",
#         "Colour20": "187,187,187",
#         "Colour21": "255,255,255"
#     }
#
# other optional parameters/switches:
#
#    -WinTitle "$WinTitle"
#    -HostName "$HostName"
#    -UserName "$UserName"
#    -PublicKeyFile "$PublicKeyFile"
#    -RemoteCommand "$RemoteCommand"
#    -LogFileName "$LogFileName"
#
# the session definition will be based on the 'default-settings.reg' file
# the theme colour definitions and other parameters will be added to the session definition
#
param(
    [Parameter(Mandatory=$true, Position=0)][string]$Name,
    [string]$WinTitle,
    [string]$HostName,
    [string]$UserName,
    [Alias("PrivateKeyFile")][string]$PublicKeyFile,
    [string]$Theme,
    [string]$RemoteCommand,
    [string]$LogFileName
)

$ErrorActionPreference = 'Stop'

if ( $Theme ) {
    $colors = $( Get-Content -Raw -Path "$Theme" | ConvertFrom-Json )
}

$key = "$Name".Replace(" ", "%20")
if ( Get-Item -Path "HKCU:\Software\SimonTatham\PuTTY\Sessions\$key" -ErrorAction 'Ignore' ) {
    Remove-Item -Path "HKCU:\Software\SimonTatham\PuTTY\Sessions\$key" -Recurse
}

Push-Location
Set-Location "HKCU:\Software\SimonTatham\PuTTY\Sessions"

#
# copy default settings
Copy-Item -Path "Default%20Settings" -Destination "$key" -Force

#
# add parameters
if ( -not $WinTitle ) {
    $WinTitle = $Name
}
New-ItemProperty -Path "$key" -PropertyType 'String' -Name "WinTitle" -Value "$WinTitle" -Force

if ( $HostName ) {
    New-ItemProperty -Path "$key" -PropertyType 'String' -Name "HostName" -Value "$HostName" -Force
}

if ( $UserName ) {
    New-ItemProperty -Path "$key" -PropertyType 'String' -Name "UserName" -Value "$UserName" -Force
}

if ( $PublicKeyFile ) {
    New-ItemProperty -Path "$key" -PropertyType 'String' -Name "PublicKeyFile" -Value "$PublicKeyFile" -Force
}

if ( $Theme ) {
    $colors.PSObject.Properties | ForEach-Object -Process {
        New-ItemProperty -Path "$key" -PropertyType 'String' -Name $_.Name -Value $_.Value -Force
    }
}

if ( $RemoteCommand ) {
    New-ItemProperty -Path "$key" -PropertyType 'String' -Name "RemoteCommand" -Value "$RemoteCommand" -Force
}

if ( $LogFileName ) {
    New-ItemProperty -Path "$key" -PropertyType 'DWord' -Name "LogType" -Value 2 -Force
    New-ItemProperty -Path "$key" -PropertyType 'String' -Name "LogFileName" -Value "$LogFileName" -Force
}

Pop-Location
exit 0