@echo off
setlocal

echo:
echo Setting OEMID in RegEdit...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Store" /v OEMID /f /t REG_SZ /d DELL
echo:

echo Setting SCMID...
echo Fetching System Model Name
for /f "tokens=2 delims==" %%a in ('wmic computersystem get model /format:list') do set SYSMODEL=%%a
set SYSMODEL=%SYSMODEL: =%
echo System Model Name is "%SYSMODEL%"
for /f "tokens=1 delims= " %%a in ("%SYSMODEL%") do set SYSNAME=%%a
echo System Name is %SYSNAME%
set SCMID=DELL_%SYSNAME%
echo SCMID to be set is %SCMID%

echo Setting SCMID in RegEdit
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Store" /v StoreContentModifier /f /t REG_SZ /d %SCMID%