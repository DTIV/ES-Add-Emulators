@echo off
setlocal enabledelayedexpansion

:: Get the selected ISO from EmulationStation
set "gameISO=%~1"

:: Ensure an ISO file was provided
if "%gameISO%"=="" (
    echo No ISO selected. Booting Windows 98 without a game CD.
    "C:\Program Files\DOSBox-X\dosbox-x.exe" -conf "C:\Program Files\DOSBox-X\win98.conf"
    exit
)

:: Extract the directory containing the selected ISO
for %%I in ("%gameISO%") do set "gameDir=%%~dpI"

:: Normalize path (remove trailing \ if present)
set "gameDir=%gameDir:~0,-1%"

:: Log file location
set "logFile=C:\Emulation\bios\win98\mount_log.txt"

:: Clear the log file
echo =============================== > "%logFile%"
echo Game ISO: %gameISO% >> "%logFile%"
echo Game Directory: %gameDir% >> "%logFile%"
echo =============================== >> "%logFile%"

:: Initialize IMGMOUNT command
set "mountCmd=IMGMOUNT D"
for %%F in ("%gameDir%\*.iso") do (
    echo Adding to mount: %%F >> "%logFile%"
    set mountCmd=!mountCmd! %%F
)
set "mountCmd=!mountCmd! -t iso -ide 2m"

:: Log the final mount command
echo Mount Command: %mountCmd% >> "%logFile%"
echo =============================== >> "%logFile%"

:: Define absolute path for HDD image
set "hddImgPath=C:\Program Files\DOSBox-X\hdd.img"

:: Launch DOSBox-X with the correct working directory & fix C: conflict
cd /d "C:\Program Files\DOSBox-X"
"C:\Program Files\DOSBox-X\dosbox-x.exe" -conf "C:\Program Files\DOSBox-X\win98.conf" ^
    -c "MOUNT C 'C:\Program Files\DOSBox-X'" ^
    -c "IMGMOUNT 0 empty -fs none -t floppy" ^
    -c "IMGMOUNT 1 empty -fs none -t floppy -size 512,15,2,80" ^
    -c "IMGMOUNT -u C" ^
    -c "@ping -n 2 127.0.0.1 >nul" ^
    -c "IMGMOUNT C \"!hddImgPath!\" -ide 1m" ^
    -c "!mountCmd!" ^
    -c "BOOT C:"

exit
