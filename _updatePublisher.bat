@echo off
setlocal enabledelayedexpansion
set CACHE=input-cache
if not exist %CACHE% mkdir %CACHE%
echo Downloading IG Publisher ...
powershell -ExecutionPolicy Bypass -File "%~dp0_updatePublisher.ps1"
echo Done.