# yt-dlp simple Downloader GUI
A basic and barebones GUI made in AutoHotKey to download audios or videos using yt-dlp.

## Requirements
1. [AutoHotKey v1.1](https://www.autohotkey.com/)
2. [yt-dlp](https://github.com/yt-dlp/yt-dlp/releases).
3. Two folders called "configAudio" and "configVideo", with a configuration file "config.txt" for the relative media type to download.
4. Knowledge of yt-dlp commands.

## Usage
1. Run the script.
2. Load either configuration file using the appropriate button (unless already loaded).
3. Paste a supported link in the text field and press "Download audio/video". A Command Prompt window will open and execute the command `yt-dlp.exe` with only the link passed as argument. The GUI stays open. Once yt-dlp is done, the text field is cleared for you to input a new link.

## Update yt-dlp
There is a handy button that runs `yt-dlp -U` to update the yt-dlp executable.

### Remarks
As of now, it's only made for my folder structure, necessities and display settings.
The program assumes the configuration file's location is in `AppData\Roaming\yt-dlp\config.txt`. (change it manually via `yt-dlp --config-location` on command prompt).
The config folders and the yt-dlp executable have to be in the same directory, otherwise nothing will work properly.
There is error handling for a missing yt-dlp folder in `AppData` and presence of config folders/files... just in case.
The program is written in italian, all buttons have been positioned and sized according to the text in italian and my screen.

## Contributing
If you feel like contributing in any way, make a new branch named after your modification (ie "Pretty-GUI"). <sub>I'm not actually sure how this part works, don't lash out at me...</sub>
