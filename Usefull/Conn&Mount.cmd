echo off

REM ######################################################
SET puttyPath="C:\Program Files\PuTTY\putty.exe"
SET raspIP="192.168.0.112"
SET raspUser="pi"
SET raspPass="M1shubarbu"
REM ######################################################

REM Connect to Putty
start "Titlu" %puttyPath% -ssh %raspUser%@%raspIP% -pw %raspPass%
exit 


