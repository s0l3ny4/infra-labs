@echo off
chcp 65001 >nul
title Relatório Amigável do Sistema
color 0A
setlocal enabledelayedexpansion

:: =========================
:: Arquivo de saída
:: =========================
set OUTPUT=%~dp0Relatorio_Facil.txt
if exist "%OUTPUT%" del "%OUTPUT%"

(
echo ==========================================================
echo        RELATÓRIO DO SISTEMA WINDOWS - LEITURA FÁCIL
echo ==========================================================
echo.
) > "%OUTPUT%"

echo Coletando informações do computador, aguarde...
echo.

:: =========================
:: REDE E CONEXÃO
:: =========================
echo === REDE E CONEXÃO === >> "%OUTPUT%"
for /f "tokens=2,*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Hostname 2^>nul') do echo - Nome do computador: %%B >> "%OUTPUT%"
for /f "tokens=2,*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Domain 2^>nul') do echo - Domínio: %%B >> "%OUTPUT%"
for /f "tokens=2,*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DhcpNameServer 2^>nul') do (
    if "%%B"=="" (
        echo - Servidor DHCP: Não disponível >> "%OUTPUT%"
    ) else (
        echo - Servidor DHCP: %%B >> "%OUTPUT%"
    )
)
echo. >> "%OUTPUT%"

:: =========================
:: HARDWARE E BIOS
:: =========================
echo === HARDWARE DO COMPUTADOR === >> "%OUTPUT%"
for %%V in (SystemManufacturer SystemProductName BaseBoardManufacturer BaseBoardProduct BIOSVendor BIOSVersion BIOSReleaseDate) do (
    for /f "tokens=2,*" %%A in ('reg query "HKLM\HARDWARE\DESCRIPTION\System\BIOS" /v %%V 2^>nul') do (
        echo - %%V: %%B >> "%OUTPUT%"
    )
)
for /f "tokens=2,*" %%A in ('reg query "HKLM\HARDWARE\DESCRIPTION\System\CentralProcessor\0" /v ProcessorNameString 2^>nul') do echo - Processador: %%B >> "%OUTPUT%"
echo. >> "%OUTPUT%"

:: =========================
:: AUTENTICAÇÃO E PREBOOT
:: =========================
echo === AUTENTICAÇÃO E INÍCIO DO SISTEMA === >> "%OUTPUT%"
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\Settings" /v DeviceCompatibleWithExternalAuthHardware >nul 2>&1
if !errorlevel! == 0 (
    for /f "tokens=2,*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\Settings" /v DeviceCompatibleWithExternalAuthHardware') do (
        if %%B==0x1 (
            echo - Compatível com dispositivos externos de autenticação >> "%OUTPUT%"
        ) else (
            echo - NÃO compatível com dispositivos externos de autenticação >> "%OUTPUT%"
        )
    )
) else (
    echo - Compatibilidade com dispositivos externos de autenticação: Não disponível >> "%OUTPUT%"
)
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\PLAP Providers" >nul 2>&1
if !errorlevel! == 0 (
    echo - Provedor de autenticação PLAP detectado >> "%OUTPUT%"
) else (
    echo - Provedor de autenticação PLAP: Não disponível >> "%OUTPUT%"
)
echo. >> "%OUTPUT%"

:: =========================
:: SISTEMA OPERACIONAL
:: =========================
echo === SISTEMA OPERACIONAL === >> "%OUTPUT%"
for /f "tokens=2,*" %%A in ('wmic os get Caption^, Version^, BuildNumber /value ^| find "="') do echo - %%A: %%B >> "%OUTPUT%"
:: Data de instalação
for /f "tokens=2*" %%A in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v InstallDate 2^>nul') do set winInstall=%%B
for /f %%A in ('powershell -NoProfile -Command "[datetime]::UnixEpoch.AddSeconds(%winInstall%).ToLocalTime().ToString('dd/MM/yyyy HH:mm:ss')"') do set winInstallReadable=%%A
echo - Data de instalação do Windows: %winInstallReadable% >> "%OUTPUT%"
echo. >> "%OUTPUT%"

:: =========================
:: MEMÓRIA RAM
:: =========================
echo === MEMÓRIA RAM === >> "%OUTPUT%"
for /f %%A in ('powershell -NoProfile -Command "[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1MB,2)"') do set RAMMB=%%A
for /f %%A in ('powershell -NoProfile -Command "[math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB,2)"') do set RAMGB=%%A
echo - Total de RAM instalada: %RAMMB% MB (%RAMGB% GB) >> "%OUTPUT%"
echo. >> "%OUTPUT%"


:: =========================
:: ANTIVÍRUS E FIREWALL
:: =========================
echo === ANTIVÍRUS E FIREWALL === >> "%OUTPUT%"
echo - Firewall do Windows: >> "%OUTPUT%"
netsh advfirewall show allprofiles state >> "%OUTPUT%"
echo. >> "%OUTPUT%"

echo - Antivírus instalado (Windows Defender ou outros): >> "%OUTPUT%"
wmic /namespace:\\root\SecurityCenter2 path AntivirusProduct get displayName /value >> "%OUTPUT%"
echo. >> "%OUTPUT%"

:: =========================
:: DATA E HORA DO RELATÓRIO
:: =========================
echo === DATA E HORA DO RELATÓRIO === >> "%OUTPUT%"
echo - %DATE% %TIME% >> "%OUTPUT%"
echo. >> "%OUTPUT%"

:: =========================
:: FINALIZAÇÃO
:: =========================
echo ========================================================== >> "%OUTPUT%"
echo Relatório concluído: %OUTPUT% >> "%OUTPUT%"
echo =========================================================
echo.
echo Relatório gerado com sucesso! Verifique: %OUTPUT%
pause
