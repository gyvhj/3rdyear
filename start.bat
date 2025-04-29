@echo off
setlocal

REM 
set MYSQL_PATH=mysql-5.0.51b-winx64\bin\mysqld.exe
set TOMCAT_START=tomcat9\bin\startup.bat

start "" /min "%MYSQL_PATH%"

call "%TOMCAT_START%"

endlocal
exit /b