# HTB - Craft

First, it is necessary to run a nmap scan:

![Screenshot](images/Screenshot_1.jpg)


Then, fuzz the directories of the website in port 443:

![Screenshot](images/Screenshot_2.jpg)


As there is a Git repository, it is downloaded:

![Screenshot](images/Screenshot_3.jpg)


Then it is possible to check the previous commits with *git log*. To get a shorter version of the commits IDs, you can use *--oneline*:

```
git log --oneline
```

![Screenshot](images/Screenshot_4.jpg)


It is possible to use a bash script, but in this case there are not many commits so we will check the difference in the code of every two commits with:

```
git diff commit1 commit2
```

![Screenshot](images/Screenshot_5.jpg)


It is possible to log in with those credentials:

![Screenshot](images/Screenshot_6.jpg)


Let us continue checking the commits. The script *test.py* could be interesting:

![Screenshot](images/Screenshot_7.jpg)


It is possible to execute it:

![Screenshot](images/Screenshot_8.jpg)


And we can add one line to print the generated token...

![Screenshot](images/Screenshot_9.jpg)


... which can be decoded in jwt.io

![Screenshot](images/Screenshot_10.jpg)


Ok, we can use this token to create requests... For example POST requests to /api/brew, whose paramter *abv* is vulnerable!

![Screenshot](images/Screenshot_11.jpg)


We can try to create a reverse shell using this vulnerable parameter, so let us update the *test.py* code:

![Screenshot](images/Screenshot_12.jpg)


Hmm, it seems good...

![Screenshot](images/Screenshot_13.jpg)


... nice, we got a reverse shell!

![Screenshot](images/Screenshot_14.jpg)


Now we can read the settings values, including the DB credentials:

![Screenshot](images/Screenshot_15.jpg)


User "Gilfoyle" can download another repository:

![Screenshot](images/Screenshot_16.jpg)


Inside that repository, there was a SSH key which allows us to access as user "gilfoyle"

![Screenshot](images/Screenshot_17.jpg)


Finally, a vulnerability in Vault service allows us to escalate privileges and become "root":

![Screenshot](images/Screenshot_18.jpg)

![Alt Text](https://media1.tenor.com/images/81fdf473cb31bd48eec97027a8e4b834/tenor.gif)