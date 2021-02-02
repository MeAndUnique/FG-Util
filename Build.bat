@echo off

rem get file name
for %%I in (.) do set FileName=%%~nxI

rem get target directory
for /d %%d in (*.*) do (
    if %%d==extension (set Target=%%d)
    if %%d==module (set Target=%%d)
)

rem get extension
if %Target%==extension (set FileExt=ext)
if %Target%==module (set FileExt=mod)

set FileName=%FileName%.%FileExt%
echo %FileName%

del source.zip
"D:\Program Files\7-Zip\7z.exe" a source.zip .\%Target%\*
del %FileName%
ren source.zip %FileName%
