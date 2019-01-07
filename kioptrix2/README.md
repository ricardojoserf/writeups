# Kioptrix: Level 1.1
Vulnhub page: https://www.vulnhub.com/entry/kioptrix-level-11-2,23/
#### Information gathering

Nmap scan:

![Screenshot](images/1.png)

#### SQL injection

Website in port 80 shows a login page. It can be bypassed with a quite basic sql injection:

![Screenshot](images/2.png)

#### Code execution

Ping pages in these machines usually have this problem. In this case it is possible to create a reverse shell: locate what is the Netcat binary ("which nc") and run simething similar to:

![Screenshot](images/3.png)

#### Reverse shell

Open a listener. Start the recon phase: the Linux Kernel seems vulnerable:

![Screenshot](images/4.png)

#### Locate a exploit

Find a exploit. This seems promising: https://www.exploit-db.com/exploits/9542

![Screenshot](images/6.png)

#### Upload it

Create a Python server and upload it:

![Screenshot](images/5.png)

#### Compile, run, root!

![Screenshot](images/7.png)

