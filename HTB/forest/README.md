# HTB - Forest

First, we run a nmap scan:

![Screenshot](images/Screenshot_1.png)


Using enum4linux it is possible to enumerate users:

![Screenshot](images/Screenshot_2.png)



Then we carry out a [AS-REP Roasting attack](https://blog.stealthbits.com/cracking-active-directory-passwords-with-as-rep-roasting/), in this case using the Impacket's [GetNPUsers script](https://github.com/SecureAuthCorp/impacket/blob/master/examples/GetNPUsers.py):

![Screenshot](images/Screenshot_3.png)


TL;DR about the attack (sorry, I don't remember the source):

![Screenshot](images/Screenshot_4.png)


The hash can be cracked using Rockyou dictionary:

![Screenshot](images/Screenshot_5.png)


And it is possible to connect with these credentials in the Winrm service:

![Screenshot](images/Screenshot_6.png)


And grab the flag:

![Screenshot](images/Screenshot_7.png)


Then, we run the [Python Bloodhound ingestor](https://github.com/fox-it/BloodHound.py):

![Screenshot](images/Screenshot_8.png)


Part 1 - The user *svc-alfresco* is member of *Account operators*:

![Screenshot](images/Screenshot_11.png)


Part 2 - The members of this group have *GenericAll* privileges over the group *Exchange Windows Permissions*:

![Screenshot](images/Screenshot_14.png)


Part 3 - And the members of *Exchange Windows Permissions* have *WriteDacl* over the domain object:

![Screenshot](images/Screenshot_19.png)


To jump to the *Exchange Windows Permissions* group (parts 1 and 2) we must take advantage of the *GenericAll* privileges. From the Bloodhound output:

![Screenshot](images/Screenshot_13.png)


We can get the groups of this domain:

![Screenshot](images/Screenshot_12.png)

And we can use the *net* command to add the user *svc-alfresco* to the new group:

![Screenshot](images/Screenshot_15.png)


Next, to take advantage of the *WriteDacl* privileges, we check the Bloodhound output:

![Screenshot](images/Screenshot_9.png)

![Screenshot](images/Screenshot_10.png)


At this point I realized something: I had a lot of things to do (or I am very lazy) and what I was trying did not work. But I knew that this user would become a domain admin at some point in the future, getting the DCsync privilege. 

So I created a loop with the Impacket's secretdump script, and I waited...

![Screenshot](images/Screenshot_20.png)

... and it worked :S 

![Screenshot](images/Screenshot_21.png)


With the Administrator user hash we can connect with Impacket's Psexec and get the flag:

![Screenshot](images/Screenshot_22.png)

And rooted!

![Gizmo root dance](https://66.media.tumblr.com/ca16586140710cf138959f4664b344a3/tumblr_msuoiwf1Oy1qfr6udo1_500.gifv)

It was a nice box, a really good chance to use Bloodhound, one of the greatest tools today!