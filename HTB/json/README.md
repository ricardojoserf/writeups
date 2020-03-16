# HTB - Json

First I found some SMB shares:

![Screenshot](images/Screenshot_1.jpg)


There is a website...

![Screenshot](images/Screenshot_2.jpg)


... with some users

![Screenshot](images/Screenshot_3.jpg)


Some requests send a base64-encoded value inside the *OAuth2* cookie:

![Screenshot](images/Screenshot_4.jpg)


We can decode it:

![Screenshot](images/Screenshot_5.jpg)


It seems the password field contains the password hashed with MD5:

![Screenshot](images/Screenshot_6.jpg)


Let us try to change the value of the parameter *Name*, which is reflected in the website:

![Screenshot](images/Screenshot_7.jpg)


Nice! We could have... an XSS? Meh, not good enough.

![Screenshot](images/Screenshot_8.jpg)


Let us keep trying... Some errors mean a lot:

![Screenshot](images/Screenshot_9.jpg)


That is a possible formatter in [Ysoserial](https://github.com/frohoff/ysoserial):

![Screenshot](images/Screenshot_10.jpg)

So let us create a payload with it. The command will ping (send ICMP packets) to our IP address: 

![Screenshot](images/Screenshot_16.jpg)


We will send it:

![Screenshot](images/Screenshot_17.jpg)


And check with Wireshark that we receive some packets:

![Screenshot](images/Screenshot_18.jpg)


Let us create a new and better payload, to download a file:

![Screenshot](images/Screenshot_19.jpg)


It succeeds:

![Screenshot](images/Screenshot_20.jpg)


Then one payload to execute it:


![Screenshot](images/Screenshot_22.jpg)


And we get a Meterpreter session:

![Screenshot](images/Screenshot_23.jpg)


We read the user flag:

![Screenshot](images/Screenshot_24.jpg)


It seems we can not impersonate any user:

![Screenshot](images/Screenshot_25.jpg)


So let us spawn a shell:

![Screenshot](images/Screenshot_26.jpg)


Let us invoke a lovely potato with [this repository](https://github.com/TsukiCTF/Lovely-Potato):

![Screenshot](images/Screenshot_27.jpg)


We need a Powershell shell, so we create one and invoke the Powershell script:

![Screenshot](images/Screenshot_28.jpg)


It seems to download many files:

![Screenshot](images/Screenshot_29.jpg)

Nice! We escalated

![Screenshot](images/Screenshot_30.jpg)

[potato root dance](https://media.giphy.com/media/bPShx901m0HHG/giphy.gif)