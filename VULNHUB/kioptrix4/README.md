# Kioptrix: Level 1.3 (#4)
Vulnhub page: https://www.vulnhub.com/entry/kioptrix-level-13-4,25/
#### Information gathering

Nmap scan:

![Screenshot](images/1.png)

Enum4linux scan:

![Screenshot](images/2.png)

![Screenshot](images/3.png)

![Screenshot](images/4.png)

Nikto scan:

![Screenshot](images/6.png)

![Screenshot](images/7.png)


Directory listing (using dirsearch. Gobuster is cool too)

![Screenshot](images/5.png)


#### Website recon

Access the /member route. Test the different users found using Enum4linux:

![Screenshot](images/9.png)

![Screenshot](images/10.png)

Check there is a XSS vulnerability too:

![Screenshot](images/11.png)

#### SSH connection

The shell is weird! It closes the connection after 2 commands...

![Screenshot](images/12.png)

Well but it seems that it is possible to enumerate directories and files! At least the first one hehe...

![Screenshot](images/13.png)

Let us keep trying...

![Screenshot](images/14.png)

The "forbidden path" is suspicious... Google says it could be lshell. Let us check!

![Screenshot](images/15.png)

The .conf file exists... let us say it is proven that they are using it

#### Lshell exploit

We get a reverse shell:

![Screenshot](images/16.png)

### Escaping lshell

Explanation from Stackoverflow:

![Screenshot](images/18.png)

Escape:

![Screenshot](images/17.png)

Get Mysql credentials:

![Screenshot](images/19.png)

#### Mysql Exploit. RoOt!

Add the UID flag in bash binary as root user (from MySQL) and run it as John. You are root: 

![Screenshot](images/20.png)

