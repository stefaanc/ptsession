#
# Copyright (c) 2019 Stefaan Coussement
# MIT License
#
# more info: https://github.com/stefaanc/ptsession
#
# use:
#
#     Apply-PTSessionSettings.ps1 [ -Theme "$Theme" ]
#
# with default $Theme = "$ROOT\colors\ptsession-putty-improved.json"
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
param(
    [Parameter(Position=0)][string]$Theme
)

$ErrorActionPreference = 'Stop'

#
# update default settings
function ApplyPTSessionSettings {
    if ( -not $Theme ) {
        $Theme = "$ROOT/colors/ptsession-putty-improved.json"
    }
    $colors = $( Get-Content -Raw -Path "$Theme" | ConvertFrom-Json )

    New-Item -ItemType 'file' -Path "./_.reg" -Force | Out-Null

    #
    # pick-up default settings, skip "ColourXX" settings
    ( Get-Content -Path "$ROOT/colors/ptsession-default-settings.reg" ) | ForEach-Object -Process {
        if ( -not "$_".StartsWith('"Colour') ) {
            $_ | Out-File "./_.reg" -Append
        }
    }

    #
    # add colours
    $colors.PSObject.Properties | ForEach-Object -Process {
        "`"" + $_.Name + "`"=`"" + $_.Value + "`"" | Out-File "./_.reg" -Append
    }

    #
    # import in registery
    reg import "./_.reg"
    Remove-Item -Path "./_.reg" -Force
}
ApplyPTSessionSettings

exit 0
