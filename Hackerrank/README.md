### Find the Runner-Up Score!

https://www.hackerrank.com/challenges/find-second-maximum-number-in-a-list/problem

Given the participants' score sheet for your University Sports Day, you are required to find the runner-up score. You are given  scores. Store them in a list and find the score of the runner-up.

Input Format

The first line contains n. The second line contains an array A[] of n integers each separated by a space.

Constraints
- 2 <= n <= 10
- -100 <= A[i] <= 100 

Output Format

Print the runner-up score.


```
if __name__ == '__main__':
    n = int(raw_input())
    arr = map(int, raw_input().split())
    
    max_number = -101
    for i in range(0,n):
        #print(i)
        if arr[i] > max_number:
            max_number = arr[i]
    #print(max_number)
    
    runnerup = -101
    for i in range(0,n):
        if arr[i] > runnerup and arr[i] != max_number:
            runnerup = arr[i]
    print (runnerup)
```

--------------------------------------

### Nested Lists

https://www.hackerrank.com/challenges/nested-list/problem

Given the names and grades for each student in a class of  students, store them in a nested list and print the name(s) of any student(s) having the second lowest grade.
Note: If there are multiple students with the second lowest grade, order their names alphabetically and print each name on a new line.

Input Format

The first line contains an integer, N, the number of students.
The 2N subsequent lines describe each student over 2 lines.
- The first line contains a student's name.
- The second line contains their grade.

Constraints

There will always be one or more students having the second lowest grade.

Output Format

Print the name(s) of any student(s) having the second lowest grade in. If there are multiple students, order their names alphabetically and print each one on a new line.

Sample Input 0

```
5
Harry
37.21
Berry
37.21
Tina
37.2
Akriti
41
Harsh
39
```

Sample Output 0

```
Berry
Harry
```

```
if __name__ == '__main__':
    aux_list = []
    aux_scores = []
    for _ in range(int(raw_input())):
        name = raw_input()
        score = float(raw_input())
        aux_list.append([name, score])
        aux_scores.append(score)
    #print(aux_list)
    
    min_number = 100
    for i in range(0,len(aux_scores)):
        #print(i)
        if aux_scores[i] < min_number:
            min_number = aux_scores[i]
    #print(min_number)
    
    secondlowest = 100
    for i in range(0,len(aux_scores)):
        if aux_scores[i] < secondlowest and aux_scores[i] != min_number:
            secondlowest = aux_scores[i]
    #print (secondlowest)
    
    aux_names = []
    for i in aux_list:
        if i[1] == secondlowest:
            aux_names.append(i[0])
    
    for i in sorted(aux_names):
        print(i)
```

--------------------------------------

### Finding the percentage

https://www.hackerrank.com/challenges/finding-the-percentage/problem

The provided code stub will read in a dictionary containing key/value pairs of name:[marks] for a list of students. Print the average of the marks array for the student name provided, showing 2 places after the decimal.

Input Format

The first line contains the integer , the number of students' records. The next  lines contain the names and marks obtained by a student, each value separated by a space. The final line contains query_name, the name of a student to query.

Constraints
- 2 <= n <= 10
- 0 <= marks[i] <= 100
- length of marks array = 3

Output Format

Print one line: The average of the marks obtained by the particular student correct to 2 decimal places.

Sample Input 0

```
3
Krishna 67 68 69
Arjun 70 98 63
Malika 52 56 60
Malika
```

Sample Output 0

```
56.00
```

```
if __name__ == '__main__':
    n = int(raw_input())
    student_marks = {}
    for _ in range(n):
        line = raw_input().split()
        name, scores = line[0], line[1:]
        scores = map(float, scores)
        student_marks[name] = scores
    query_name = raw_input()
    number_marks = 0
    total_marks = 0
    for i in student_marks.get(query_name):
        number_marks += 1
        total_marks += i 
    print("%.2f" % float(total_marks/number_marks))
```



--------------------------

### List comprehensions

```
if __name__ == '__main__':
    x = int(input())
    y = int(input())
    z = int(input())
    n = int(input())
    
    list_1 = []
    list_2 = []
    list_3 = []
    
    for i in range(0,x+1):
        list_1.append(i)
    for i in range(0,y+1):
        list_2.append(i)
    for i in range(0,z+1):
        list_3.append(i)
    
    res = [[i, j, k] for i in list_1
        for j in list_2
        for k in list_3
        if (i+j+k != n)]
    print(res)  
```

----------------------------

### Python lists

```
if __name__ == '__main__':
    N = int(input())
    # print(N)
    list_ = []
    for i in range(0, N):
        option_ = input()
        splitted = option_.split(" ")
        action_ = splitted[0]
        #print(option_ + " " + action_)
        if action_ == "insert":
            pos_ = int(splitted[1])
            val_ = int(splitted[2])
            # print("Inserting " + str(val_) + " in position " + str(pos_))
            #print(list_)
            if (len(list_) < pos_):
                for i in range(len(list_), pos_):
                    list_.insert(i, 33)
            list_.insert(pos_, val_)
            # print(list_)
            #print(list_)
        elif action_ == "print":
            print(list_)
        elif action_ == "remove":
            val_ = int(splitted[1])
            if val_ in list_:
                list_.remove(val_)
            #print(list_)
        elif action_ == "append":
            val_ = int(splitted[1])
            list_.append(val_)
            #print(list_)
        elif action_ == "sort":
            list_.sort()
            #print(list_)
        elif action_ == "pop":
            list_.pop()
            #print(list_)
        elif action_ == "reverse":
            list_.reverse()
        else:
            print("?")
```

--------------------------

### Tuples

```
if __name__ == '__main__':
    n = int(input())
    integer_list = map(int, input().split())
    aux_list = list(integer_list)
    aux_tuple = ()
    
    for i in range(0, n):
        aux_tuple += (aux_list[i],)
        
    print(str(hash(aux_tuple)))
```


--------------------------

### sWAP cASE

```
def swap_case(s):
    aux_str = ""
    for char in s:   
        if char.islower():
            aux_str += char.upper()
        else:
            aux_str += char.lower()
    return aux_str

if __name__ == '__main__':
    s = input()
    result = swap_case(s)
    print(result)
```

--------------------------

### Split and join

```
def split_and_join(line):
    # write your code here
    return "-".join(line.split(" "))

if __name__ == '__main__':
    line = input()
    result = split_and_join(line)
    print(result)
```


--------------------------

### What's your name?

```
#
# Complete the 'print_full_name' function below.
#
# The function is expected to return a STRING.
# The function accepts following parameters:
#  1. STRING first
#  2. STRING last
#

def print_full_name(first, last):
    # Write your code here
    print(f"Hello {first} {last}! You just delved into python.")

if __name__ == '__main__':
    first_name = input()
    last_name = input()
    print_full_name(first_name, last_name)
```


--------------------------

### Python mutations

```
def mutate_string(string, position, character):
    str_list = list(string)
    str_list[position] = character
    return ''.join(str_list)

if __name__ == '__main__':
```

--------------------------

### Find a string

```
def count_substring(string, sub_string):
    counter = 0
    for i in range(0, len(string)):
        if (string[i] == sub_string[0]):
            if ( (string[i:(i+len(sub_string))]) == sub_string):
                counter += 1
    return counter

if __name__ == '__main__':
```

--------------------------

### String validators

```
if __name__ == '__main__':
    s = input()
    print(any(char.isalnum() for char in s))
    print(any(char.isalpha() for char in s))
    print(any(char.isdigit() for char in s))
    print(any(char.islower() for char in s))
    print(any(char.isupper() for char in s))
```

--------------------------

### Text Alignment

```
#Replace all ______ with rjust, ljust or center. 

thickness = int(input()) #This must be an odd number
c = 'H'

#Top Cone
for i in range(thickness):
    print((c*i).rjust(thickness-1)+c+(c*i).ljust(thickness-1))

#Top Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2)+(c*thickness).center(thickness*6))
               
#Middle Belt
for i in range((thickness+1)//2):
    print((c*thickness*5).center(thickness*6))    

#Bottom Pillars
for i in range(thickness+1):
    print((c*thickness).center(thickness*2)+(c*thickness).center(thickness*6))    

#Bottom Cone
for i in range(thickness):
    print(((c*(thickness-i-1)).rjust(thickness)+c+(c*(thickness-i-1)).ljust(thickness)).rjust(thickness*6))
```

--------------------------

### Text Wrap

```
import textwrap

def wrap(string, max_width):
    result = ""
    for i in range(0, len(string)):
        if i % max_width == 0:
            result += (string[i:i+max_width] + "\n")
    return result

if __name__ == '__main__':
    string, max_width = input(), int(input())
    result = wrap(string, max_width)
    print(result)
```

--------------------------

### Designed Door Mat

```
input_ = input()
N = int(input_.split(" ")[0])
M = int(input_.split(" ")[1])

# 0 -> 1 * 3 
# 1 -> 3 * 3
# 2 -> 5 * 3
# 3 -> 7 * 3

for i in range(int(N/2)):
    s2 = (i*2 + 1)*3
    s1 = (M - s2)/2
    aux_str = "-"*int(s1) + ".|."*int(s2/3) + "-"*int(s1)
    print(aux_str)
    
print('WELCOME'.center(int(M),"-"))

for i in range(int(N/2)-1,-1,-1):
    s2 = (i*2 + 1)*3
    s1 = (M - s2)/2
    aux_str = "-"*int(s1) + ".|."*int(s2/3) + "-"*int(s1)
    print(aux_str)
```

--------------------------

### String Formatting

```
def print_formatted(number):    
    padding_length = len(str(bin(number)).replace("0b",""))   
    for n in range(1, number+1):
        string_aux =  str(n).rjust(padding_length) + " "
        string_aux += str(oct(n)).replace("0o","").rjust(padding_length) + " "
        string_aux += str(hex(n)).replace("0x","").rjust(padding_length).upper() + " "
        string_aux += str(bin(n)).replace("0b","").rjust(padding_length) + " "
        print(string_aux)

if __name__ == '__main__':
    n = int(input())
    print_formatted(n)
```

--------------


### Alphabet Rangoli

```
def print_rangoli(size):
    width_ = 4 * size - 3
    list_1 = [i for i in range(size, 1, -1)]
    list_2 = [i for i in range(1, size + 1)]
    list_1.extend(list_2)
    
    for i in list_1:
        number_of_chars = (size - i + 1)
        s1 = (size - number_of_chars) * 2
        string_aux = ("-"*s1)
        
        for j in range(number_of_chars - 1, 0, -1):
            char_ = chr(97 - 1 + i + j)
            string_aux += (char_ + "-")
        
        for j in range(number_of_chars):
            char_ = chr(97 - 1 + i + j)
            string_aux += char_
            if j != (number_of_chars-1):
                 string_aux +=  "-"
                 
        s2 = width_- len(string_aux)
        string_aux += ("-"*s2)
        print(string_aux)

if __name__ == '__main__':
    n = int(input())
    print_rangoli(n)
```

--------------------------

### 

```

```

--------------------------

### 

```

```
