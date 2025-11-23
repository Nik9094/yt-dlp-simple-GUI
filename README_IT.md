# yt-dlp simple Downloader GUI
Una GUI basilare e semplice per scaricare audio o video con yt-dlp scritta in AutoHotKey.

## Requisiti
1. [AutoHotKey v1.1](https://www.autohotkey.com/)
2. [yt-dlp](https://github.com/yt-dlp/yt-dlp/releases)
3. Due cartelle chiamate "configAudio" e "configVideo", con un file di configurazione "config.txt" per il tipo di media relativo.
4. Conoscenza dei comandi di yt-dlp

## Utilizzo
1. Apri lo script
2. Se Deno non è installato, il programma ti chiederà di installarlo. Il controllo lo fa al primo avvio (e al secondo, se si decide di non installare Deno automaticamente).
3. Carica un file di configurazione usando il pulsante apposito (a meno che non sia già caricato)
4. Incolla un link supportato nella casella di testo e clicca "Scarica audio/video". Una finestra del Prompt dei Comandi si aprirà ed eseguirà il comando `yt-dlp.exe` con il link passato come argomento. La GUI rimane aperta.
   - Una volta che yt-dlp finisce, la casella di testo è pulita così puoi inserire un nuovo link.

## Aggiorna yt-dlp
C'è un comodo pulsante che esegue il comando `yt-dlp -U` per aggiornare l'eseguibile di yt-dlp.\
E' consigliabile tenere d'occhio la pagina github di yt-dlp per aggiornamenti importanti per l'utilizzo o requisiti vari.

### Dettagli
Per ora, è solo fatto per la mia struttura di cartelle e impostazioni dello schermo.\
Il programma utilizza la posizione del file di configurazione `AppData\Roaming\yt-dlp\config.txt`. Per cambiarla, bisogna modificare il parametro `--config-location` a linea 47 e la subroutine `SpostaConfig`.\
E' presente una gestione degli errori per cartella yt-dlp mancante in `AppData` e la presenza di cartelle/file di configurazione.\
Deno viene installato in `Users\USER\.deno`, il programma dovrebbe riuscire a trovare il percorso corretto, ma nel caso non riuscisse bisognerà modificare il file di configurazione a mano aggiungendo `--js-runtimes deno:C:\Users\USER\.deno\bin\deno.exe`.\
Il programma è scritto in italiano, tutti i pulsanti sono stati posizionati e dimensionati in base al testo e il mio schermo.\

## Contribuire
Se vuoi contribuire in qualunque modo, crea una nuova branch intitolata con la tua modifica (ad esempio "Pretty-GUI"). <sub>Non sono proprio sicuro di come funzioni questa parte, non arrabbiarti...</sub>
