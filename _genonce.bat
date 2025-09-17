@echo off
setlocal enabledelayedexpansion
set JAR=input-cache\publisher.jar
if not exist %JAR% call "_updatePublisher.bat"
java -version
java -jar %JAR% -ig ig.ini