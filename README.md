# yt-dlp simple Downloader GUI
A basic and barebones GUI made in AutoHotKey to download audios or videos using yt-dlp.

## Requirements
1. [AutoHotKey v1.1](https://www.autohotkey.com/)
2. [yt-dlp](https://github.com/yt-dlp/yt-dlp/releases)
3. Two folders called "configAudio" and "configVideo", with a configuration file "config.txt" for the relative media type to download
4. Knowledge of yt-dlp commands
5. Deno (optional, read below)

## Usage
1. Run the script
2. If Deno isn't installed, the program will ask you to install it. This check is executed on every launch until you install it through the program or manually
3. Pick your language
4. Load either configuration file using the appropriate button (unless already loaded)
5. Paste a yt-dlp-supported link in the text field and press the download button. A Command Prompt window will open and start downloading the file
   - Once yt-dlp is done, the text field is cleared for you to input a new link

## Update yt-dlp
There is a handy button that runs `yt-dlp -U` to update the yt-dlp executable.\
It's recommended to keep an eye on the yt-dlp GitHub for important updates to usage, requisites etc.

## Update Deno
There is also a handy button that runs `deno upgrade` to update the Deno executable.\
It's recommended to update frequently in order to have yt-dlp working at all times.

### Remarks
As of now, it's only made for my folder structure and display settings.\
The program uses the configuration file's location `AppData\Roaming\yt-dlp\config.txt`. To change it, you have to modify the `--config-location` parameter where yt-dlp is executed and the `MoveConfig` subroutine.\
All the folders and the yt-dlp executable have to be in the same directory, otherwise nothing will work as intended.\
If no yt-dlp folder is found in `AppData\Roaming`, it will be created as soon as you click the button to load a configuration.\
The program should find the right Deno installation path (`Users\USER\.deno`) and edit both config files accordingly, but in case it doesn't you'll have to edit them manually by adding `--js-runtimes deno:C:\Users\USER\.deno\bin\deno.exe`.\

## Contributing
If you feel like contributing in any way, make a new branch named after your modification (ie "Pretty-GUI").
