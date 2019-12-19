# HTB - Wall

Vulnerabilities:

- Centreon v19.04 Remote Code Execution (CVE-2019-13024) - https://shells.systems/centreon-v19-04-remote-code-execution-cve-2019-13024/

- GNU Screen 4.5.0 - Local Privilege Escalation - https://www.exploit-db.com/exploits/41154


After checking the nmap scan did not show any specially interesting port open, the website was fuzzed:

![Screenshot](images/Screenshot_5.jpg)

After the directory scan using ffuf, the only interesting path was "/monitoring". The request must be intercepted using a proxy such as Burp:

![Screenshot](images/Screenshot_1.jpg)


Changing the HTTP method from GET to POST, the website redirects to "/centreon":

![Screenshot](images/Screenshot_2.jpg)


First the default credentials were found:

![Screenshot](images/Screenshot_4.jpg)


These were tested, but unsuccessfully. Checking Github, I found a tool by @ankitsaini2609 to bruteforce the credentials:

![Screenshot](images/Screenshot_6.jpg)


I tested the Rockyou.txt dictionary...

![Screenshot](images/Screenshot_7.jpg)


... and found the pass word was "pasword1" (easy password):

![Screenshot](images/Screenshot_8.jpg)


This allowed to access the Centreon website and it was tested to exploit the [CVE-2019-13024 vulnerability](https://shells.systems/centreon-v19-04-remote-code-execution-cve-2019-13024/):

![Screenshot](images/Screenshot_9.jpg)


After some tests, it seemed possible to execute code:

![Screenshot](images/Screenshot_13.jpg)


![Screenshot](images/Screenshot_19.jpg)

![Screenshot](images/Screenshot_20.jpg)


And it was even possible to download files:

![Screenshot](images/Screenshot_14.jpg)


Finally, the payload was this one:

![Screenshot](images/Screenshot_15.jpg)


The elf file is created with Msfvenom...

![Screenshot](images/Screenshot_23.jpg)


.. and opens a Meterpreter session as "www-data" user:

![Screenshot](images/Screenshot_16.jpg)


The privilege escalation is related to Screen being run as "root" user:

https://www.exploit-db.com/exploits/41154

In this case, instead of compiling and running the exploit, I minimized the terminal screen as much as possible, and then it was possible to write and execute "#!/bin/bash" (or similar), getting a session as root user directly:

![Screenshot](images/Screenshot_22.jpg)

