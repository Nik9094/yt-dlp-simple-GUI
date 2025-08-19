SetWorkingDir, %A_ScriptDir%
#SingleInstance force

Gui, New, +Border, Scarica con yt-dlp
Gui, Add, Button, x35 y20 w190 Center vAudio gSpostaConfig, Carica config per audio
Gui, Add, Button, xp+190 yp w190 Center vVideo gSpostaConfig, Carica config per video

Gui, Add, Button, x130 y+21 w190 Center gControlloAgg, Controlla/scarica aggiornamenti
Gui, Add, Edit, vlink x36 yp+32 w378 -Multi -WantReturn
Gui, Add, Button, x130 yp+30 w190 Center +Default gScarica, Scarica audio/video

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
		RunWait, %A_ComSpec% /c yt-dlp.exe %link%
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


GuiClose:
	ExitApp
return
