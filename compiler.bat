@ECHO OFF
:: File Check
ECHO Checking for required files...
IF NOT EXIST wget.exe ECHO wget.exe could not be found! Please download a new release to fix this. & GOTO filewarning
IF NOT EXIST 7za.exe ECHO 7za.exe could not be found! Please download a new release to fix this. & GOTO filewarning
IF NOT EXIST libeay32.dll ECHO libeay32.dll could not be found! Please download a new release to fix this. & GOTO filewarning
IF NOT EXIST libiconv2.dll ECHO libiconv2.dll could not be found! Please download a new release to fix this. & GOTO filewarning
IF NOT EXIST libintl3.dll ECHO libintl3.dll could not be found! Please download a new release to fix this. & GOTO filewarning
IF NOT EXIST libssl32.dll ECHO libssl32.dll could not be found! Please download a new release to fix this. & GOTO filewarning
IF NOT EXIST "%ProgramFiles(x86)%\Steam\steamapps\common\Team Fortress 2\bin\vpk.exe" ECHO Can't find TF2! Did you install it somewhere else? & GOTO filewarning
ECHO All files found! Continuing. 
GOTO filesokay
:filewarning
ECHO.
PAUSE
EXIT
:filesokay
:: Title
CLS
ECHO FrankenHUD Builder vX.X.X
ECHO Written by colebob9
ECHO Released under the MIT licence.
ECHO Source: https://github.com/colebob9/FrankenHUD-Builder
ECHO.
ECHO This will compile the TF2 HUD FrankenHUD from the GitHub repo automatically.
ECHO You must have TF2 installed to compile.
PAUSE
:: Download and Extract
wget.exe -O master.zip https://github.com/TheKins/frankenhud/archive/master.zip --no-check-certificate
7za.exe x *.zip
:: Make build directories
md build
md build\frankenhud-core
md build\frankenhud-style
md build\frankenhud-fonts
:: Organizing files in right order
XCOPY /E /I "frankenhud-master\hud_src\resource" "build\frankenhud-core\resource"
XCOPY /E /I "frankenhud-master\hud_src\scripts" "build\frankenhud-core\scripts"
MOVE "build\frankenhud-core\resource\monofont.tff" "build\frankenhud-fonts\"
MOVE "build\frankenhud-core\resource\tf2modified.tff" "build\frankenhud-fonts\"
:: VPK Packer
"%ProgramFiles(x86)%\Steam\steamapps\common\Team Fortress 2\bin\vpk.exe" build\frankenhud-core
:: Clean up
ECHO.
Choice /M "Clean up files?"
:: No
If Errorlevel 2 GOTO afterclean
:: Yes
If Errorlevel 1 GOTO clean
:clean

:afterclean
