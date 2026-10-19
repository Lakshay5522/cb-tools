@echo off
setlocal EnableExtensions
title Remove CodeBlocks Command Tools
set "DEST=%LOCALAPPDATA%\cb-tools"
echo.
echo This removes the installed tool folder and its user PATH entry.
echo It does not delete project files or erase system history.
echo.
choice /C YN /N /M "Remove installed CodeBlocks tools? [Y/N] "
if errorlevel 2 exit /b 0
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $dest=$env:DEST; $p=[Environment]::GetEnvironmentVariable('Path','User'); $a=@(); if($p){$a=$p -split ';' | Where-Object { $_ -and $_.TrimEnd('\') -ine $dest.TrimEnd('\') }}; [Environment]::SetEnvironmentVariable('Path',($a -join ';'),'User'); if(Test-Path -LiteralPath $dest){Remove-Item -LiteralPath $dest -Recurse -Force}; if(Test-Path -LiteralPath $dest){throw 'Tool folder still exists'}"
if errorlevel 1 (
 echo ERROR: Removal failed. Check whether files are in use.
 pause
 exit /b 1
)
echo Installed tools removed. Close and reopen CMD.
pause
