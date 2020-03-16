# HTB - Postman

The nmap scans show there is a possible vulnerable service:

![Screenshot](images/Screenshot_1.png)

It is possible to connect to the Redis service...

![Screenshot](images/Screenshot_3.png)


... which is running in port 6379:

![Screenshot](images/Screenshot_4.png)


We can execute some commands:

![Screenshot](images/Screenshot_5.png)


After trying to exploit it manually, I ended using an existing script:

![Screenshot](images/Screenshot_9.png)


It is necessary to change the parameter *cmd4* because the SSH folder in this case is not located in the default path ("/home/any_user/.ssh")

![Screenshot](images/Screenshot_10.png)


After executing it, we get a reverse shell:

![Screenshot](images/Screenshot_11.png)


There is a suspicious backup file:

![Screenshot](images/Screenshot_12.png)


It is an encrypted SSH private key file...

![Screenshot](images/Screenshot_13.png)


... which can be decrypted with SSH2john...

![Screenshot](images/Screenshot_14.png)


... getting its password:

![Screenshot](images/Screenshot_15.png)


With it, we become the user "Matt". We find out that its password is the same that the one of the private key

![Screenshot](images/Screenshot_16.png)


As there is a Metasploit module, it was easy to become root:

![Screenshot](images/Screenshot_17.png)


