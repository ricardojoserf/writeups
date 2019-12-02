# Heist

The Cisco password from the configuration file can be decrypted:

![Screenshot](images/Screenshot_1.png)


The password can be decrypted:

![Screenshot](images/Screenshot_2.png)



It could be Hazard's password:

![Screenshot](images/Screenshot_4.png)


It seems to be because the authentication with psexec does not fail:

![Screenshot](images/Screenshot_3.png)


But the SMB shares are not writable:

![Screenshot](images/Screenshot_6.png)



It seems there are more ports open:

![Screenshot](images/Screenshot_5.png)


Using the impacket's *lookupsidpy* it is possible to list usernames:

![Screenshot](images/Screenshot_7.png)


Testing the other passwords from the configuration file (which could be cracked very easily online in pages like http://www.ifm.net.nz/cookbooks/passwordcracker.html), it seems Chase's password is one of them:

![Screenshot](images/Screenshot_8.png)


It is possible to connect through Winrm using Evil-WinRM for example:

![Screenshot](images/Screenshot_9.png)


The first flag can be read:

![Screenshot](images/Screenshot_10.png)


First the processes are enumerated:

![Screenshot](images/Screenshot_11.png)


![Screenshot](images/Screenshot_12.png)


More enumeration:

![Screenshot](images/Screenshot_13.png)


It seems suspicious that the process Firefox is running in the machine:

![Screenshot](images/Screenshot_15.png)


Each one can be checked with Powershell:

![Screenshot](images/Screenshot_16.png)


The five processes are dumped using *procdump.exe* and they are analyzed with different commands (like *strings*), and in this case the 5th Firefox process contains the password:

![Screenshot](images/Screenshot_17.png)


The password is reused so it is possible to access as the user Administrator with impacket's psexec:

![Screenshot](images/Screenshot_19.png)


And finally the second flag can be read:

![Screenshot](images/Screenshot_20.png)

