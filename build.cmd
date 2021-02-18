@echo off
set Build="%SYSTEMDRIVE%\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\MSBuild\Current\Bin\MsBuild.exe"
if exist publish rd /s /q publish
%Build% "NET20/Afx.Tcp.Host/Afx.Tcp.Host.csproj" /t:Rebuild /p:Configuration=Release
%Build% "NET40/Afx.Tcp.Host/Afx.Tcp.Host.csproj" /t:Rebuild /p:Configuration=Release
dotnet build "NETStandard2.0/Afx.Tcp.Host/Afx.Tcp.Host.csproj" -c Release
dotnet build "NETStandard2.1/Afx.Tcp.Host/Afx.Tcp.Host.csproj" -c Release
cd publish
del /q/s *.pdb
del /q/s Afx.Sockets*
del /q/s protobuf-net*
del /q/s Afx.Base*
del /q/s Afx.Tcp.Protocols*
pause