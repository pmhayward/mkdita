@echo off
cls
echo.
echo Make 1000 files
echo ===============
echo.





FOR /L %%A IN (1,1,500) DO (
@echo # Lorem ipsum %%Atext> lorem_%%A.md
)