# HackLAB: Vulnix
Vulnhub: https://www.vulnhub.com/entry/hacklab-vulnix,48/
#### Information gathering

Nmap scan. OS detection:

![Screenshot](images/1.png)

Using the NSE scripts:

![Screenshot](images/2.png)

Enumerating SMTP users:

![Screenshot](images/3.png)

![Screenshot](images/4.png)

Checking some SMTP users (ricardo does not exist, lp exists):

![Screenshot](images/5.png)

#### NTFS share 

Detect it:

![Screenshot](images/6.png)

Check permissions (why can not i access!!!):

![Screenshot](images/7.png)

A futile, futile test:

![Screenshot](images/8.png)

A second futile, futile test:

![Screenshot](images/9.png)

Nope, not working... This is not the way, indeed!

![Screenshot](images/12.png)

![Screenshot](images/13.png)

#### NFSpy

Test if it can be mounted using NFSpy:

![Screenshot](images/14.png)

Now, do it without using the "ro" (read-only) option... xD

![Screenshot](images/16.png)

Create a .ssh folder and add your SSH key:

![Screenshot](images/17.png)

#### SSH connection

Now you can connect the system using your SSH key:

![Screenshot](images/18.png)


Check what you can execute as superuser:

![Screenshot](images/21.png)

Execute it! Change the "root_squash" to "no_root_squash"

![Screenshot](images/26.png)

![Screenshot](images/27.png)

#### Privilege escalation

With "no_root_squash" we can mount the share and change permissions as the root user. Let us create a "bash" binary with the UID flag! But first let us test it with a file named "a":

![Screenshot](images/33.png)

In the server it seems to be owned by root. Let us try to the same with bash now. Copy the binary:

![Screenshot](images/35.png)

Change owner and permissions:

![Screenshot](images/36.png)

### Get root

![Screenshot](images/36.png)

