@echo off
setlocal EnableExtensions
title CodeBlocks Tools Setup
set "DEST=%LOCALAPPDATA%\cb-tools"
if not exist "%~dp0codes.txt" (
 echo ERROR: Extract the ZIP and run setup.cmd from the extracted folder.
 pause
 exit /b 1
)
if not exist "%DEST%" mkdir "%DEST%"
copy /y "%~dp0codes.txt"  "%DEST%\codes.txt"  >nul || goto :fail
copy /y "%~dp0os.cmd"     "%DEST%\os.cmd"     >nul || goto :fail
copy /y "%~dp0wipe.cmd"   "%DEST%\wipe.cmd"   >nul || goto :fail
copy /y "%~dp0README.txt" "%DEST%\README.txt" >nul || goto :fail
rem Add the tool folder to the user PATH if it is not already there.
powershell -NoProfile -Command "$d=$env:DEST; $p=[Environment]::GetEnvironmentVariable('Path','User'); $a=@(); if($p){$a=$p -split ';' | Where-Object { $_ }}; if(-not ($a | Where-Object { $_.TrimEnd('\') -ieq $d.TrimEnd('\') })) { [Environment]::SetEnvironmentVariable('Path',(($a + $d) -join ';'),'User') }"
if errorlevel 1 echo WARNING: Could not update PATH automatically.
echo.
echo Installed to %DEST%
echo Close this window, open a NEW CMD, then type:  os
echo Works offline after setup.
pause
exit /b 0
:fail
echo ERROR copying tool files.
pause
exit /b 2
