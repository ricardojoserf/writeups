# PwnLab: init
Vulnhub page: https://www.vulnhub.com/entry/pwnlab-init,158/
#### Information gathering

Nmap scan:

![Screenshot](images/1.png)

Nikto scan:

![Screenshot](images/2.png)

NSE scripts (nmap using --script auth,vuln):

![Screenshot](images/3.png)

Directory listing:

![Screenshot](images/4.png)

#### LFI

Check all the types of LFI from https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/File%20inclusion. One works!

![Screenshot](images/5.png)

This is it:

![Screenshot](images/6.png)

Decode the base64-encoded text:

![Screenshot](images/7.png)

Test if there is a config file:

![Screenshot](images/8.png)

Decode it again. In this case, an online tool such as https://www.base64decode.org/ works perfectly:

![Screenshot](images/9.png)

#### MySQL 

Connect using the credentials obtained:

![Screenshot](images/10.png)

Find a table with credentials:

![Screenshot](images/11.png)

Decode the passwords:

![Screenshot](images/12.png)


#### Upload vulnerability

Check the code in the upload page:

![Screenshot](images/15.png)

Create a GIF file. It will have:

- The GIF header

- PHP code to execute commands


![Screenshot](images/16.png)

Upload it:

![Screenshot](images/17.png)

Check it is uploaded:

![Screenshot](images/18.png)

Access to it:

![Screenshot](images/19.png)

Use Burp Suite. Set the "cmd" and "lang" values to test it is working:

![Screenshot](images/20.png)

Check the result:

![Screenshot](images/21.png)

We will try to create a reverse shell with something similar to this:

![Screenshot](images/22.png)

Test it:

![Screenshot](images/23.png)

The reverse shell is created! Check the Kernel version (recon phase):

![Screenshot](images/24.png)

#### Message to Mike! Message to Mike! Message to Mike! 

Locate a suitable exploit:

![Screenshot](images/25.png)

... but it will not work *cries in spanish*

But wait! There is a weird binary named "msgmike" in kane's home directory. It tries to open "msg.txt" using *cat msg.txt*. But what if we change the "cat" binary file? We could create a reverse shell (too much sufferance aint it? ;)) or, in this case, open a shell. 

We change the PATH variable value: it will search the binaries first in this folder, and then in the typical ones. So, a "fake cat" is created, we give it the execution permissions (777 is probably too much...) and we run the "weird" binary:

![Screenshot](images/26.png)

Hey! We are Mike!

#### Message to root!  

Mike's home folder has a new... weird binary. Let us check that it does:

![Screenshot](images/27.png)

Weell it executes any command as root, so let us just open a new shell... and we are root!

![Screenshot](images/28.png)

*Exit* x4

![Screenshot](images/29.png)

