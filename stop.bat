@echo off
call "tomcat9\bin\shutdown.bat"
taskkill /f /im mysqld.exe >nul 2>&1
exit /b