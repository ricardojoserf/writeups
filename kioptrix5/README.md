# Kioptrix: 2014 (#5)
Vulnhub page: https://www.vulnhub.com/entry/kioptrix-2014-5,62/
#### Information gatering

Nmap scan:

![Screenshot](images/1.png)

Nikto scan shows mod_ssl vulnerability:

![Screenshot](images/2.png)

#### Locate vulnerability

Use searchsploit to locate the vulnerability:

![Screenshot](images/3.png)

#### Compilation

Compile the OpenFuck exploit:

![Screenshot](images/4.png)


It seems unsuccessful:

![Screenshot](images/8.png)



#### Website in port 8080

It is not accesible:

![Screenshot](images/6.png)


#### Website in port 80

It is a default page:

![Screenshot](images/5.png)


But with curl:

![Screenshot](images/9.png)


There is a vulnerability related to pchart:

![Screenshot](images/10.png)


#### Directory traversal - Recon phase


![Screenshot](images/13.png)


![Screenshot](images/14.png)


![Screenshot](images/15.png)


![Screenshot](images/16.png)


![Screenshot](images/17.png)


#### Locate the correct User Agent

Read http.conf:

![Screenshot](images/18.png)

Access using curl again:

![Screenshot](images/19.png)


#### Locate a second phptax exploit:

This allows remote code execution:

![Screenshot](images/20.png)

Read the exploit:

![Screenshot](images/21.png)

There is also a Metasploit module:

![Screenshot](images/22.png)

#### Metasploit module

Set the parameters and run it:

![Screenshot](images/23.png)

#### Locate if there is a Kernel or OS exploit

![Screenshot](images/24.png)

#### Upload and compile the exploit


![Screenshot](images/25.png)


Check it is downloaded from our host:

![Screenshot](images/26.png)

#### Get root!


![Screenshot](images/27.png)

There are more possibilities:

![Screenshot](images/28.png)

