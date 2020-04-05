# HTB - Sniper


First we can the ports in the machine:

![Screenshot](images/Screenshot_1.jpg)


And check the versions. Nothins specially interesting:

![Screenshot](images/Screenshot_2.jpg)


This is the website, which allows to change the language:

![Screenshot](images/Screenshot_3.jpg)


This is the code for changing the language:

![Screenshot](images/Screenshot_4.jpg)


That code could include the code from those PHP files, so we will try to execute a reverse shell located in a SMB share in our machine.

First, we create a SMB share in the Kali machine:

![Screenshot](images/Screenshot_8.jpg)

Second, the PHP paylaod is created with msfvenom:

![Screenshot](images/Screenshot_5.jpg)


Then, we try to execute the file due to a RFI vulnerability:

![Screenshot](images/Screenshot_6.jpg)


And it gets executed correctly! We get a reverse shell as IUSR:

![Screenshot](images/Screenshot_7.jpg)


We can list the files:

![Screenshot](images/Screenshot_9.jpg)


One of them contains the credentials of the database:

![Screenshot](images/Screenshot_10.jpg)


And we can list all the users in the machine:

![Screenshot](images/Screenshot_11.jpg)


It is possible to read a Powershell script with the credentials of one of these users, Chris:

![Screenshot](images/Screenshot_12.jpg)


Listing the programs, we can see the Mysql service is indeed running:

![Screenshot](images/Screenshot_13.jpg)


We can forward internal services thanks to Meterpreter:

![Screenshot](images/Screenshot_14.jpg)


With the user credentials and the Winrm service, we can connect and get the user flag:

![Screenshot](images/Screenshot_15.jpg)


In this user's Docs folder, there is a note:

![Screenshot](images/Screenshot_16.jpg)

We will exfiltrate the PDF file with Netcat like this:

![Screenshot](images/Screenshot_17.jpg)

![Screenshot](images/Screenshot_18.jpg)

Also there is a "intructions.chm" file, which we also exfiltrate:

![Screenshot](images/Screenshot_19.jpg)

Opening it, there is a message stating that "Oddvar deeserves a CVE":

![Screenshot](images/Screenshot_20.jpg)

Then I found another ".chm" file and exfiltrated it again:

![Screenshot](images/Screenshot_28.jpg)

F@$&%! This was the real one, someone had changed the original already:

![Screenshot](images/Screenshot_29.jpg)

However, I had already found something about Oddvar and CVEs in Google:

![Screenshot](images/Screenshot_21.jpg)

This blog has a link to a very interesting script:

![Screenshot](images/Screenshot_22.jpg)

![Screenshot](images/Screenshot_23.jpg)

I downloaded the *HTML Help Workshop and Documentation* to generate these files:

![Screenshot](images/Screenshot_24.jpg)

Than, I changed one of the variables...

![Screenshot](images/Screenshot_25.jpg)

... and created a malicious ".chm" file...

![Screenshot](images/Screenshot_26.jpg)

... which gets generated correctly!!!

![Screenshot](images/Screenshot_27.jpg)


We create another malicious ".chm", this one will send the file "root.txt" in the Administrator's Desktop folder using Netcat:

![Screenshot](images/Screenshot_30.jpg)

We download it to the machine:

![Screenshot](images/Screenshot_31.jpg)

And execute it, getting the file:

![Screenshot](images/Screenshot_32.jpg)

<!-- ![Screenshot](images/Screenshot_33.jpg) -->

Another nice box! We got a shell thanks to a RFI, used tunnels to connect to internal services and got the final shell using a client-side attack (like a ninja!):

![Screenshot](https://media.giphy.com/media/gsjftE0QZbMWY/giphy.gif)
