#
# Copyright (c) 2019 Stefaan Coussement
# MIT License
#
# more info: https://github.com/stefaanc/ptsession
#
# use:
#
#     Apply-PTSessionSettings.ps1
#

$ErrorActionPreference = 'Stop'

#
# update default settings
function ApplyPTSessionSettings {
    New-Item -ItemType 'file' -Path "./_.reg" -Force

    #
    # pick-up default settings, skip "ColourXX" settings
    ( Get-Content -Path "$ROOT/colors/ptsession-default-settings.reg" ) | ForEach-Object -Process {
        if ( -not "$_".StartsWith('"Colour') ) {
            $_ | Out-File "./_.reg" -Append
        }
    }

    #
    # add colours
    ( Get-Content -Path "$ROOT/colors/ptsession-putty-improved.txt" ) | ForEach-Object -Process {
        $_ | Out-File "./_.reg" -Append
    }

    reg import "./_.reg"

    Remove-Item -Path "./_.reg" -Force
}
ApplyPTSessionSettings

exit 0
