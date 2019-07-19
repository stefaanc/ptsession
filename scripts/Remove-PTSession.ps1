#
# Copyright (c) 2019 Stefaan Coussement
# MIT License
#
# more info: https://github.com/stefaanc/ptsession
#
# use:
#
#     Remove-PTSession.ps1 "root@my-server"
#
# or:
#
#     Remove-PTSession.ps1 -All
#
param(
    [Parameter(Position=0)][string]$Name,
    [switch]$All
)

$ErrorActionPreference = 'Stop'

if ( $All ) {
    ( Get-ChildItem -Path "HKCU:\Software\SimonTatham\PuTTY\Sessions" ) | ForEach-Object -Process {
        if ( $_.PSChildName -ne "Default%20Settings" ) {
            Remove-Item -Path "HKCU:\Software\SimonTatham\PuTTY\Sessions\$( $_.PSChildName )" -Recurse
        }
    }
}
elseif ( $Name ) {
    $key = "$Name".Replace(" ", "%20")
    if ( Get-Item -Path "HKCU:\Software\SimonTatham\PuTTY\Sessions\$key" -ErrorAction 'Ignore' ) {
        Remove-Item -Path "HKCU:\Software\SimonTatham\PuTTY\Sessions\$key" -Recurse
    }
}

exit 0
