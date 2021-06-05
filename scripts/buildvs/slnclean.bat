@echo off

cd ..\..
del /S /Q "*.vs"
del /S "*.sln"
del /S "*.vcxproj"
del /S "*.vcxproj.filters"
del /S "*.vcxproj.user"
cd scripts\buildvs\

if NOT "%1"=="rebuild" (TIMEOUT /t 3 & EXIT)