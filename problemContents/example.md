 　The Fibonacci numbers (0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...) are defined by the recurrence:
$$
F_n = 
\begin{cases}  
0, &\text{if $n = 0$} \\[2ex]
1, &\text{if $n = 1$}\\[3ex]
F_{n-1}+F_{n-2}, &\text{for all $n \geq 2$}
\end{cases}
$$
Write a program to calculate the Fibonacci Numbers. 

### Input
The input to your program would be a sequence of numbers smaller or equal than 5000, each on a separate line, specifying which Fibonacci number to calculate. 

### Output
Your program should output the Fibonacci number for each input value, one per line. 

### Sample Input
5  
7  
11  

### Sample Output
The Fibonacci number for 5 is 5  
The Fibonacci number for 7 is 13  
The Fibonacci number for 11 is 89 
