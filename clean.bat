@ECHO OFF
ECHO This will clean the directory for a new build process.
PAUSE
rmdir /s /q build
rmdir /s /q frankenhud-master
del /s /q *.zip
del /s /q *.vpk
pause