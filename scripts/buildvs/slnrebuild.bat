@echo off
@color 0A

set task=rebuild

echo cleaning output...
call outputclean.bat %task%

echo. & echo cleaning .sln files...
call slnclean.bat %task%
echo.

call slnbuild.bat %task%

TIMEOUT /t 3
EXIT