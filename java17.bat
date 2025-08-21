@echo off
setlocal enabledelayedexpansion

REM Définit Java 17
set "JAVA_HOME=C:\Program Files\Zulu\zulu-17"

REM Nettoie le PATH des anciens JAVA
set "PATH_TMP="
for %%i in ("!PATH:;=" "!") do (
    set "item=%%~i"
    echo !item! | findstr /i "Java" >nul
    if errorlevel 1 (
        if defined PATH_TMP (
            set "PATH_TMP=!PATH_TMP!;!item!"
        ) else (
            set "PATH_TMP=!item!"
        )
    )
)
set "PATH=%JAVA_HOME%\bin;!PATH_TMP!"

echo JAVA_HOME set to %JAVA_HOME%
java %*
endlocal