#Simple mathematical operation for adding three numbers
 1 + 2 + 3
#Another mathematical operation to sum and multiply numbers
(1 + 2) * 3
#Create a vector of the fibonacci sequence. The "c" stands for "Combine"
c(0, 1, 1, 2, 3, 5, 8)
#A Short way to create a vector starting from 1 and till 50, 
#all indexes are 1 based and not 0 based like in other programming languages
1:50
#Vectors can be added/subtracted like scalers
c(1, 2, 3, 4, 5) + c (10, 20 , 30, 40, 50)
#If two vectors of unequal size are added the following happens
#in below case all elements from 1 to 4 are added. The fifth 
#element of the first vector is added to the first vector again
# and a warning i given as the second vector is not a multiple of first
#Thus if x1, x2, x3.. xn are elments of first vector and 
#y1, y2, y3... ym are elements of second vector where m < n, then the
#elements of y starting from 1 are appended to the vector while addition
#till the length becomes same as n
c(1, 2, 3, 4, 5) + c (10, 20 , 30, 40)
#Multplication of two vectors is not matrix multiplcation
# It just gives the new vector with the individual elements multiplied
c(1, 2, 3, 4) * c(10, 20, 30, 40)
#Adding/Subtracting/Div/Mult with a scaler with vector performs the 
#operation on each element of the vector with the given scaler. Scaler
#is nothing but a 1d vector thus the same rule mentioned ablve applies
1/1:4
1 + c(1, 2, 3, 4)
#Strings are created in double quote or single quote
'Hello'
#Binary operators cannot be applied to non numeric values, e.g below operation 
#is invalid
#'Hello' + 'World'
#vectors of Strings are created as
c('Hello', 'World')
#functions are invoked as below
log(4, 2)
#if the order is not same as the default order then explicit 
#naming can be used
log(base=2, x=4)
#Some default variables like say pi is defined
pi
cos(pi)
#variable assignment happens like below, in this case it is pronounced as
#'x gets 1'
x <- 1
x


