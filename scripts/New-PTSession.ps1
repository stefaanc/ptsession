#
# Copyright (c) 2019 Stefaan Coussement
# MIT License
#
# more info: https://github.com/stefaanc/ptsession
#
# use:
#
#     New-PTSession.ps1 "root@my-server" "$Theme"
#
# with f.i. $Theme = "$ROOT\colors\ptsession-putty-improved.txt"
#
#     "Colour0"="160,160,160"
#     "Colour1"="255,255,255"
#     "Colour2"="0,0,0"
#     "Colour3"="85,85,85"
#     "Colour4"="0,0,0"
#     "Colour5"="0,255,0"
#     "Colour6"="0,0,0"
#     "Colour7"="85,85,85"
#     "Colour8"="187,0,0"
#     "Colour9"="255,85,85"
#     "Colour10"="0,187,0"
#     "Colour11"="85,255,85"
#     "Colour12"="187,187,0"
#     "Colour13"="255,255,85"
#     "Colour14"="74,74,255"
#     "Colour15"="140,140,255"
#     "Colour16"="187,0,187"
#     "Colour17"="255,85,255"
#     "Colour18"="0,187,187"
#     "Colour19"="85,255,255"
#     "Colour20"="187,187,187"
#     "Colour21"="255,255,255"
#
# the session definition will be based on the 'default-settings.reg' file
# the theme colour definitions will be added to the session definition
#
param(
    [Parameter(Mandatory=$true, Position=0)][string]$Name,
    [Parameter(Mandatory=$true, Position=1)][string]$Theme,
    [Parameter(Position=2)][string]$HostName,
    [Parameter(Position=3)][string]$PublicKeyFile,
    [Parameter(Position=4)][string]$WinTitle
)

$ErrorActionPreference = 'Stop'

New-Item -ItemType 'file' -Path "./_.reg" -Force

#
# pick-up default settings, skip settings we will add, replace session name
( Get-Content -Path "$ROOT/colors/ptsession-default-settings.reg" ) | ForEach-Object -Process {
    if ( "$_" -like "*Default%20Settings*" ) {
        "$_".Replace("Default%20Settings", "$Name".Replace(" ", "%20")) | Out-File "./_.reg" -Append
    }
    elseif ( "$_".StartsWith('"Colour') ) {}
    elseif ( "$_".StartsWith('"HostName"=') ) {}
    elseif ( "$_".StartsWith('"PublicKeyFile"=') ) {}
    elseif ( "$_".StartsWith('"WinTitle"=') ) {}
    else {
        $_ | Out-File "./_.reg" -Append
    }
}

#
# add colours
( Get-Content -Path "$Theme" ) | ForEach-Object -Process {
    $_ | Out-File "./_.reg" -Append
}

#
# add other parameters
if ( -not $HostName ) {
    $HostName = $Name
}
"`"HostName`"=`"$HostName`"" | Out-File "./_.reg" -Append

if ( $PublicKeyFile ) {
    "`"PublicKeyFile`"=`"$( $PublicKeyFile.Replace("\", "\\") )`"" | Out-File "./_.reg" -Append
}

if ( -not $WinTitle ) {
    $WinTitle = $Name
}
"`"WinTitle`"=`"$WinTitle`"" | Out-File "./_.reg" -Append

#
# import in registery
reg import "./_.reg"

Remove-Item -Path "./_.reg" -Force

exit 0