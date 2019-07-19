#
# Copyright (c) 2019 Stefaan Coussement
# MIT License
#
# more info: https://github.com/stefaanc/ptsession
#
# use:
#
#     Set-PTSessionWindowSize "root@my-server" [ -Width 120 ] [ -Height 50 ] [ -ScreenBufferHeight 8000 ]
#
param(
    [Parameter(Mandatory=$true, Position=0)][string]$Name,
    [Parameter(Position=1)][Alias("Width")][int]$X = 120,
    [Parameter(Position=2)][Alias("Height")][int]$Y = 50,
    [Parameter(Position=3)][Alias("ScreenBufferHeight")][int]$ScreenBufferY = 8000
)

$ErrorActionPreference = 'Stop'

$key = "$Name".Replace(" ", "%20")
if ( -not ( Get-Item -Path "HKCU:\Software\SimonTatham\PuTTY\Sessions\$key" -ErrorAction 'Ignore' ) ) {
    Write-Error "PuTTY session `"$Name`" doesn't exist"
}

Push-Location
Set-Location "HKCU:\Software\SimonTatham\PuTTY\Sessions\$key"

New-ItemProperty -Path . -PropertyType 'DWord' -Name "TermWidth" -Value $X -Force
New-ItemProperty -Path . -PropertyType 'DWord' -Name "TermHeight" -Value $Y -Force
New-ItemProperty -Path . -PropertyType 'DWord' -Name "ScrollbackLines" -Value $ScreenBufferY -Force

Pop-Location
exit 0
