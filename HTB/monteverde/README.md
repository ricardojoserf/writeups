#Monteverde

SMB port (445) is open and it is possible to enumerate the SMB shares:

![Screenshot](images/Screenshot_1.jpg)

Using enum4linux it is possible to get information from the machine, such as some usernames:

![Screenshot](images/Screenshot_2.jpg)

And we can read the description of some user accounts:

![Screenshot](images/Screenshot_3.jpg)

Also we can list the groups:

![Screenshot](images/Screenshot_4.jpg)

It is possible to carry out a brute force attack and get some weak credentials (*SaBatchJobs:SaBatchJobs*):

![Screenshot](images/Screenshot_5.jpg)

Nice! We can connect using smbclient and read some shares:

![Screenshot](images/Screenshot_6.jpg)

There is an interesting file in *mhope* folder:

![Screenshot](images/Screenshot_7.jpg)

The file contains a password:

![Screenshot](images/Screenshot_8.jpg)

And using the Evil-winrm tool it is possible to access with *mhope*:

```
ruby evil-winrm/evil-winrm.rb -i 10.10.10.172 -u mhope -p "4n0therD4y@n0th3r$"
```

![Screenshot](images/Screenshot_8.jpg)

Following [this Adam Chester's blog](https://blog.xpnsec.com/azuread-connect-for-redteam/), we can decrypt the Administrator's password:

And using again Evil-winrm we can get the root.txt flag!

![Screenshot](images/Screenshot_9.jpg)