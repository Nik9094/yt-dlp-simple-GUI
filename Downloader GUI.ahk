SetWorkingDir, %A_ScriptDir%
#SingleInstance force

fileOk := 0

Gui, New, +Border, Scarica con yt-dlp
Gui, Add, Button, x35 y20 w190 Center gMuoviAudio, Carica config per audio
Gui, Add, Button, xp+190 yp w190 Center gMuoviVideo, Carica config per video
Gui, Add, Button, xp-95 yp+31 w190 Center gControllaDest, Controlla cartella config

Gui, Add, Button, xp y+21 w190 Center gControlloAgg, Controlla/scarica aggiornamenti
Gui, Add, Edit, vlink x36 yp+32 w378 -Multi -WantReturn
Gui, Add, Button, x130 yp+30 w190 Center gScarica, Scarica video/audio

Gui, Show, Center w450 h200
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

MuoviAudio:
	GoSub, ControlloFileAudio
	if (fileOK = 1) {
		FileCopy, configAudio\config.txt, %A_AppData%\yt-dlp\, 1
		MsgBox,, Config Audio, Configurazione download audio caricata!
		fileOK = 0
	}
return

MuoviVideo:
	GoSub, ControlloFileVideo
	if (fileOK = 1) {
		FileCopy, configVideo\config.txt, %A_AppData%\yt-dlp\, 1
		MsgBox,, Config Audio, Configurazione download video caricata!
		fileOK = 0
	}
return

ControllaDest:
	if !FileExist(A_AppData "\yt-dlp") {
		FileCreateDir, % A_AppData "\yt-dlp"
		MsgBox,, Controllo cartella, % "Creato cartella per la config yt-dlp in percorso " A_AppData
	} else {
		MsgBox,, Controllo cartella, Cartella presente! Carica una config e basta!
	}
return

ControlloFileAudio:
	if !FileExist("configAudio") {
		MsgBox,, Controllo config audio - Errore, Non trovato cartella della configurazione audio!
	} else {
		if !FileExist("configAudio\config.txt") {
			MsgBox,, Controllo config audio - Errore, Non trovato file di configurazione audio!
		} else {
			fileOK := 1
		}
	}	
return

ControlloFileVideo:
	if !FileExist("configVideo") {
		MsgBox,, Controllo config video - Errore, Non trovato cartella della configurazione video!
	} else {
		if !FileExist("configVideo\config.txt") {
			MsgBox,, Controllo config video - Errore, Non trovato file di configurazione video!
		} else {
			fileOK := 1
		}
	}	
return

GuiClose:
	ExitApp
return