;Version 1.7

SetWorkingDir, %A_ScriptDir%
#SingleInstance force
#Include lib\JSON.ahk

NormalizedPath(path) {
    cc := DllCall("GetFullPathName", "str", path, "uint", 0, "ptr", 0, "ptr", 0, "uint")
    VarSetCapacity(buf, cc*2)
    DllCall("GetFullPathName", "str", path, "uint", cc, "str", buf, "ptr", 0)
    return buf
}

pathDeno := NormalizedPath(A_AppData "\..\..\.deno")
langIndex := 1		; Default language index on DropDownList
locales := JSON.Load(FileOpen(".\locale\EN.json", "r").read())	; Default language

if !FileExist("gui.ini") {
	FileAppend,, "gui.ini"
	IniWrite, false, gui.ini, Main, DenoOK
	GoSub, CheckDeno
} else {
	IniRead, okDeno, gui.ini, Main, DenoOK
	if (okDeno = "false") {
		GoSub, CheckDeno
	}
}

MainGui:
	Gui, New, +Border, % locales.mainHeader
	Gui, Add, DropDownList, w40 Choose%langIndex% vLang gChangeLang, EN|IT
	Gui, Add, Button, x35 yp+25 w190 Center vAudio gChangeConfig, % locales.GUI.audio
	Gui, Add, Button, xp+190 yp w190 Center vVideo gChangeConfig, % locales.GUI.video

	Gui, Add, Button, x85 y+21 w140 Center vUpdDlp gUpdDlp, % locales.GUI.updateDlp
	Gui, Add, Button, xp+140 w140 Center vUpdDeno gUpdDeno, % locales.GUI.updateDeno
	Gui, Add, Edit, vlink x36 yp+32 w378 -Multi -WantReturn
	Gui, Add, CheckBox, vVerbose x130 w200, % locales.GUI.addVerbose
	Gui, Add, Button, x130 yp+30 w190 Center +Default vDownload gDownload, % locales.GUI.download
	GuiControl, Focus, link
	Gui, Show, Center w450 h200
return

ChangeLang:
	Gui, Submit, NoHide
	locales := JSON.Load(FileOpen(".\locale\" Lang ".json", "r").read())
	GuiControl, Text, Audio, % locales.GUI.audio
	GuiControl, Text, Video, % locales.GUI.video
	GuiControl, Text, UpdDlp, % locales.GUI.updateDlp
	GuiControl, Text, UpdDeno, % locales.GUI.updateDeno
	GuiControl, Text, Verbose, % locales.GUI.addVerbose
	GuiControl, Text, Download, % locales.GUI.download
return

UpdDlp:
	RunWait, %A_ComSpec% /c yt-dlp.exe -U
	if FileExist("yt-dlp.exe.old")
		FileDelete, yt-dlp.exe.old
return

UpdDeno:
	Run, deno.exe upgrade
return

Download:
	Gui, Submit, NoHide
	if (link = "") {
		MsgBox, % locales.GUI.insertLink
	} else {
		if (Verbose) {
			RunWait, % A_ComSpec " /k yt-dlp.exe --config-location " ""A_AppData "\yt-dlp\config.txt " "" link " --verbose"
		} else {
			RunWait, % A_ComSpec " /c yt-dlp.exe --config-location " ""A_AppData "\yt-dlp\config.txt " "" link
		}
		GuiControl,, link, % ""
		GuiControl,, Verbose, 0
	}
return

ChangeConfig:
	if !FileExist(A_AppData "\yt-dlp") {
		FileCreateDir, % A_AppData "\yt-dlp"
		MsgBox,, % locales.Config.header, % locales.Config.dlpFolderCreated A_AppData
	}
	
	type := A_GuiControl
	if (type = "audio") {
		folderErrMsg := locales.Config.audioConfigFolderNotFound
		fileErrMsg := locales.Config.audioConfigFileNotFound
		configChangedMsg := locales.Config.audioConfigChanged
	} else {
		folderErrMsg := locales.Config.videoConfigFolderNotFound
		fileErrMsg := locales.Config.videoConfigFileNotFound
		configChangedMsg := locales.Config.videoConfigChanged
	}
	
	if !FileExist("config" . type) {
			MsgBox,, % locales.Config.headerErr, % folderErrMsg
	} else {
		if !FileExist("config" . type . "\config.txt") {
			MsgBox,, % locales.Config.headerErr, % fileErrMsg
		} else {
			FileCopy, config%type%\config.txt, %A_AppData%\yt-dlp\, 1
			MsgBox,, % locales.Config.header, % configChangedMsg
		}
	}
return

CheckDeno:
	if !FileExist(pathDeno) {
		MsgBox, 4, % locales.Deno.header, % locales.Deno.infoMsg
		IfMsgBox Yes
			GoSub, InstallDeno
		IfMsgBox No
			MsgBox,, % locales.Deno.header, % locales.Deno.noInstall
			ExitApp
		return
	} else {
		IniWrite, true, gui.ini, Main, DenoOK
		FileAppend, % "`n--js-runtimes deno:""" pathDeno "\bin\deno.exe""", configAudio\config.txt
		FileAppend, % "`n--js-runtimes deno:""" pathDeno "\bin\deno.exe""", configVideo\config.txt
	}
return

InstallDeno:
	RunWait, powershell.exe irm https://deno.land/install.ps1 | iex
	if FileExist(pathDeno) {
		IniWrite, true, gui.ini, Main, DenoOK
	}
	MsgBox,, % locales.Deno.header, % locales.Deno.denoInstalled
	ExitApp
return

GuiClose:
	ExitApp
return
