@echo off
setlocal EnableExtensions
set "TOOLDIR=%~dp0"
set "CODEFILE=%TOOLDIR%codes.txt"
if not exist "%CODEFILE%" (
  echo ERROR: codes.txt not found next to os.cmd
  exit /b 2
)

if not "%~1"=="" goto :direct
goto :menu

:direct
set "KEY=%~1"
echo %KEY%| findstr /r "^[0-9]" >nul && set "KEY=os%KEY%"
call :inject
exit /b %errorlevel%

:menu
echo.
echo ============ Code Menu ============
echo   1. Data Structures   (C++  -^> main.cpp)
echo   2. Operating Systems (Java -^> ClassName.java)
echo   3. Exit
echo.
choice /C 123 /N /M "Select category: "
if errorlevel 3 exit /b 0
if errorlevel 2 goto :osmenu
goto :dsmenu

:dsmenu
echo.
echo --- Data Structures  (C++ -^> main.cpp) ---
echo    1 ADT            2 CRUD           3 Stack
echo    4 Undo           5 Infix2Postfix  6 Circular Queue
echo    7 Singly LL      8 Playlist       9 Doubly LL
echo   10 DLL ins/del   11 Undo/Redo     12 BST
echo   13 Inorder       14 Preorder     15 Postorder
echo   16 Max Heap      17 Min Heap     18 Min Heap insert
echo   19 Max Heap ins  20 Adj Matrix   21 Adj List
echo   22 BFS/DFS       23 Hash Linear  24 Hash Chaining
echo   25 Hash Linear+delete
echo    0 Back
echo.
set "N="
set /p "N=Choose option: "
set "KEY="
if "%N%"=="1"  set "KEY=ds1a"
if "%N%"=="2"  set "KEY=ds1b"
if "%N%"=="3"  set "KEY=ds2a"
if "%N%"=="4"  set "KEY=ds2b"
if "%N%"=="5"  set "KEY=ds2c"
if "%N%"=="6"  set "KEY=ds3a"
if "%N%"=="7"  set "KEY=ds4a"
if "%N%"=="8"  set "KEY=ds4b"
if "%N%"=="9"  set "KEY=ds5a"
if "%N%"=="10" set "KEY=ds5b"
if "%N%"=="11" set "KEY=ds5c"
if "%N%"=="12" set "KEY=ds7a"
if "%N%"=="13" set "KEY=ds7b"
if "%N%"=="14" set "KEY=ds7c"
if "%N%"=="15" set "KEY=ds7d"
if "%N%"=="16" set "KEY=ds8a"
if "%N%"=="17" set "KEY=ds8b"
if "%N%"=="18" set "KEY=ds8c"
if "%N%"=="19" set "KEY=ds8d"
if "%N%"=="20" set "KEY=ds9a"
if "%N%"=="21" set "KEY=ds9b"
if "%N%"=="22" set "KEY=ds9c"
if "%N%"=="23" set "KEY=ds10a"
if "%N%"=="24" set "KEY=ds10b"
if "%N%"=="25" set "KEY=ds10c"
if "%N%"=="0" goto :menu
if not defined KEY (echo Invalid choice.& pause& goto :dsmenu)
call :inject
pause
goto :menu

:osmenu
echo.
echo --- Operating Systems  (Java -^> ClassName.java) ---
echo    1 Shared Memory      2 Producer-Consumer (Sem)
echo    3 Race Condition     4 Producer-Consumer (Queue)
echo    5 Shared vs Message  6 Thread Lifecycle
echo    7 Thread Joining     8 Execution Timer
echo    9 Fibonacci         10 Synchronization
echo   11 Thread Pool       12 Bounded Buffer
echo   13 Synchronized Acc  14 Circular Queue
echo   15 Readers-Writers   16 Deadlock
echo   17 FCFS              18 FCFS (GFG)
echo   19 Priority Sched    20 Process Sched
echo   21 Yield             22 Pattern
echo   23 JFrame            24 Hash Table
echo   25 Hash Map
echo    0 Back
echo.
set "N="
set /p "N=Choose option: "
set "KEY="
if "%N%"=="1"  set "KEY=os1a"
if "%N%"=="2"  set "KEY=os1b"
if "%N%"=="3"  set "KEY=os1c"
if "%N%"=="4"  set "KEY=os2a"
if "%N%"=="5"  set "KEY=os2b"
if "%N%"=="6"  set "KEY=os3a"
if "%N%"=="7"  set "KEY=os3b"
if "%N%"=="8"  set "KEY=os3c"
if "%N%"=="9"  set "KEY=os4a"
if "%N%"=="10" set "KEY=os4b"
if "%N%"=="11" set "KEY=os4c"
if "%N%"=="12" set "KEY=os5a"
if "%N%"=="13" set "KEY=os5b"
if "%N%"=="14" set "KEY=os5c"
if "%N%"=="15" set "KEY=os6a"
if "%N%"=="16" set "KEY=os6b"
if "%N%"=="17" set "KEY=os7a"
if "%N%"=="18" set "KEY=os7b"
if "%N%"=="19" set "KEY=os7c"
if "%N%"=="20" set "KEY=os8a"
if "%N%"=="21" set "KEY=os8b"
if "%N%"=="22" set "KEY=os9a"
if "%N%"=="23" set "KEY=os9b"
if "%N%"=="24" set "KEY=os10a"
if "%N%"=="25" set "KEY=os10b"
if "%N%"=="0" goto :menu
if not defined KEY (echo Invalid choice.& pause& goto :osmenu)
call :inject
pause
goto :menu

:inject
set "TARGETDIR=%CD%"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$ErrorActionPreference='Stop'; $lines=[IO.File]::ReadAllLines($env:CODEFILE); $sections=@(); $cur=$null; $body=New-Object System.Collections.Generic.List[string]; foreach($line in $lines){ if($line -match '^\s*@end\s*$'){ if($null -ne $cur){ $sections += [pscustomobject]@{Id=$cur.Id;Alias=$cur.Alias;Body=($body -join [Environment]::NewLine)} }; $cur=$null; $body=New-Object System.Collections.Generic.List[string]; continue }; if($line -match '^@(\S+)(?:\s+@?(\S+))?\s*$'){ if($null -ne $cur){ $sections += [pscustomobject]@{Id=$cur.Id;Alias=$cur.Alias;Body=($body -join [Environment]::NewLine)} }; $cur=[pscustomobject]@{Id=$matches[1];Alias=$matches[2]}; $body=New-Object System.Collections.Generic.List[string]; continue }; if($null -ne $cur){ [void]$body.Add($line) } }; if($null -ne $cur){ $sections += [pscustomobject]@{Id=$cur.Id;Alias=$cur.Alias;Body=($body -join [Environment]::NewLine)} }; $key=$env:KEY; $found=$null; foreach($s in $sections){ if($s.Id -ieq $key -or ($s.Alias -and $s.Alias -ieq $key)){ $found=$s; break } }; if($null -eq $found){ Write-Host ('Section not found: '+$key) -ForegroundColor Red; exit 4 }; $code=$found.Body.Trim()+[Environment]::NewLine; if($found.Id -match '^os'){ $clean=[regex]::Replace($code,'//[^\n]*',''); $clean=[regex]::Replace($clean,'/\*(?s).*?\*/',''); $pm=[regex]::Match($clean,'public\s+class\s+(\w+)'); $name=$null; if($pm.Success){ $name=$pm.Groups[1].Value } else { $mi=$clean.IndexOf('public static void main'); foreach($x in [regex]::Matches($clean,'class\s+(\w+)')){ if($x.Index -lt $mi){ $name=$x.Groups[1].Value } } }; if(-not $name){ Write-Host 'Java class name not found' -ForegroundColor Red; exit 5 }; $target=Join-Path $env:TARGETDIR ($name+'.java') } else { $target=Join-Path $env:TARGETDIR 'main.cpp' }; [IO.File]::WriteAllText($target,$code,[Text.UTF8Encoding]::new($false)); Write-Host ('Wrote '+$target) -ForegroundColor Green"
if errorlevel 1 (
  echo ERROR: Injection failed.
  exit /b 4
)
echo Return to Code::Blocks and Build ^> Build and Run.
exit /b 0
