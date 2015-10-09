# cmder-with-bash
Getting Cmder to run bash with pretty colors. Uses scripts from `https://wiki.archlinux.org/index.php/Color_Bash_Prompt` and the files that come with Git-Bash `http://www.git-scm.com/downloads`

# Setup:
Create a new task with this command: 

```cmd /k "%ConEmuDir%\..\init.bat&set PATH=%PATH%;C:\Program Files\Git\usr\bin&"C:\Program Files\Git\bin\bash.exe"" -new_console:d:%USERPROFILE%```

Add this parameter if you want the Cmder icon:
```
/icon "%CMDER_ROOT%\cmder.exe"
```

Then copy `.bashrc` and `.dir_colors` to your home (%userprofile%) directory.
