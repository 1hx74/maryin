@echo off
if "%1"=="-?" goto help
if "%1"=="/?" goto help
if "%1"=="help" goto help
if "%1"=="hlep" goto help
if "%1"=="-help" goto help
if "%1"=="--help" goto help

cd %1
:fon
set intr=%RANDOM%
dir "%cd%\cache%intr%" >nul 2>&1
if %errorlevel%==0 (
	goto fon
) else (
	FOR /R %DIR% %%f IN (*.txt) DO (
	iconv -c -f CP866 -t UTF-8 %%f > cache%intr%
	type cache%intr% > %%f
	)
) 


)
pause :: for otladka
del cache%intr%
goto end

:error
echo error with cod: %errorlevel%
goro end

:help
echo this is SPARTA!
goto end

:end