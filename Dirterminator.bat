@echo off

title Dirterminator - BY Stadof                                                       			             
color 8F
echo.

rem Made by Stadof (GITHUB: https://github.com/stadof/)

timeout /t 1 /nobreak > NUL
openfiles > NUL 2>&1
if %errorlevel%==0 (
echo  Administrator - ON -
) else (
    echo.
    echo.
    echo             --------------------------------------------------------
    echo                               IMPORTANT MESSAGE!
    echo             --------------------------------------------------------
    echo.
    echo.
    echo        ######################################################################
    echo        #                                                                    #
    echo        #  Recommended to be executed as Administrator to clean most files   #
    echo        #  possible. But you can still use the program.                      #
    echo        #                                                                    #
    echo        #  To execute it as Administrator, right-click on me and select      #
    echo        #  'Run as Administrator' and try again.                             #
    echo        #                                                                    #
    echo        #                                                                    #
    echo        #  Press any key to enter the main menu...                           #
    echo        #                                                                    #
    echo        ######################################################################
pause > nul
cls
    goto menu
)

echo.


:menu
echo.
echo.
echo.
echo                                     -----------------
echo                        		     "DIRTERMINATOR"
echo                                     -----------------
echo.
echo                                	        "Stadof"
echo.
echo.
echo                    Date: %date%                  Time: %time%
echo.
echo.
echo            1. Deep clean
echo            2. Cleaning Options
echo            3. Open Cleanmgr          
echo            4. PC config.
echo            5. Customization
echo            6. Exit
echo.           
echo.
echo.
echo.

                set /p uni= - Select option: 

if %uni%==1 goto Clean
if %uni%==2 goto CleaningOptions
if %uni%==3 goto cleanmgr
if %uni%==4 goto PCconf
if %uni%==5 goto Costom
if %uni%==6 goto Exit


:Costom
cls
echo.
echo   Choose a Theme for Dirterminator:
echo.
echo   1. Hacker
echo   2. Modern
echo   3. Summer
echo   4. Power
echo   5. Default (Minimalistic)  
echo.

set /p color_choice=- Enter your choice (1-5): 
if "%color_choice%"=="1" set color_code=0A
if "%color_choice%"=="2" set color_code=A0
if "%color_choice%"=="3" set color_code=1E
if "%color_choice%"=="4" set color_code=6F
if "%color_choice%"=="5" set color_code=8F

if defined color_code (
    color %color_code%
    echo.
    echo  Color changed successfully.
) else (
     echo.
     echo  Invalid choice. Color not changed.
)

echo.
echo  PRESS ANY KEY TO GO BACK TO THE MAIN MENU...
echo.
pause > nul
cls
goto menu


:Clean
echo.
echo  This will delete temporary files and folders.
set /p confirm=- Are you sure you want to continue? (Y/N): 
if /i "%confirm%"=="Y" (
    
    echo.
    echo  CLEANING TEMPORARY FILES...
    echo.
    del /s /f /q "%WinDir%\Temp\*.*"
    del /s /f /q "%WinDir%\Prefetch\*.*"
    del /s /f /q "%Temp%\*.*"
    del /s /f /q "%AppData%\Temp\*.*"
    del /s /f /q "%HomePath%\AppData\LocalLow\Temp\*.*"

    echo.
    echo  DELETING USED DRIVER FILES...
    echo.
    rd /s /q "%SYSTEMDRIVE%\AMD"
    rd /s /q "%SYSTEMDRIVE%\NVIDIA"
    rd /s /q "%SYSTEMDRIVE%\INTEL"

    echo.
    echo  RECREATING EMPTY TEMPORAL FOLDERS...
    echo.
    md "%WinDir%\Temp"
    md "%WinDir%\Prefetch"
    md "%Temp%"
    md "%AppData%\Temp"
    md "%HomePath%\AppData\LocalLow\Temp"

    echo.
    echo  Temporary files have been cleaned 
) else (
    echo.
    echo  Cleaning canceled.
)

echo.
echo.
echo  PRESS ANY KEY TO GO BACK TO THE MAIN MENU...
pause > nul
cls
goto menu

:cleanmgr
echo.
echo  You are about to open Windows file cleaning software
set /p confirm=- Are you sure you want to continue? (Y/N): 
if /i "%confirm%"=="Y" (
start cleanmgr.exe
echo.
echo  Opening cleanmgr.exe
echo.
) else (
    echo.
    echo   Operation cancelled
)
echo.
echo  Press any key to go back to the main menu...
pause > nul
cls
goto menu

:PCconf
echo Opening PC configuration
start control.exe
cls
goto menu

:CleaningOptions
cls
echo.
echo    Cleaning Options:
echo    ----------------
echo   1.- Temporary Files Cleanup
echo   2.- Unused Drivers Files Cleanup
echo   3.- Back to main menu
echo.
set /p cleaning_choice=- Select option: 

if "%cleaning_choice%"=="1" goto CleanTempFiles
if "%cleaning_choice%"=="2" goto CleanUnusedDrivers
if "%cleaning_choice%"=="3" goto gomenu

goto CleaningOptions

:gomenu
cls
goto menu


:CleanTempFiles
echo.
echo This will delete temporary files and folders.
echo.
del /s /f /q "%WinDir%\Temp\*.*"
    del /s /f /q "%WinDir%\Prefetch\*.*"
    del /s /f /q "%Temp%\*.*"
    del /s /f /q "%AppData%\Temp\*.*"
    del /s /f /q "%HomePath%\AppData\LocalLow\Temp\*.*"
echo.
echo  PRESS ANY KEY TO GO BACK TO THE CLEANING OPTIONS SUBMENU... 
echo.
pause > nul
cls
goto CleaningOptions

:CleanUnusedDrivers
echo.
echo This will delete unused drivers files.
echo.
rd /s /q "%SYSTEMDRIVE%\AMD"
    rd /s /q "%SYSTEMDRIVE%\NVIDIA"
    rd /s /q "%SYSTEMDRIVE%\INTEL"
echo.
echo  PRESS ANY KEY TO GO BACK TO THE CLEANING OPTIONS SUBMENU... 
echo.

pause > nul
cls
goto CleaningOptions

:Exit
start exit                                                      			             
