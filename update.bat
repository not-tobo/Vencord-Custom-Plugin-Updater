@echo off
echo.
echo [36m   ===^> Killing Discord... [0m
echo.
taskkill /f /im DiscordCanary.exe
timeout 2 > NUL
echo.
echo [32m   ===^> Killed Discord. [0m
echo.
echo [36m   ===^> Updating Repos... [0m
echo.
cd src/userplugins/
for /f "tokens=* delims=" %%i in ('dir /ad /b "."') do (
    pushd "%cd%\%%i"
        if EXIST ".git\" (
            call git pull
        )
    popd
)
echo.
echo [32m   ===^> Updated Plugin Repos. [0m
echo.
echo [36m   ===^> Updating Vencord Repo... [0m
echo.
call git pull
echo.
echo [32m   ===^> Updated Vencord Repos. [0m
echo.
echo [36m   ===^> Building Vencord and Plugins... [0m
cmd /c pnpm build
echo.
echo [32m   ===^> Builded Vencord and Plugins. [0m
echo.
timeout 2 > NUL
echo [36m   ===^> Starting Discord... [0m
echo.
start C:\Users\Topi\AppData\Local\DiscordCanary\Update.exe --processStart DiscordCanary.exe
echo [32m   ===^> Done. [0m
timeout 3 > NUL
exit
