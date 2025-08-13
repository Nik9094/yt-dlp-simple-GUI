# yt-dlp simple Downloader GUI
Una GUI basilare e semplice per scaricare audio o video con yt-dlp scritta in AutoHotKey.

## Utilizzo
1. Apri lo script
2. Carica un file di configurazione usando il pulsante apposito (a meno che non sia già caricato)
3. Incolla un link supportato nella casella di testo e clicca "Scarica video/audio". Una finestra del Prompt dei Comandi si aprirà ed eseguirà il comando `yt-dlp.exe` con solo il link passato come argomento. La GUI rimane aperta.
   3.1 Una volta che yt-dlp finisce, la casella di testo è pulita così puoi inserire un nuovo link.

## Aggiorna yt-dlp
C'è un comodo pulsante che esegue il comando `yt-dlp -U` per aggiornare l'eseguibile di yt-dlp.

### Dettagli
Per ora, è solo fatto per la mia struttura di cartelle, necessità e impostazioni dello schermo.
Il programma assume che tu abbia già eseguito il comando `yt-dlp --config-location`dal Prompt dei Comandi prima dell'utilizzo, e che tu abbia due cartelle chiamate "configAudio" e "configVideo", dove metti un file "config.txt".
Ho comunque deciso di aggiungere una gestione degli errori per una cartella yt-dlp mancante in %appdata% e la presenza di cartelle/file di configurazione... giusto per.
Il programma è scritto in italiano, tutti i pulsanti sono stati posizionati e dimensionati in base al testo e il mio schermo.


## Contribuire
Se vuoi contribuire in qualunque modo, crea una nuova branch intitolata con la tua modifica (ad esempio "Pretty-GUI"). <sub>Non sono proprio sicuro di come funzioni questa parte... Non arrabbiarti!</sub>
