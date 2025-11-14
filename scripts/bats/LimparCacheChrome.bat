@echo off
set chromeCache=%LocalAppData%\Google\Chrome\User Data\Default\Cache
rd /s /q "%chromeCache%"
echo {OK} Cache do Chrome limpo.
pause
