@echo off

cd ..\..
del /S /Q "*.vs"
del /S /Q "*.sln"
del /S /Q "*.vcxproj"
del /S /Q "*.vcxproj.filters"
del /S /Q "*.vcxproj.user"
cd scripts\buildvs\

if NOT "%1"=="rebuild" (TIMEOUT /t 3 & EXIT)