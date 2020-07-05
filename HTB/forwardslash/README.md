#Forwardslash

Using tools suchs as wfuzz we can find a text file in the website:

![Screenshot](images/Screenshot_1.jpg)

Then, we must change the /etc/hosts because the "backup site" is in a subdomain of the man domain:

![Screenshot](images/Screenshot_2.jpg)

This allows us to reach a login page where we can register a user:

![Screenshot](images/Screenshot_3.jpg)

Doing so, we reach a dashboard:

![Screenshot](images/Screenshot_4.jpg)

Then we will list the directories/files in this backup site:

![Screenshot](images/Screenshot_6.jpg)

![Screenshot](images/Screenshot_7.jpg)

And we can find a very important message!

![Screenshot](images/Screenshot_5.jpg)

There is a disabled functionality and we can see the code:

![Screenshot](images/Screenshot_8.jpg)

![Screenshot](images/Screenshot_9.jpg)

There is a vulnaerability; this hidden/disabled functionality allows to include (and display) local files (LFI vulnerability):

![Screenshot](images/Screenshot_10.jpg)

Then, we can read the configuration file and get the www-data password, which is '5iIwJX0C2nZiIhkLYE7n314VcKNx8uMkxfLvCTz2USGY180ocz3FQuVtdCy3dAgIMK3Y8XFZv9fBi6OwG6OYxoAVnhaQkm7r2ec':

![Screenshot](images/Screenshot_11.jpg)

Ffuff (the tools used for listing directories/files in this case) does not find anything else other than index.php in the */dev* folder:

![Screenshot](images/Screenshot_12.jpg)

Then, we try to read the index.php of the dev folder (with *url=file://///var/www/backup.forwardslash.htb/dev/index.php*):

![Screenshot](images/Screenshot_13.jpg)

I read the PayloadAllTheThings LFI section (https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/File%20Inclusion#basic-lfi):

![Screenshot](images/Screenshot_14.jpg)

... and the first payload (which uses rot13) works:

![Screenshot](images/Screenshot_15.jpg)

We can decode this online (in https://rot13.com/ for example):

![Screenshot](images/Screenshot_16.jpg)

And we find out what the hackers were referring about automatic FTP upload:

![Screenshot](images/Screenshot_17.jpg)

We try to use these credentials in the SSH service and get access as user "chiv":

![Screenshot](images/Screenshot_18.jpg)

The www-data credentials we found earlier do not seem to work:

![Screenshot](images/Screenshot_19.jpg)

It seems we need to escalate to "pain" to get the user.txt flag:

![Screenshot](images/Screenshot_20.jpg)

We find some files:

![Screenshot](images/Screenshot_21.jpg)

We inspect the Pain folder and we see we can read some files:

![Screenshot](images/Screenshot_22.jpg)

It seems Pain created a custom binary 

![Screenshot](images/Screenshot_23.jpg)

Let us try to find which file is backed up

![Screenshot](images/Screenshot_24.jpg)

We can not find any process running related to this binary. However, it seems the "ERROR" message returns the MD5 value of the timestamp:

![Screenshot](images/Screenshot_25.jpg)

We can create a file with that same timestamp in "/tmp" folder. It complains about the file not existing the first time, then we create it and it does not complain:

![Screenshot](images/Screenshot_26.jpg)

I tried to create a symbolic link but it does not work to read the user flag: 

![Screenshot](images/Screenshot_27.jpg)

It seemed the problem was the folder! If you do the same in the chiv's home folder, you can read it:

![Screenshot](images/Screenshot_28.jpg)

Then, we can read more files, like this one in "/var/backups":

![Screenshot](images/Screenshot_29.jpg)

And we get Pains's password:

![Screenshot](images/Screenshot_30.jpg)

Now we can access through SSH with *pain:db1f73a72678e857d91e71d2963a1afa9efbabb32164cc1d94dbc704*:

![Screenshot](images/Screenshot_31.jpg)

We will copy the files in encryptorinator to our local machine:

![Screenshot](images/Screenshot_32.jpg)

If we decrypt it, we get the password "cB!6%sdH8Lj^@Y\*$C2cf".

With that we can mount images in "/var/backups/recovery/" with a command such as "sudo /sbin/cryptsetup luksOpen /var/backups/recovery/encrypted_backup.img backup" (check "sudo -l", pain can do it!) and then mount it. And in that image, you can find the root's private key!. 

Sory I did not take screenshots of this part :P

![a](https://media3.giphy.com/media/O6Hw3wYDqzUis/giphy.gif?cid=ecf05e4750eebd0f17ee066d551b0dcef7e761e94e80ba8d&rid=giphy.gif)