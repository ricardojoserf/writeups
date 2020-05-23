# Obscurity

There is a web server in port 8080. We will fuzz itt using Ffuf (be careful if using this tool in production, it may break things!). A folder "/developer" is found::

![Screenshot](images/Screenshot_1.jpg)



The super secure script is found in this folder:

![Screenshot](images/Screenshot_2.jpg)


This is the code I used to extract the key:

![Screenshot](images/Screenshot_4.jpg)


The final key is "alexandrovic":

![Screenshot](images/Screenshot_5.jpg)


And the passwordreminder.txt file can be decrypted now!

![Screenshot](images/Screenshot_6.jpg)

Now we can sudo as "robert":

![Screenshot](images/Screenshot_7.jpg)


Then we read the user flag:

![Screenshot](images/Screenshot_8.jpg)

Using "sudo -l" we can see what "robert" can execute with root privileges:

![Screenshot](images/Screenshot_9.jpg)

We can connect with the custom SSH service:

![Screenshot](images/Screenshot_10.jpg)

The user hash will appear in this folder, so we will create a loop to try to get it:

![Screenshot](images/Screenshot_11.jpg)


We get some hashes:

![Screenshot](images/Screenshot_12.jpg)


The hash can be cracked and we get the root user password:

![Screenshot](images/Screenshot_14.jpg)


And finally we get a shell as root:

![Screenshot](images/Screenshot_15.jpg)

Nice, we did it! ![Gif](https://media.giphy.com/media/XwGVf8gQqt5rG/giphy.gif)