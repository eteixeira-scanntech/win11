@echo off
setlocal
set URL=https://raw.githubusercontent.com/eteixeira-scanntech/win11/refs/heads/main/unattend.xml
set DEST=C:\Windows\Panther\unattend.xml

echo Creando carpeta Panther si no existe...
mkdir "C:\Windows\Panther" >nul 2>&1

echo Descargando archivo unattend.xml...
curl -L "%URL%" -o "%DEST%"
if not exist "%DEST%" (
    echo Error: No se pudo descargar unattend.xml
    pause
    exit /b 1
)

echo Ejecutando Sysprep...
cd /d %SystemRoot%\System32\Sysprep
Sysprep.exe /oobe /quiet /reboot /unattend:%DEST%

endlocal
