# brazmogu-love-release
A repository with my custom set of release routines (for Linux, MacOS and CygWin devs)

My _love-release_ script creates executable releases for most major OSs(Windows 32bit and 64bit, MAC OSX and Linux), based simply on [the instructions provided in the LOVE2D wiki](https://love2d.org/wiki/Game_Distribution), including AppImage.

## Usage

```bash
./love-release.sh [(--mac|--linux|--win32|--win64|--nozip|--keep)...] <.LOVE package>
```

* __nozip__ keeps the release as is, instead of creating a ZIP package by the end
* __keep__ will not remove the files from the _tmp_ folder after creating the release directories
* __mac|linux|win32|in64__ specified the releases to be generated (specify none to generate for all platforms)
