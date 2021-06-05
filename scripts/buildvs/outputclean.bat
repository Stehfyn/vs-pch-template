@echo off

cd ..\..
rd /S /Q build\bin
rd /S /Q build\obj
cd scripts\buildvs

if NOT "%1"=="rebuild" (TIMEOUT /t 3 & EXIT)