# Servmon

First, we find the website has a LFI vulnerability which allows us to read any file:

![Screenshot](images/Screenshot_1.jpg)

Also, the FTP server allows anonymous authentication:

![Screenshot](images/Screenshot_2.jpg)

In Nadine's folder we find intesting files:

![Screenshot](images/Screenshot_3.jpg)

This is the content:

![Screenshot](images/Screenshot_4.jpg)

As we know this, we can see what there is inside that file:

![Screenshot](images/Screenshot_5.jpg)

So we have these passwords:
- 1nsp3ctTh3Way2Mars!
- Th3r34r3To0M4nyTrait0r5!
- B3WithM30r4ga1n5tMe
- L1k3B1gBut7s@W0rk
- 0nly7h3y0unGWi11F0l10w
- IfH3s4b0Utg0t0H1sH0me
- Gr4etN3w5w17hMySk1Pa5$

And we get access through SSH with “Nadine:L1k3B1gBut7s@W0rk”:

![Screenshot](images/Screenshot_6.jpg)

Then, we see there is a privilege escalation related to the technology used by the website (https://www.exploit-db.com/exploits/46802):

![Screenshot](images/Screenshot_7.jpg)

We can retrieve the password of the Nsclient program:

![Screenshot](images/Screenshot_8.jpg)

We find there is a command which is set to be executed, named zebi.bat:

![Screenshot](images/Screenshot_9.jpg)

So in this case I uploaded my .bat file and overwrote the previous contents:

![Screenshot](images/Screenshot_10.jpg)

With this, I got the reverse shell:

![Screenshot](images/Screenshot_11.jpg)
