# yt-dlp simple Downloader GUI
A basic and barebones GUI made in AutoHotKey to download audios or videos using yt-dlp.

## Usage
1. Run the script
2. Load either configuration file using the appropriate button (unless already loaded)
3. Paste a supported link in the text field and press "Download video/audio". A Command Prompt window will open and execute the command `yt-dlp.exe` with only the link passed as argument. The GUI stays open.
   - Once yt-dlp is done, the text field is cleared for you to input a new link.

## Update yt-dlp
There is a handy button that runs `yt-dlp -U` to update the yt-dlp executable.

### Remarks
As of now, it's only made for my folder structure, necessities and display settings.
The program assumes you have already ran the `yt-dlp --config-location` command from the Command Prompt beforehand, and that you have two different folders called "configAudio" and "configVideo", in which you put "config.txt".
I still decided to add error handling for a missing yt-dlp folder in %appdata% and presence of config folders/files... just because.
The program is written in italian, all buttons have been positioned and resized according to the text in italian and my screen.


## Contributing
If you feel like contributing in any way, make a new branch named after your modification (ie "Pretty-GUI"). <sub>I'm not actually sure how this part works, don't lash out at me...</sub>
