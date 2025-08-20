# yt-dlp simple Downloader GUI
Una GUI basilare e semplice per scaricare audio o video con yt-dlp scritta in AutoHotKey.

## Requisiti
1. [AutoHotKey v1.1](https://www.autohotkey.com/)
2. [yt-dlp](https://github.com/yt-dlp/yt-dlp/releases)
3. Due cartelle chiamate "configAudio" e "configVideo", con un file di configurazione "config.txt" per il tipo di media relativo.
4. Conoscenza dei comandi di yt-dlp

## Utilizzo
1. Apri lo script
2. Carica un file di configurazione usando il pulsante apposito (a meno che non sia già caricato)
3. Incolla un link supportato nella casella di testo e clicca "Scarica audio/video". Una finestra del Prompt dei Comandi si aprirà ed eseguirà il comando `yt-dlp.exe` con solo il link passato come argomento. La GUI rimane aperta.
   - Una volta che yt-dlp finisce, la casella di testo è pulita così puoi inserire un nuovo link.

## Aggiorna yt-dlp
C'è un comodo pulsante che esegue il comando `yt-dlp -U` per aggiornare l'eseguibile di yt-dlp.

### Dettagli
Per ora, è solo fatto per la mia struttura di cartelle, necessità e impostazioni dello schermo.
Il programma assume che la posizione del file di configurazione è in `AppData\Roaming\yt-dlp\config.txt`. (cambiala manualmente con `yt-dlp --config-location` nel prompt dei comandi).
E' presente una gestione degli errori per cartella yt-dlp mancante in `AppData` e la presenza di cartelle/file di configurazione... giusto per.
Il programma è scritto in italiano, tutti i pulsanti sono stati posizionati e dimensionati in base al testo e il mio schermo.

## Contribuire
Se vuoi contribuire in qualunque modo, crea una nuova branch intitolata con la tua modifica (ad esempio "Pretty-GUI"). <sub>Non sono proprio sicuro di come funzioni questa parte, non arrabbiarti...</sub>
