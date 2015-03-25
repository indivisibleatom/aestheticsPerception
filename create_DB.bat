@echo off
rd /S /Q imagesDB
rd /S /Q imagesDBTest
rd /S /Q dataset\imagesDB
rd /S /Q dataset\imagesDBTest
@echo Removed imageDB folders

if "%~1" == "" goto endParse
if "%~1" == "resize" mogrify -resize 256x256! dataset\*.jpg 

@echo Finished parsing commandline
:endParse
..\..\bin\create_db.exe dataset\ dataset\listfilesDelta.txt dataset\imagesDB 1
..\..\bin\create_db.exe dataset\ dataset\listfilesTest.txt dataset\imagesDBTest 1
md imagesDB
md imagesDBTest
xcopy /S dataset\imagesDB imagesDB
xcopy /S dataset\imagesDBTest imagesDBTest
