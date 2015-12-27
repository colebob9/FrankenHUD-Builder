@ECHO OFF
ECHO FrankenHUD Builder vX.X.X
ECHO Written by colebob9
ECHO Released under the MIT licence.
ECHO Source: (github link)
ECHO.
ECHO This will compile the TF2 HUD FrankenHUD from the GitHub repo automatically.
ECHO You must have TF2 installed to compile.
PAUSE
wget.exe -O master.zip https://github.com/TheKins/frankenhud/archive/master.zip --no-check-certificate
7za.exe x *.zip
"%ProgramFiles(x86)%\Steam\steamapps\common\Team Fortress 2\bin\vpk.exe"
pause