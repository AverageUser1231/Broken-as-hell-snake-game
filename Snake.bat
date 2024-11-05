@echo off
setlocal enabledelayedexpansion

set "width=10"
set "height=10"
set "snakeX=5"
set "snakeY=5"
set "direction=RIGHT"

:gameLoop
cls
for /L %%y in (1,1,%height%) do (
    for /L %%x in (1,1,%width%) do (
        if %%x==%snakeX% if %%y==%snakeY% (
            set "char=O"
        ) else (
            set "char=."
        )
        set /p="!char!" <nul
    )
    echo.
)

set /p "input=Use WASD to move (W/A/S/D): "
if /i "!input!"=="W" set /a snakeY-=1
if /i "!input!"=="S" set /a snakeY+=1
if /i "!input!"=="A" set /a snakeX-=1
if /i "!input!"=="D" set /a snakeX+=1

if %snakeX% lss 1 set snakeX=1
if %snakeX% gtr %width% set snakeX=%width%
if %snakeY% lss 1 set snakeY=1
if %snakeY% gtr %height% set snakeY=%height%

goto gameLoop
