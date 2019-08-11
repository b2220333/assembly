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
masm %SRC_PATH%\minus.asm %BUILD_PATH%\minus.obj;
pause
masm %SRC_PATH%\text.asm %BUILD_PATH%\text.obj;
pause
masm %SRC_PATH%\int.asm %BUILD_PATH%\int.obj;
pause
masm %SRC_PATH%\testint.asm %BUILD_PATH%\testint.obj;
pause
masm %SRC_PATH%\showText.asm %BUILD_PATH%\showText.obj;
pause
masm %SRC_PATH%\showData.asm %BUILD_PATH%\showData.obj;
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
link %BUILD_PATH%\minus.obj;
pause
link %BUILD_PATH%\text.obj;
pause
link %BUILD_PATH%\int.obj;
pause
link %BUILD_PATH%\testint.obj;
pause
link %BUILD_PATH%\showText.obj;
pause
link %BUILD_PATH%\showData.obj;
pause
copy hello.exe %BUILD_PATH%\hello.exe
copy loop.exe %BUILD_PATH%\loop.exe
copy dw.exe %BUILD_PATH%\dw.exe
copy segments.exe %BUILD_PATH%\segments.exe
copy minus.exe %BUILD_PATH%\minus.exe
copy text.exe %BUILD_PATH%\text.exe
copy int.exe %BUILD_PATH%\int.exe
copy testint.exe %BUILD_PATH%\testint.exe
copy showText.exe %BUILD_PATH%\showText.exe
copy showData.exe %BUILD_PATH%\showData.exe
delete hello.exe
delete loop.exe
delete dw.exe
delete segments.exe
delete minus.exe
delete text.exe
delete int.exe
delete testint.exe
delete showText.exe
delete showData.exe