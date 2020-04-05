# HTB - Registry

### Enumeration

First, we check the web certificate given that we could not see it properly:

![Screenshot](images/Screenshot_7.jpg)


Then we add the hostname to the *hosts* file:

![Screenshot](images/Screenshot_8.jpg)

Using Nikto we find some default credentials and that the web is a Focker Registry server:

![Screenshot](images/Screenshot_9.jpg)

We connect using those credentials and find one repository:

![Screenshot](images/Screenshot_10.jpg)

Then we will visit the Docker docs to know what else we can do:

![Screenshot](images/Screenshot_14.jpg)

We check there is only one tag:

![Screenshot](images/Screenshot_11.jpg)

### Reading about the manifest

Knowing this, we can download the manifest accessing "/v2/bolt-image/manifests/latest":

![Screenshot](images/Screenshot_12.jpg)

And we can read it:

![Screenshot](images/Screenshot_13.jpg)

Then, read about that a manifest in Docker registry is exactly...

![Screenshot](images/Screenshot_15.jpg)

... and how they are signed:

![Screenshot](images/Screenshot_16.jpg)

We find these values in the Manifest we downloaded:

![Screenshot](images/Screenshot_17.jpg)

### Connection to the insecure registry

Then, we read about pulling from another registry:

![Screenshot](images/Screenshot_18.jpg)

And we connect to the Docker registry, knowing it is insecure:

![Screenshot](images/Screenshot_19.jpg)

![Screenshot](images/Screenshot_20.jpg)


Then we pull the contents of the repository:

![Screenshot](images/Screenshot_21.jpg)


When we have downloaded it, we can access the filesystem of the Docker image with *docker run -i -i DOCKER_IMAGE_ID /bin/bash*:

![Screenshot](images/Screenshot_24.jpg)

There is a bash script with rsync:

![Screenshot](images/Screenshot_25.jpg)

And also a public and a private key:

![Screenshot](images/Screenshot_28.jpg)


![Screenshot](images/Screenshot_29.jpg)


We will use John the Ripper's ssh2john to crack the password of this private key:

![Screenshot](images/Screenshot_30.jpg)


Checking the Docker image again, it seems there is another bash script with credentials in it:

![Screenshot](images/Screenshot_33.jpg)

This could be found in the .viminfo file, showing it was one of the last files changed using Vim:

![Screenshot](images/Screenshot_32.jpg)

## Connection as bolt

We can connect to the machine with the private key and the root password found in the last bash script:

![Screenshot](images/Screenshot_34.jpg)

In the machine there is a bolt.db file wich contains a list of users of the website:

![Screenshot](images/Screenshot_35.jpg)


Then we crack the password...

![Screenshot](images/Screenshot_36.jpg)

... and access the website:

![Screenshot](images/Screenshot_37.jpg)


## Exploiting Bolt CMS RCE [CVE-2019-9185]

There is a public exploit for Bolt 3.6.4:

![Screenshot](images/Screenshot_39.jpg)

It consists of:

1. Changing the accepted file types to allow the PHP files:

![Screenshot](images/Screenshot_38.jpg)

2. Creating a malicious PHP file:

![Screenshot](images/Screenshot_41.jpg)

3. Upload it:

![Screenshot](images/Screenshot_41.jpg)

4. Get a reverse shell:

![Screenshot](images/Screenshot_42.jpg)


## Connection as www-data

Then we spawn a full shell and check what this user can run as superuser:

![Screenshot](images/Screenshot_43.jpg)

## Privilege escalation

First, I tried to create a "rest_test" folder to create a backup in the /tmp folder, but it does not work if you do not have superuser privileges:

![Screenshot](images/Screenshot_45.jpg)

![Screenshot](images/Screenshot_46.jpg)

![Screenshot](images/Screenshot_49.jpg)

So I did it remotely, first initializing a repository:

![Screenshot](images/Screenshot_47.jpg)

Then creating a Restic server:

![Screenshot](images/Screenshot_48.jpg)


And then using a SSH remote tunnel to take the local 8000 port to the port 9999 of the remote machine:

![Screenshot](images/Screenshot_50.jpg)


Note: Syntax of SSH remote tunnels:

![Screenshot](images/Screenshot_51.jpg)


Then, the backup is generated:

![Screenshot](images/Screenshot_52.jpg)


The repository is restored to the latest version (this was the step which could not be done locally in the remote machine, but now we are root) and we get the root folder contents!


![Screenshot](images/Screenshot_53.jpg)


And rooted! It was a nice box, learning about Docker registries, connecting to Docker images, exploiting a CMS CVE and escalating privileges generating a backup.

![no backup plz!](https://media2.giphy.com/media/1UYuJpTPXdP98Y8QPQ/giphy.gif)