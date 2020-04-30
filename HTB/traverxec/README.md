# Traverxec

The nmap scan shows the open ports are 22 and 80:

![Screenshot](images/Screenshot_1.jpg)


The website has a folder named "~david":

![Screenshot](images/Screenshot_2.jpg)

Checking the web server technology, it is a Nostromo server which is vulnerable to a RCE attack until version 1.9.6. The vulnerability is identified as CVE-2019-16278 and there is a public exploit:

![Screenshot](images/Screenshot_4.jpg)


Running the Python script we can see it is running as the user "www-data":

![Screenshot](images/Screenshot_3.jpg)


We will create a malicious binary, upload it, make it executable and execute it. First, we will upload it:

![Screenshot](images/Screenshot_5.jpg)


Next, we make it executable and execute it:

![Screenshot](images/Screenshot_6.jpg)


And then we get a Meterpreter session:

![Screenshot](images/Screenshot_7.jpg)

<!-- ![Screenshot](images/Screenshot_8.jpg) -->
<!-- ![Screenshot](images/Screenshot_11.jpg) -->

There is a compressed file with the backup of "david" home folder:

![Screenshot](images/Screenshot_10.jpg)

There is an encrypted SSH key:

![Screenshot](images/Screenshot_9.jpg)

Whose password we can crack:

![Screenshot](images/Screenshot_12.jpg)

And then we can connect using SSH locally:

![Screenshot](images/Screenshot_13.jpg)

We can also connect remotely, which is more stable:

![Screenshot](images/Screenshot_14.jpg)

In the "/bin" folder there is a bash script which runs a command as root:

![Screenshot](images/Screenshot_15.jpg)

It is possible to run this as user "david":

![Screenshot](images/Screenshot_16.jpg)


Making the terminal smaller, we can spawn a new shell:

![Screenshot](images/Screenshot_17.jpg)

This is running as the "root" user, making it possible to read the flag:

![Screenshot](images/Screenshot_18.jpg)


![i want cheesy poofs](https://media.giphy.com/media/3o6ZsZbUukGiYMf2a4/giphy.gif)