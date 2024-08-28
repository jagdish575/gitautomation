@echo off

REM Change to your repository directory
cd /d "C:\Users\jagdi\Videos\github automation"

REM Loop to create five commits
for /l %%x in (1, 1, 5) do (

    REM Create or update a file with the current date and time
    echo Last update: %date% %time% > daily_update.txt

    REM Add the file to the staging area
    git add daily_update.txt

    REM Commit the changes with a message, include the loop counter to differentiate each commit
    git commit -m "Daily update %%x: %date% %time%"
    
    REM Push the changes to the remote repository
    git push origin main

    REM Optional delay to ensure unique timestamps (can be removed if not needed)
    timeout /t 1 >nul
)

REM Final push to ensure everything is up-to-date (optional)
git push origin main
