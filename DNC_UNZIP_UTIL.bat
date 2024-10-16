:::::::::::::::::::::::::::::::::::
::	 DNC UNZIP UTILITY	 ::
::	AUTHOR: JUSTIN HARTE	 ::
::	    VERSION 1		 ::
:::::::::::::::::::::::::::::::::::
@echo off
color a
title=DNC UNZIP UTILITY
setlocal enabledelayedexpansion

ECHO BEGIN PROGRAM
dir /a /b "*.zip" > dir.txt

REM MAKE A LOOP TO ITERATE THROUGH ALL THE FILES
FOR /F "eol=; delims=" %%a in (dir.txt) do (

REM EXTRACT THE FILES
echo extracting %%a
tar -xf %%a
cls

REM MAKE A LOOP TO FIND THE ZIP FILES 
cd mnt/vector2/dnc/updated/
dir /ad /b > folders.txt
for /f %%c in (folders.txt) do cd %%c
cd vpf

REM MOVE ALL FILES TO ROOT
DIR /a /b "*.zip" > zipped.txt
dir /a /b > rootedir.txt
for /f %%d in (rootedir.txt) do move %%d ../../../../../../
cls

REM DONT FORGET TO GO HOME NOW
cd ../../../../../../

REM USE THE ZIPPED DIR LIST
for /f %%e in (zipped.txt) do echo extracting %%e & tar -xf %%e
cls

REM CLEANUP HOME
echo CLEANING UP...
for /f %%f in (rootedir.txt) do (
rmdir /s /q mnt
del %%f
)
echo CLEANUP COMPLETE
)
echo PROGRAM FINISHED
pause