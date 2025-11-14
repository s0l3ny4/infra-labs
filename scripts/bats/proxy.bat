reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer 
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride
reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Hostname
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Domain
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v NameServer
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DhcpNameServer
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v SearchList
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
pause