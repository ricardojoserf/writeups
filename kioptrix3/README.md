# Kioptrix: Level 1.2 (#3)
Vulnhub page: https://www.vulnhub.com/entry/kioptrix-level-12-3,24/
#### Information gathering

Nmap scan:

![Screenshot](images/1.png)

Nikto scan:

![Screenshot](images/2.png)

Directory scan (through dirsearch):

![Screenshot](images/3.png)

#### Information gathering in the Website

List directories in /modules:

![Screenshot](images/4.png)

Check PHPAdmin page:

![Screenshot](images/5.png)

#### Lotus exploit

Locate it:

![Screenshot](images/6.png)

Run it:

![Screenshot](images/7.png)

The reverse shell is correctly created:

![Screenshot](images/8.png)

#### Recon phase

Find Kernel version:

![Screenshot](images/9.png)

Locate and read interesting files as admin.dat or salt.dat:

![Screenshot](images/10.png)


![Screenshot](images/12.png)

I tried a lot of stuff in here, trying to deofuscate code and such, but no results. As always, it was far easier xDD

#### Locate credentials 

PHPadmin credentials are stored in clear text! In general if there is a database and you have low-privileged access, look for them! Usually they are stored in files with "config" in them. In this case:

![Screenshot](images/18.png)

#### PHPAdmin recon

Access using the website

![Screenshot](images/19.png)

Find the developers accounts table:

![Screenshot](images/20.png)

Read the values:

![Screenshot](images/21.png)

Crack them:

![Screenshot](images/22.png)

#### SSH access

Text

![Screenshot](images/23.png)

#### Subtitle

Check what can each user do with "sudo -l". Loneferret can do anything! Maybe "sudo su" would be a faster way, but let us try to do it with... awk, for example xD:

![Screenshot](images/24.png)


![Screenshot](images/25.png)

