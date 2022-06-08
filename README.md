# ExplainLinuxFS

Get info of the linux standard directories at the command-line, and go there.

Explains /etc
```powershell
ldexplain etc
```

Explains all standard directories
```powershell
ldexplain -All
```

Explains /etc, and sets the current working directory to /etc (Linux only)
```powershell
ldexplain etc -Go
```

Explains /root, and displays the full explain message using the Full parameter
```powershell
ldexplain root -Full
```


## Demo
![](ExplainLinuxFS.gif)

This module does not work in Windows PowerShell

## Sources / Credits
Sources of the explanations are:
- https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/c23.html
- https://linux.die.net/man/
- https://en.wikipedia.org/