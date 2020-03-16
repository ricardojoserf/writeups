# HTB - Bitlab

Checking the Gitlab server, there are different projects:

![Screenshot](images/Screenshot_1.jpg)


There are different commits in them:

![Screenshot](images/Screenshot_3.jpg)


It is possible to update the PHP code of the index.php of your Profile. So, when you access that page, this code (a PHP reverse shell) will get executed:

![Screenshot](images/Screenshot_4.jpg)


It is necessary to merger the branch:

![Screenshot](images/Screenshot_5.jpg)


![Screenshot](images/Screenshot_6.jpg)


When it gets finally merged...

![Screenshot](images/Screenshot_7.jpg)


... you can see the file has been updated recently:

![Screenshot](images/Screenshot_8.jpg)


Accessing the PHP file...

![Screenshot](images/Screenshot_9.jpg)


... you get a reverse shell:

![Screenshot](images/Screenshot_10.jpg)


Also in the Gitlab repository, you can see there are some credentials:

![Screenshot](images/Screenshot_11.jpg)


Copying this code to the server, we can get some new credentials:

![Screenshot](images/Screenshot_12.jpg)


It is a base64-encoded value!

![Screenshot](images/Screenshot_13.jpg)


We can get more information from the database:

![Screenshot](images/Screenshot_14.jpg)


But also, we can connect via SSH with the credentials we already got. The trick was that the password was the base64 value, it was not necessary to decode it:

![Screenshot](images/Screenshot_15.jpg)


There is a Windows executable file in the home folder, so we will copy this to our local machine:

![Screenshot](images/Screenshot_16.jpg)


Then it is time to reverse it. First, we will check the interesting module, the one named similarly to the executable file. 

![Screenshot](images/Screenshot_17.jpg)


Then, it is enough to look for the references of the strings:

![Screenshot](images/Screenshot_18.jpg)


There are some strings we can see when the executable file is run:

![Screenshot](images/Screenshot_19.jpg)


Let us check the code section where the string "Access Denied!!" is used:

![Screenshot](images/Screenshot_20.jpg)


There is a SSH password, so...

![Screenshot](images/Screenshot_21.jpg)


... we connect using it, and it is done

![Screenshot](images/Screenshot_22.jpg)

