# PTSession

**some scripts to apply putty configuration improvements and set different background colors**

## Default PuTTY Session Configuration

There are some interesting web-sites on how to improve the default PuTTY session configuration

- http://dag.wiee.rs/blog/content/improving-putty-settings-on-windows
- https://sanctum.geek.nz/arabesque/putty-configuration
- https://github.com/jblaine/solarized-and-modern-putty

We picked up most of these configuration settings, modified some and added some others

- Session

  - `Connection type` = :black_circle: `SSH`

    > :bulb:  
    > you can also change `Close window on exit` to :black_circle: `Never` by setting the line `"CloseOnExit"=dword:00000001` in the `\configurations\default-settings.reg` file

- Terminal / Bell

  - `Action to happen when a bell occurs` = :black_circle: `None (bell disabled)`
  - `Taskbar/caption indication` = :black_circle: `Flashing`

- Window

  - `Columns` = `120`
  - `Rows` = `50`
  - `Lines of scrollback` = `8000`
  - :ballot_box_with_check: `Reset scrollback on keypress`
  - :black_square_button: `Reset scrollback on display activity`

- Window / Appearance > Font settings: [Change...]

  - `Font` = `Lucida Console`
  - `Size` = `10`

- Window / Appearance

  - `Font quality` = :black_circle: `ClearType`
  - `Gap between text and window edge` = `3`

- Window / Translation

  - `Remote character set` = `UTF-8`
  - `Handling of line drawing characters` = :black_circle: `Use Unicode line drawing code points`

- Window / Selection

  - `Paste to clipboard in RTF as well as plain text`

    > :bulb:  
    > you can also change `Action on mouse buttons` to :black_circle: `xterm (Right extends, Middle pastes)` by setting the line `"MouseIsXterm"=dword:00000001` in the `\configurations\default-settings.cfg` file

- Window / Colors

  - :ballot_box_with_check: `Allow terminal to use xterm 256-colour mode`
  - `Indicate bolded text by changing` = :black_circle: `The font`
  - `Select a colour to adjust:` `ANSI Blue`
    - `Red` = `74`
    - `Green` = `74`
    - `Blue` = `255`
  - `Select a colour to adjust:` `ANSI Blue Bold`
    - `Red` = `140`
    - `Green` = `140`
    - `Blue` = `255`

- Connection

  - `Seconds between keepalives (0 to turn off)` = `59`
  - :ballot_box_with_check: `Enable TCP keepalives (SO_KEEPALIVE option)`

- Connection / Data

  - `Terminal-type string` = `"putty"`

    > :warning:  
    > make sure you first install the `putty` and/or `putty-256color` terminal definitions on your remote machine, as described in more detail in https://sanctum.geek.nz/arabesque/putty-configuration/

- Connection / SSH / X11

  - :ballot_box_with_check: `Enable X11 forwarding`

<br/>

The configuration settings for PuTTY are stored in the registry.  To apply these settings, run `Apply-PTSessionSettings.ps1`.  This will update the registry properties for `HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\Default%20Settings`.  You can also specify a [color-scheme](#putty-s-colour-settings).  If no color-scheme is specified, then the colors from `ptsession-putty-improved.json` will be used.

```powershell
Apply-PTSessionSettings.ps1 -Theme "$ROOT/colors/ptsession-putty-improved.json"
```


<br/>

## PuTTY's Colour Settings

We defined a number of color-schemes based on [the `Colorized` color-schemes defined in the PSConsole repository](https://github.com/stefaanc/psconsole/blob/master/docs/color-schemes.md), and in turn based on the very popular [`Solarized` color-scheme](https://github.com/stefaanc/psconsole/blob/master/docs/color-schemes.md).

The color-schemes are defined in JSON files in the `/colors` folder.

![colorized-dark.png](/docs/screenshots/colorized-dark.png)

![colorized-dark.png](/docs/screenshots/colorized-light.png)

The `ptsession-putty-improved.json` color-scheme implements the modified blue colors from [the default session configuration](#default-putty-session-configuration).  We also added  `Colorized` dark and light color-schemes.

![colorized-dark.png](/docs/screenshots/putty.png)

- Note that the `putty-legacy` and `-improved` color-schemes are not really part of the `Colorized` family, hence the unexpected blue color with the "Orange" text in the images.  This is because the orange color is mapped on the `ANSI Blue Bold` PuTTY-name.
- Remark also that for the `Colorized` color-schemes the background color is always mapped on the `ANSI Black` color, the foreground color on `ANSI White`, the bold background color is  always mapped on the `ANSI White Bold` color, the bold foreground color on `ANSI Black Bold`.  So in the `putty-light` color-scheme, the `ANSI Black` color is almost white, `ANSI White Bold` is almost black.

> :bulb:
> We made some [conversion tables to convert names between different systems](/docs/color-names.md).


<br/>

## PuTTY sessions

As we explained in previous sections, the PuTTY configuration settings are saved in the registry under `HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions`.  You can define a number of different sets of configuration properties.

- `New-PTSession` creates (or overwrites) a PuTTY session in the registry.  It copies the settings from the `Default Settings` session and then updates the values for the properties defined by the parameters.

  ```powershell
  New-PTSession "root@my-server" -Theme "$ROOT\colors\ptsession-putty-improved.json"
  ```

  More parameters

  ```text
  New-PTSession [ -Name ] "$Name"
                [ -WinTitle "$WinTitle" ]
                [ -HostName "$HostName" ]
                [ -UserName "$UserName" ]
                [ -PublicKeyFile "$PublicKeyFile" ]
                [ -Theme "$Theme" ]
                [ -RemoteCommand "$RemoteCommand" ]
                [ -LogFileName "$LogFileName" ]
  ```
  - any spaces in `$Name` are replaced by `%20` when going to the registry
  - the default `$WinTitle` is the name of the PuTTY session
  - the `$HostName` can include the `$UserName` by using the format `user@host`
  - the `$PublickKeyFile` is used by PuTTY to find the associated private key file in `Pageant`.  If you don't use `Pageant`, you can also provide the private key file instead.
  - the `$Theme` is a path to a valid color-scheme JSON file

- `Set-PTSessionColors` updates an existing session with the colors from a color-scheme

  ```powershell
  Set-PTSessionColors.ps1 "root@my-server" -Theme "$ROOT\colors\ptsession-colorized-dark-cyan.json"
  ```
  - remark that any spaces in the name are replaced by `%20` when going to the registry
  - remark that the `colorized-dark-cyan.json` theme we used in this example corresponds to the `Solorized-dark` color-scheme.  The `colorized-light-orange` theme corresponds to the `Solarized-light` color-scheme.

- `Set-PTSessionWindowSize` updates an existing session with the settings for the PuTTY terminal window

  ```powershell
  Set-PTSessionWindowSize "root@my-server" -Width 120 -Height 50 -ScreenBufferHeight 8000
  ```
  - remark that any spaces in the name are replaced by `%20` when going to the registry
  - remark that the values in this example are the default values.

- `Remove-PTSession` deletes one or more sessions from the registry

  ```powershell
  Remove-PTSession.ps1 "my-session-name"
  ```
  - remark that any spaces in the name are replaced by `%20` when going to the registry

  or to delete all session, except the `Default Settings` session

  ```powershell
  Remove-PTSession.ps1 -All
  ```

- `write-colorizedcolors.sh` shows the colors of the configured color-scheme in a linux (bash) shell. 

- `Test-ColorizedColors` creates a PuTTY session in the registry for every color-scheme.  It creates a folder `$ROOT/playground`, and in that folder a shortcut to `putty.exe` for every session.  You need to provide a hostname of a remote server, username and credentials.  It also uploads `write-colorizedcolors.sh` to the `/var/tmp` folder on that remote server.  This script is called by the `RemoteCommand` that is specified in the PuTTY sessions that are created.

  ```powershell
  Test-ColorizedColors.ps1 "root@my-server" -Password "root-password"
  ```

  or

  ```powershell
  Test-ColorizedColors.ps1 "root@my-server" -PrivateKeyFile "root-privatekeyfile"
  ```

- `Test-Cleanup` clears all sessions in the registry, except the `Default%20Settings` session, and clears the shortcuts in the `/playground` folder.

  > :warning:  
  > This will also clear any sessions that are not created by `Test-ColorizedColors`, so if there are any other sessions you want to preserve, you should delete them manually.


<br/>

## Shortcuts to putty.exe

To create a shortcut using one of the PuTTY sessions you created

```powershell
New-Shortcut "$ROOT\scripts\my-ptsession.lnk" -TargetPath "putty.exe" -Arguments "-load `"my-session-name`""
```
- the session-name is the name you used to create the session in the registry.
- you can add further PuTTY parameters like `-pw $Password` or `-i $PrivateKeyFile`.
- remark the name of the shortcut should be the **full** path to the shortcut, an the extension `.lnk` is optional.
- have a look at the top of the script in the `scripts` folder for more parameters, f.i. `-WorkingDirectory`.


<br/>

## For Further Investigation

- Support portable version of PuTTY
- Add support for WinSCP
