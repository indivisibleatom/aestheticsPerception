@echo off
rd /S /Q imagesDBComposition
rd /S /Q composition\imagesDBComposition
@echo Removed imageDBComposition folders

if "%~1" == "" goto endParse
if "%~1" == "resize" mogrify -resize 256x256! dataset\*.jpg 

@echo Finished parsing commandline
:endParse
..\..\bin\create_db.exe composition\ composition\listfilesComposition.txt composition\imagesDBComposition
md imagesDBComposition
xcopy /S composition\imagesDBComposition imagesDBComposition
