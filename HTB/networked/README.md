# HTB - Networked


Fist, locate the Kali PHP shell and copy it to a file with extension ".php.gif":

![Screenshot](images/Screenshot_1.png)

Add the GIF header (GIF89):

![Screenshot](images/Screenshot_2.png)

Upload it and find its path: 

![Screenshot](images/Screenshot_3.png)

When the path is visited, the reverse shell opens:

![Screenshot](images/Screenshot_4.png)

In gully's home folder we can see a crontab file:

![Screenshot](images/Screenshot_5.png)

The crontab file seems to remove the folders in /var/www/html/uploads:

![Screenshot](images/Screenshot_6.png)

It is possible to create a folder whose name allows to inject in the crontab execution:

![Screenshot](images/Screenshot_7.png)

This is the crontab vulnerable file:

![Screenshot](images/Screenshot_8.png)

The shell opens as user *gully*:

![Screenshot](images/Screenshot_9.png)

We spawn an interactive shell and check one command can be executed as sudo without password:

![Screenshot](images/Screenshot_10.png)

This is the code of the bash file:

![Screenshot](images/Screenshot_11.png)

It is possible to inject code and open a shell as the user *root*:

![Screenshot](images/Screenshot_12.png)
