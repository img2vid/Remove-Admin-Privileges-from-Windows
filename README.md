To remove Administrator privileges from Windows 11:

Download Remove-Admin.ps1 file.
Click the search box in the bar at the bottom of the screen.
Type 'powershell'.
Right-click 'Windows Powershell' and click 'Run as administrator'.
Accept the prompt to allow Powershell to make changes to the device.
In the window that opens, copy-paste this text and press Enter:

Set-ExecutionPolicy RemoteSigned

Type:

A

and press Enter.

Type:

cd (location of the Remove-Admin.ps1 file)

where the text in brackets represent the location of the Remove-Admin.ps1 file. Do not include the brackets. The location may look like this:
C:\Users\aishi\Downloads\a
You can find the file location at the top of the Windows Explorer.
So the command in my case looks like this:
cd C:\Users\aishi\Downloads\a

Type:

./Remove-Admin.ps1

Then type the user, which in my case is 'aishi'.
You can find the user in the bar on top of the Windows Explorer. It's part of the file location after C:\Users
