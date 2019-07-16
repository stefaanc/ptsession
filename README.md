# PTSession

**some scripts to apply putty configuration improvements and set different background colors**

## PuTTY Session Configuration

There are some interesting web-sites on how to improve the default PuTTY session configuration

- http://dag.wiee.rs/blog/content/improving-putty-settings-on-windows
- https://sanctum.geek.nz/arabesque/putty-configuration
- https://github.com/jblaine/solarized-and-modern-putty

We picked up most of these configuration settings, modified some and added some others

- Session

  - `Connection type` = :black_circle: `SSH`


  > :bulb:  
  > you can change `Close window on exit` to :black_circle: `Never` by setting the line `"CloseOnExit"=dword:00000001` in the `\configurations\default-settings.reg` file

- Terminal / Bell

  - `Action to happen when a bell occurs` = :black_circle: `None (bell disabled)`
  - `Taskbar/caption indication` = :black_circle: `Flashing`

- Window

  - `Columns` = `80`
  - `Rows` = `40`
  - `Lines of scrollback` = `10000`
  - :ballot_box_with_check: `Reset scrollback on keypress`
  - :black_square_button: `Reset scrollback on display activity`

- Window / Appearance > Font settings: [Change...]

  - `Font` = `Lucida Console`
  - `Size` = `12`

- Window / Appearance

  - `Font quality` = :black_circle: `ClearType`
  - `Gap between text and window edge` = `3`

- Window / Translation

  - `Remote character set` = `UTF-8`
  - `Handling of line drawing characters` = :black_circle: `Use Unicode line drawing code points`

- Window / Selection

  - `Paste to clipboard in RTF as well as plain text`


  > :bulb:  
  > you can change `Action on mouse buttons` to :black_circle: `xterm (Right extends, Middle pastes)` by setting the line `"MouseIsXterm"=dword:00000001` in the `\configurations\default-settings.cfg` file

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
