#
# Copyright (c) 2019 Stefaan Coussement
# MIT License
#
# more info: https://github.com/stefaanc/ptsession
#
# use:
#
#     Test-Cleanup
#

$ErrorActionPreference = 'Stop'

Remove-Item "$ROOT/playground/*.lnk" -Force
Remove-PTSession.ps1 -All

exit 0