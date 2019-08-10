::这是注释
@echo off
set SRC_PATH=codes\new
set BUILD_PATH=codes\new\build
echo "start compile"
masm %SRC_PATH%\hello.asm %BUILD_PATH%\hello.obj;
pause
masm %SRC_PATH%\loop.asm %BUILD_PATH%\loop.obj;
pause
masm %SRC_PATH%\dw.asm %BUILD_PATH%\dw.obj;
pause
masm %SRC_PATH%\segments.asm %BUILD_PATH%\segments.obj;
pause
echo "start link"
link %BUILD_PATH%\hello.obj;
pause
link %BUILD_PATH%\loop.obj;
pause
link %BUILD_PATH%\dw.obj;
pause
link %BUILD_PATH%\segments.obj;
pause
copy hello.exe %BUILD_PATH%\hello.exe
copy loop.exe %BUILD_PATH%\loop.exe
copy dw.exe %BUILD_PATH%\dw.exe
copy segments.exe %BUILD_PATH%\segments.exe
delete hello.exe
delete loop.exe
delete dw.exe
delete segments.exe