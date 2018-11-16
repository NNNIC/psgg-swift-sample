@echo off
echo :
echo : Clean work folder
echo : cont?
pause
cd /d %~dp0
rd /s /q work 2>nul
md work
copy ref\*.* work\*.*
pause
