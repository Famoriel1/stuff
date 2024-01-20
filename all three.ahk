#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
CoordMode, Mouse, Screen
mouseXY(x, y)
{
    DllCall("mouse_event",uint,1,int,x,int,y,uint,0,int,0)
}
strafe(left)
{
  moveCount := 1
  sleepInterval := 0
  relativeMove := 35
  if (left)
  {
    key := "t"
    move := -relativeMove
  } else
  {
    key := "y"
    move := relativeMove
  }
  DllCall("Sleep", "UInt", 5)
  Loop, %moveCount%
  {
    mouseXY(move, 0)
    DllCall("Sleep", "UInt", sleepInterval)
  }
}
$Q::
while getkeystate("Q","P")
{
strafe(true)
}
return
$E::
while getkeystate("E","P")
{
strafe(false)
}
return
Home::Suspend
return
toggle := 0

 {
    DllCall("mouse_event", short, 1, short, x, short, y, short, 0, short, 0)
}

*~$A::
    if (toggle) {
        while GetKeyState("A", "P") {
            MouseXY(-40, 0) ; Change this value to your preference
            Sleep 3.7 ; Change this value to your preference
        }
    }
return

*~$D::
    if (toggle) {
        while GetKeyState("D", "P") {
            MouseXY(40, 0) ; Change this value to your preference
            Sleep 3.7 ; Change this value to your preference
        }
    }
return

*~$F::
    toggle := !toggle
return
Toggleable := false

 {
    DllCall("mouse_event", uint, 1, int, x, int, y, uint, 0, int, 0)
}

 {
    moveCount := 1
    sleepInterval := 0
    relativeMove := 35
    
    if (left) {
        key := "t"
        move := -relativeMove
    } else {
        key := "y"
        move := relativeMove
    }
    
    Sleep, 5
    
    Loop, %moveCount% {
        mouseXY(move, 0)
        Sleep, sleepInterval
    }
}

$LButton::
while GetKeyState("LButton", "P") {
    strafe(true)
}
return

$RButton::
while GetKeyState("RButton", "P") {
    strafe(false)
}
return

c::suspend
return
^Esc::ExitApp  ; Exit script with Escape key