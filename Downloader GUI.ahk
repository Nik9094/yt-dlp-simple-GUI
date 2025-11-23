;Version 1.5

SetWorkingDir, %A_ScriptDir%
#SingleInstance force

PercorsoNormalizzato(path) {
    cc := DllCall("GetFullPathName", "str", path, "uint", 0, "ptr", 0, "ptr", 0, "uint")
    VarSetCapacity(buf, cc*2)
    DllCall("GetFullPathName", "str", path, "uint", cc, "str", buf, "ptr", 0)
    return buf
}

if !FileExist("gui.ini") {
	FileAppend,, "gui.ini"
	IniWrite, false, gui.ini, Main, DenoOK
	GoSub, ControlloDeno
} else {
	IniRead, okDeno, gui.ini, Main, DenoOK
	if (okDeno = "false") {
		GoSub, ControlloDeno
	}
}
	
Gui, New, +Border, Scarica con yt-dlp
Gui, Add, Button, x35 y20 w190 Center vAudio gSpostaConfig, Carica config per audio
Gui, Add, Button, xp+190 yp w190 Center vVideo gSpostaConfig, Carica config per video

Gui, Add, Button, x130 y+21 w190 Center gControlloAgg, Controlla/scarica aggiornamenti
Gui, Add, Edit, vlink x36 yp+32 w378 -Multi -WantReturn
Gui, Add, Button, x130 yp+30 w190 Center +Default gScarica, Scarica audio/video
GuiControl, Focus, link

Gui, Show, Center w450 h168
return

ControlloAgg:
	RunWait, %A_ComSpec% /c yt-dlp.exe -U
	if FileExist("yt-dlp.exe.old")
		FileDelete, yt-dlp.exe.old
return

Scarica:
	Gui, Submit, NoHide
	if (link = "") {
		MsgBox, Inserisci un link!
	} else {
		RunWait, %A_ComSpec% /c yt-dlp.exe --config-location %A_AppData%\yt-dlp\config.txt %link%
		GuiControl,, link, % ""
	}
return

SpostaConfig:
	if !FileExist(A_AppData "\yt-dlp") {
		FileCreateDir, % A_AppData "\yt-dlp"
		MsgBox,, Caricamento config, % "Non trovato cartella di config. Creata in percorso " A_AppData "."
	}
	
	tipo := A_GuiControl
	if !FileExist("config" . tipo) {
		MsgBox,, Controllo config %tipo% - Errore, Non trovato cartella della configurazione %tipo%!
	} else {
		if !FileExist("config" . tipo . "\config.txt") {
			MsgBox,, Controllo config %tipo% - Errore, Non trovato file di configurazione %tipo%!
		} else {
			FileCopy, config%tipo%\config.txt, %A_AppData%\yt-dlp\, 1
			MsgBox,, Config %tipo%, Configurazione download %tipo% caricata!
		}
	}
return

ControlloDeno:
	percorsoDeno := PercorsoNormalizzato(A_AppData "\..\..\.deno")
	if !FileExist(percorsoDeno) {
		MsgBox, 4, Deno mancante - installare?, Deno non trovato! Vuoi che lo installi per te? Si aprirà una finestra di PowerShell che lo installerà da solo.
		IfMsgBox Yes
			RunWait, powershell.exe irm https://deno.land/install.ps1 | iex
			if FileExist(path) {
				IniWrite, true, gui.ini, Main, DenoOK
			}
			MsgBox,, Installazione Deno, Deno installato. Il programma si chiuderà, quindi riapri DownloaderGUI.
			ExitApp
		IfMsgBox No
			MsgBox, Ok. Cercalo su deno.com, installalo e riapri DownloaderGUI.
			ExitApp
		return
	} else {
		IniWrite, true, gui.ini, Main, DenoOK
		FileAppend, % "`n--js-runtimes deno:" percorsoDeno "\bin\deno.exe", configAudio\config.txt
		FileAppend, % "`n--js-runtimes deno:" percorsoDeno "\bin\deno.exe", configVideo\config.txt
	}
return

GuiClose:
	ExitApp
return
