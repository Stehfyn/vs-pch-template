@echo off

cd ..\..
call vendor\bin\premake5\premake5.exe vs2019
cd scripts\buildvs

if NOT "%1"=="rebuild" (TIMEOUT /t 3 & EXIT)