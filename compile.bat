@echo off

for %%a in (%*) do (
  if "%%a"=="--setvar" (
    if exist "%ProgramFiles%\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat" (
      call "%ProgramFiles%\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
    ) else if exist "%ProgramFiles%\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" (
      call "%ProgramFiles%\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"
    ) else (
      echo Visual Studio 2022 not found.
    )
  )
  if "%%a"=="--clean" (
    msbuild "PCSX2_qt.sln" /m /v:m /p:Configuration=release /t:Clean
  )
)


msbuild "PCSX2_qt.sln" /m /v:m /p:Configuration=release
pause