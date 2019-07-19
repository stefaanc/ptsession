#
# Copyright (c) 2019 Stefaan Coussement
# MIT License
#
# more info: https://github.com/stefaanc/ptsession
#
# use:
#
#     Test-ColorizedColors "root@my-server" -Password "my-password"
#
# or:
#
#     Test-ColorizedColors "root@my-server" -PrivateKeyFile "my-ppkfile"
#
param(
    [Parameter(Mandatory=$true, Position=0)][string]$HostName,
    [string]$Password,
    [string]$PrivateKeyFile
)

$ErrorActionPreference = 'Stop'

if ( -not ( Test-Path -Path "$ROOT/playground") ) {
    New-Item -ItemType 'directory' "$ROOT/playground"
}

if ( $Password ) {
#    plink -batch -pw "$Password" "${HostName}" "rm -f /var/tmp/write-colorizedcolors.sh"
    pscp -batch -r -pw "$Password" "$ROOT\scripts\write-colorizedcolors.sh" "${HostName}:/var/tmp"
    $creds = "-pw `"$Password`""
}
elseif ( $PrivateKeyFile ) {
    pscp -batch -r -i "$PrivateKeyFile" "$ROOT\scripts\write-colorizedcolors.sh" "${HostName}:/var/tmp"
    $creds = "-i `"$PrivateKeyFile`""
}
else {
    pscp -batch -r "$ROOT\scripts\write-colorizedcolors.sh" "${HostName}:/var/tmp"
    $creds = ""
}
$command = ". /var/tmp/write-colorizedcolors.sh; sleep 3600"

New-Shortcut "$ROOT\playground\colorized-dark-red" -TargetPath "putty.exe" -Arguments "-load `"colorized-dark-red`" $creds"
New-PTSession "colorized-dark-red" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-dark-red.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-dark-red" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-dark-yellow" -TargetPath "putty.exe" -Arguments "-load `"colorized-dark-yellow`" $creds"
New-PTSession "colorized-dark-yellow" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-dark-yellow.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-dark-yellow" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-dark-green" -TargetPath "putty.exe" -Arguments "-load `"colorized-dark-green`" $creds"
New-PTSession "colorized-dark-green" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-dark-green.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-dark-green" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-dark-cyan" -TargetPath "putty.exe" -Arguments "-load `"colorized-dark-cyan`" $creds"
New-PTSession "colorized-dark-cyan" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-dark-cyan.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-dark-cyan" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-dark-blue" -TargetPath "putty.exe" -Arguments "-load `"colorized-dark-blue`" $creds"
New-PTSession "colorized-dark-blue" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-dark-blue.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-dark-blue" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-dark-magenta" -TargetPath "putty.exe" -Arguments "-load `"colorized-dark-magenta`" $creds"
New-PTSession "colorized-dark-magenta" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-dark-magenta.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-dark-magenta" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-light-orange" -TargetPath "putty.exe" -Arguments "-load `"colorized-light-orange`" $creds"
New-PTSession "colorized-light-orange" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-light-orange.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-light-orange" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-light-chartreuse" -TargetPath "putty.exe" -Arguments "-load `"colorized-light-chartreuse`" $creds"
New-PTSession "colorized-light-chartreuse" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-light-chartreuse.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-light-chartreuse" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-light-springgreen" -TargetPath "putty.exe" -Arguments "-load `"colorized-light-springgreen`" $creds"
New-PTSession "colorized-light-springgreen" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-light-springgreen.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-light-springgreen" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-light-azure" -TargetPath "putty.exe" -Arguments "-load `"colorized-light-azure`" $creds"
New-PTSession "colorized-light-azure" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-light-azure.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-light-azure" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-light-violet" -TargetPath "putty.exe" -Arguments "-load `"colorized-light-violet`" $creds"
New-PTSession "colorized-light-violet" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-light-violet.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-light-violet" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\colorized-light-rose" -TargetPath "putty.exe" -Arguments "-load `"colorized-light-rose`" $creds"
New-PTSession "colorized-light-rose" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-colorized-light-rose.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "colorized-light-rose" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\putty-legacy" -TargetPath "putty.exe" -Arguments "-load `"putty-legacy`" $creds"
New-PTSession "putty-legacy" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-putty-legacy.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "putty-legacy" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\putty-improved" -TargetPath "putty.exe" -Arguments "-load `"putty-improved`" $creds"
New-PTSession "putty-improved" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-putty-improved.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "putty-improved" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\putty-dark" -TargetPath "putty.exe" -Arguments "-load `"putty-dark`" $creds"
New-PTSession "putty-dark" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-putty-dark.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "putty-dark" -Width 40 -Height 49 -ScreenBufferHeight 49

New-Shortcut "$ROOT\playground\putty-light" -TargetPath "putty.exe" -Arguments "-load `"putty-light`" $creds"
New-PTSession "putty-light" -HostName "$hostname" -Theme "$ROOT\colors\ptsession-putty-light.json" -RemoteCommand "$command"
Set-PTSessionWindowSize "putty-light" -Width 40 -Height 49 -ScreenBufferHeight 49

exit 0