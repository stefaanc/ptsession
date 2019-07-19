# Color Names

 Color-Scheme Name | ColorTable | PuTTY Name | ANSI VT100 Foreground / Background
------------------------------|------------|---------------------|--------------------
`ScreenBackground`            | `Colour6`  | `ANSI Black`        | `$e[30m` / `$e[40m`
`PopupBackground`             | `Colour21` | `ANSI White Bold`   | `$e[97m` / `$e[107m`
`DimScreenText` & `PopupText` | `Colour7`  | `ANSI Black Bold`   | `$e[90m` / `$e[100m`
`ScreenText` & `DimPopupText` | `Colour20` | `ANSI White`        | `$e[37m` / `$e[47m`
`BrightScreenText`            | `Colour19` | `ANSI Cyan Bold`    | `$e[96m` / `$e[106m`
`Red`                         | `Colour8`  | `ANSI Red`          | `$e[31m` / `$e[41m`
`Orange`                      | `Colour15` | `ANSI Blue Bold`    | `$e[94m` / `$e[104m`
`Yellow`                      | `Colour12` | `ANSI Yellow`       | `$e[33m` / `$e[43m`
`Green`                       | `Colour10` | `ANSI Green`        | `$e[32m` / `$e[42m`
`Cyan`                        | `Colour18` | `ANSI Cyan`         | `$e[36m` / `$e[46m`
`Blue`                        | `Colour14` | `ANSI Blue`         | `$e[34m` / `$e[44m`
`Violet`                      | `Colour17` | `ANSI Magenta Bold` | `$e[95m` / `$e[105m`
`Magenta`                     | `Colour16` | `ANSI Magenta`      | `$e[35m` / `$e[45m`
`TrafficRed`                  | `Colour9`  | `ANSI Red Bold`     | `$e[91m` / `$e[101m`
`TrafficAmber`                | `Colour13` | `ANSI Yellow Bold`  | `$e[93m` / `$e[103m`
`TrafficGreen`                | `Colour11` | `ANSI Green Bold`   | `$e[92m` / `$e[102m`

- remark that one can use ``$e = "`e"`` on newer versions of PowerShell, otherwise use `$e = [char]27` or `$e = [char]0x1B`

<br/>

ColorTable | PuTTY Name | Color-Scheme Name | ANSI VT100 Foreground / Background
------------------------|------------------------------------------------|--------------------|--------------------
`Colour0` (=`Colour20`) | `Default Foreground` (=`ANSI White`)           | `ScreenText`       | `$e[37m` / `$e[47m`
`Colour1` (=`Colour7`)  | `Default Bold Foreground` (=`ANSI Black Bold`) | `PopupText`        | `$e[90m` / `$e[100m`
`Colour2` (=`Colour6`)  | `Default Background` (=`ANSI Black`)           | `ScreenBackground` | `$e[30m` / `$e[40m`
`Colour3` (=`Colour21`) | `Default Bold Background` (=`ANSI White Bold`) | `PopupBackground`  | `$e[97m` / `$e[107m`
`Colour4` (=`Colour6`)  | `Cursor Text` (=`ANSI Black`)                  | `ScreenBackground` | `$e[30m` / `$e[40m`
`Colour5` (=`Colour19`) | `Cursor Colour` (=`ANSI Cyan Bold`)            | `BrightScreenText` | `$e[96m` / `$e[106m`


ColorTable | PuTTY Name | Color-Scheme Name | ANSI VT100 Foreground / Background
-----------|---------------------|-------------------------------|--------------------
`Colour6`  | `ANSI Black`        | `ScreenBackground`            | `$e[30m` / `$e[40m`
`Colour7`  | `ANSI Black Bold`   | `PopupText` & `DimScreenText` | `$e[90m` / `$e[100m`
`Colour8`  | `ANSI Red`          | `Red`                         | `$e[31m` / `$e[41m`
`Colour9`  | `ANSI Red Bold`     | `TrafficRed`                  | `$e[91m` / `$e[101m`
`Colour10` | `ANSI Green`        | `Green`                       | `$e[32m` / `$e[42m`
`Colour11` | `ANSI Green Bold`   | `TrafficGreen`                | `$e[92m` / `$e[102m`
`Colour12` | `ANSI Yellow`       | `Yellow`                      | `$e[33m` / `$e[43m`
`Colour13` | `ANSI Yellow Bold`  | `TrafficAmber`                | `$e[93m` / `$e[103m`
`Colour14` | `ANSI Blue`         | `Blue`                        | `$e[34m` / `$e[44m`
`Colour15` | `ANSI Blue Bold`    | `Orange`                      | `$e[94m` / `$e[104m`
`Colour16` | `ANSI Magenta`      | `Magenta`                     | `$e[35m` / `$e[45m`
`Colour17` | `ANSI Magenta Bold` | `Violet`                      | `$e[95m` / `$e[105m`
`Colour18` | `ANSI Cyan`         | `Cyan`                        | `$e[36m` / `$e[46m`
`Colour19` | `ANSI Cyan Bold`    | `BrightScreenText`            | `$e[96m` / `$e[106m`
`Colour20` | `ANSI White`        | `ScreenText` & `DimPopupText` | `$e[37m` / `$e[47m`
`Colour21` | `ANSI White Bold`   | `PopupBackground`             | `$e[97m` / `$e[107m`

- remark that one can use ``$e = "`e"`` on newer versions of PowerShell, otherwise use `$e = [char]27` or `$e = [char]0x1B`

<br/>

ANSI VT100 Foreground / Background | ColorTable | PuTTY Name | Color-Scheme Name
---------------------| -----------|---------------------|-------------------
`$e[30m` / `$e[40m`  | `Colour6`  | `ANSI Black`        | `ScreenBackground`
`$e[31m` / `$e[41m`  | `Colour8`  | `ANSI Red`          | `Red`
`$e[32m` / `$e[42m`  | `Colour10` | `ANSI Green`        | `Green`
`$e[33m` / `$e[43m`  | `Colour12` | `ANSI Yellow`       | `Yellow`
`$e[34m` / `$e[44m`  | `Colour14` | `ANSI Blue`         | `Blue`
`$e[35m` / `$e[45m`  | `Colour16` | `ANSI Magenta`      | `Magenta`
`$e[36m` / `$e[46m`  | `Colour18` | `ANSI Cyan`         | `Cyan`
`$e[37m` / `$e[47m`  | `Colour20` | `ANSI White`        | `ScreenText` & `DimPopupText`
`$e[90m` / `$e[100m` | `Colour7`  | `ANSI Black Bold`   | `PopupText` & `DimScreenText`
`$e[91m` / `$e[101m` | `Colour9`  | `ANSI Red Bold`     | `TrafficRed`
`$e[92m` / `$e[102m` | `Colour11` | `ANSI Green Bold`   | `TrafficGreen`
`$e[93m` / `$e[103m` | `Colour13` | `ANSI Yellow Bold`  | `TrafficAmber`
`$e[94m` / `$e[104m` | `Colour15` | `ANSI Blue Bold`    | `Orange`
`$e[95m` / `$e[105m` | `Colour17` | `ANSI Magenta Bold` | `Violet`
`$e[96m` / `$e[106m` | `Colour19` | `ANSI Cyan Bold`    | `BrightScreenText`
`$e[97m` / `$e[107m` | `Colour21` | `ANSI White Bold`   | `PopupBackground`

- remark that one can use ``$e = "`e"`` on newer versions of PowerShell, otherwise use `$e = [char]27` or `$e = [char]0x1B`