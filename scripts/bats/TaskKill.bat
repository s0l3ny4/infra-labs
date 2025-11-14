:MENU
@echo off
title Menu de Lista de Processos e Task Kill
color 0A
cls
echo ================================================
echo      MENU - TASKLIST KILL 
echo ================================================
echo 1. Verificar a Lista de Processos
echo 2. Eliminar processo
echo 0. Sair
echo ================================================
set /p opcao=Escolha uma opcao: 

if "%opcao%"=="1" goto LISTAR
if "%opcao%"=="2" goto KILL
if "%opcao%"=="0" goto SAIR
goto MENU


:LISTAR
cls
echo ================================================
echo                 PROCESSO ATUAIS
echo ================================================

tasklist

echo.
pause
goto MENU

:KILL
cls
echo ================================================
echo                ENCERRAR UM PROCESSO
echo ================================================
echo.

set /p processo=Digite o nome do processo(ex. chrome.exe)
echo %processo%
taskkill /IM %processo% /F
if errorlevel 1 (
	echo.
	echo {ERRO} NAO FOI POSSIVEL ENCERRAR O PROCESSO "%processo%"
)else (
	echo .
	echo {OK} "%processo%" ENCERRADO 

)
echo.
pause
goto MENU