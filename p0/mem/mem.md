---
title:
- MICRO. Practice 0, Exercises.
author:
- Pablo
geometry:
- margin=2.5cm
header-includes: |
    \usepackage[T1]{fontenc}
    \usepackage{mathpazo}
---

# Exercise 1: Factorial calculation

The changes necessary to calculate the requested results are to be done in the first part of the code, in the 'datos' segment, where `DATO_1` and `DATO_2` are declared:

```asm
DATOS SEGMENT 

DATO_1  DB     2
DATO_2  DB     3
```

`FACT_DATO_1` contains the result of the first factorial calculated at the end of execution.

Results obtained:

1. $4!\times 5! =$ 0B40h

```asm
DATOS SEGMENT 

DATO_1  DB     4
DATO_2  DB     5
```
 
![](../img/e1.1)


2. $8! =$ 9D80h

```asm
DATOS SEGMENT 

DATO_1  DB     8
DATO_2  DB     1
```
 
![](../img/e1.2)

3. $9! =$ 8980h. Although this is the obtained result, it is not correct, $9!=$ 58980h, which is bigger than what can be represented with 2 bytes.
 
 ```asm
DATOS SEGMENT 

DATO_1  DB     9
DATO_2  DB     1
```
 
![](../img/e1.3)

4. $8!\times 7! =$ C800h. Although this is the obtained result, it is not correct, $8!\times 7!$ is bigger than what can be represented with 2 bytes.
 
```asm
DATOS SEGMENT 

DATO_1  DB     8
DATO_2  DB     7
```
 
![](../img/e1.4)

# Exercise 2: "Factor" Program Modification