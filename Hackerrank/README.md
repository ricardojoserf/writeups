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