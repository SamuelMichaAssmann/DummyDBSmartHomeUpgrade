@echo off

:loop

set pro=100
set /a isan =%random% %%pro% + 1

if %isan% GTR 70 (
	set on=0
) ELSE (
	set on=1
)
echo %on%--on--%isan%--pro--1.IF

:direkt

if %on% EQU 1 (
	set laut=180
	set /a wurf =%random% %%laut% + 1
) ELSE (
	set wurf=0
	set b=0
)


if %wurf% GTR 10 (
	set b=1
) ELSE (
	set b=0
)


set SORTDATE=%date:~0,10%#%time:~0,5%#%b%#%wurf%dB
echo %SORTDATE%

echo %SORTDATE% >> ./W001

git add .
git commit -m "Add existing file"
git push origin master

timeout 3600

SET /a count+=1
echo -----%count%------

if %count% EQU 10 (
	SET /a count=0
	goto loop
)



if %on% EQU 0 (
	goto direkt
)ELSE (
	goto loop
)
