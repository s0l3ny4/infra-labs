@echo off
net stop spooler
net start spooler
echo {OK} O servico Spooler de Impressao foi reiniciado.
pause