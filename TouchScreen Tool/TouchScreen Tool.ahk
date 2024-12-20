#SingleInstance Force
#Persistent
SetBatchLines, -1

if (InStr(A_ScriptDir, ".zip" or ".rar") > 0) {
	Menu, Tray, NoIcon
	Gui Error: +LastFound +OwnDialogs +AlwaysOnTop
	Gui Error: Font, S13 bold underline cRed
	Gui Error: Add, Text, Center w220 x5,ERROR
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Font, s12 norm bold
	Gui Error: Add, Text, Center w220 x5, Files Are Zipped
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Font, cBlack
	Gui Error: Add, Text, Center w220 x5, Please extract all files from the zipped (.zip) folder:
	Gui Error: Font, underline s12
	Gui Error: Add, Text, cGreen center w220 x5, TouchScreen-Tool-main.zip
	Gui Error: Font, s11 norm Bold c0x152039
	Gui Error: Add, Text, center x5 w220,
	Gui Error: Add, Text, Center w220 x5,Created by Gubna
	Gui Error: Add, Button, gDiscordError w150 x40 center,Discord
	Gui Error: add, button, gCloseError w150 x40 center,Close Error
	WinSet, ExStyle, ^0x80
	Gui Error: -caption
	Gui Error: Show, center w230, File Error
	return
}

powerImage := A_ScriptDir "\assets\power.jpg"
lockImage := A_ScriptDir "\assets\lock.jpg"
menuImage := A_ScriptDir "\assets\menu.jpg"
backImage := A_ScriptDir "\assets\back.jpg"
sleepImage := A_ScriptDir "\assets\sleep.jpg"
closeImage := A_ScriptDir "\assets\close.jpg"
infoImage := A_ScriptDir "\assets\info.jpg"
icon := A_ScriptDir "\assets\Gubna Tech.ico"

Gui 1: +AlwaysOnTop +LastFound -caption
Gui 1: Add, Picture,x0 y0 w50 h50 gmenuClicked, %menuImage%
if FileExist(A_ScriptDir "\assets\Gubna Tech.ico")
{
	Menu, Tray, Icon, %icon%
}
Gui 1: Show, x0 y0 w50 h50, Menu

if FileExist(A_ScriptDir "\assets\Gubna Tech.ico")
{
	hIcon := DllCall("LoadImage", uint, 0, str, A_ScriptDir "\assets\Gubna Tech.ico", uint, 1, int, 0, int, 0, uint, 0x10)
	SendMessage, 0x80, 0, hIcon
	SendMessage, 0x80, 1, hIcon
}

Gui 2: Add, Picture,x0 y0 w50 h50 gpowerClicked, %powerImage%
Gui 2: Add, Picture,x50 y0 w50 h50 gsleepClicked, %sleepImage%
Gui 2: Add, Picture,x100 y0 w50 h50 glockClicked, %lockImage%
Gui 2: Add, Picture,x150 y0 w50 h50 ginfoClicked, %infoImage%
Gui 2: Add, Picture,x200 y0 w50 h50 gbackClicked, %backImage%
Gui 2: Add, Picture,x250 y0 w50 h50 gcloseClicked, %closeImage%
return

menuClicked:
Gui 1: hide
Gui 2: +AlwaysOnTop +LastFound -caption
Gui 2: Show, x0 y0 w300 h50, Options
return

powerClicked:
MsgBox, 4132, Shutdown Device?, Do you want to shutdown device? (Press Yes or No)`n`nMake sure to save all your work before clicking Yes. This is your final opportunity to avoid losing any progress.
IfMsgBox No
	return
ifMsgBox Yes
{
	shutdown 13
}
return

lockClicked:
Gui 2: hide
Gui 1: show
DllCall("LockWorkStation")
return

sleepClicked:
Gui 2: hide
Gui 1: show
winwait, Menu
Sendevent, ^{LWin down}x^{LWin up}
winwait PopupHost
sendevent {u}
sleep 400
sendevent {s}
return

backClicked:
Gui 2: hide
Gui 1: show
return

infoClicked:
Gui 2: hide	
Gui 20: +AlwaysOnTop +OwnDialogs +LastFound
Gui 20: Font, S13 bold cMaroon
Gui 20: Add, Text, Center w220 x5,Information
Gui 20: Add, Text, center x5 w220,
Gui 20: Font, cBlack s11
Gui 20: Add, Picture, x90 w50 h50, %powerImage%
Gui 20: Add, Text, Center w220 x5,shutdown
Gui 20: Add, Text, center x5 w220,
Gui 20: Add, Picture, x90 w50 h50, %menuImage%
Gui 20: Add, Text, Center w220 x5,menu
Gui 20: Add, Text, center x5 w220,
Gui 20: Add, Picture, x90 w50 h50, %sleepImage%
Gui 20: Add, Text, Center w220 x5,sleep
Gui 20: Add, Text, center x5 w220,
Gui 20: Add, Picture,x90 w50 h50, %lockImage%
Gui 20: Add, Text, Center w220 x5,lock device
Gui 20: Add, Text, center x5 w220,
Gui 20: Add, Picture,x90 w50 h50, %infoImage%
Gui 20: Add, Text, Center w220 x5,information
Gui 20: Add, Text, center x5 w220,
Gui 20: Add, Picture,x90 w50 h50, %backImage%
Gui 20: Add, Text, Center w220 x5,back
Gui 20: Add, Text, center x5 w220,
Gui 20: Add, Picture,x90 w50 h50, %closeImage%
Gui 20: Add, Text, Center w220 x5,close
Gui 20: Add, Text, center x5 w220,
Gui 20: Font, cBlue norm underline bold s11
Gui 20: Add, Text, Center gMIT w220 x5,MIT License
Gui 20: Font, s11 norm Bold c0x152039
Gui 20: Add, Text, Center w220 x5,Created by Gubna
Gui 20: Font, cBlack norm bold
Gui 20: Add, Button, gDiscord w150 x40 center,Discord
Gui 20: add, button, gCloseInfo w150 x40 center,Close Information
WinSet, ExStyle, ^0x80
Gui 20: -caption
Gui 20: Show, center w230, Information
return

CloseInfo:
gui 20: destroy
gui 1: Show		
return

discord:
Gui 20: destroy
Run, https://discord.gg/hNj4CQ5stX
gui 1: Show		
return

MIT:
run https://www.mit.edu/~amini/LICENSE.md
return

closeClicked:
guiclose:
exitapp

DiscordError:
Run, https://discord.gg/hNj4CQ5stX
Exitapp

CloseError:
ExitApp