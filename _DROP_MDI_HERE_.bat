@echo off
chcp 65001 > nul
setlocal

:: MDI2TIF.EXE
set "mdi2tifPath=%~dp0\MDI2TIF.EXE"

:: TIFF dir
set "outputDir=%~dp0\converted"

:: log-file
set "logFile=%~dp0\converter.log"

:: Drop file check
if "%~1"=="" (
    echo Drop .mdi on this .bat file
    pause
    exit /b
)

:: set sourcefile path var
set "sourceFile=%~1"

:: get name of file
for %%F in ("%sourceFile%") do set "fileName=%%~nF"

:: create dir if it does not exist
if not exist "%outputDir%" (
    mkdir "%outputDir%"
)

:: the final conversion
"%mdi2tifPath%" -source "%sourceFile%" -dest "%outputDir%\%fileName%.tif" -log "%logFile%"