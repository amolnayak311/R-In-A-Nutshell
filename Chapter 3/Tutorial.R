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
#Let us assign an vector to z
z <- 1:12
#to find the 7th element we do,all indexes are 1 based
z[7]
#To fetch elements 1 - 6 we do
z[1:6]
#to fetch all elements that are mod of 3, note that we do z %% 3, where
# z is the vector, also mod is %% and not % line in other languages
z[z %% 3 == 0]
#to fetch items 1, 3, 7, 9 we pass a vector with these numbers as parms
z[c(1, 3, 7, 9)]
#z %% 3 == 0 returns a vector of same size as z but the values are 
#either TRUE or FALSE depending on whether the number is a multiple of 
#3 or not
z %% 3 == 0
# = is also used instead of <-, however <- is more preferred choice
one = 1
#The scope matters when using =, for e.g in the below sample
cos(inp = 45)
#Now typing in inp will not find print the value as the inp was in the 
scope of the function
inp
#Where as the below will give the value of inp
cos(inp <- 45)
inp
#Equality is ==
3 == 2
#We can have Arrays in R, Arrays are multi dimentional vectors
#For e.g., we define a 2 dimentional array as below
array(1:12, c(3, 4))
#This is same as, where we ars using named parameters
array(data=1:12, dim=c(3, 4))
#Matrix is a multi a 2 dimentional array, it is defined as below
m <- matrix(data=1:12, nrow=3, ncol=4)
m
#An element of this matrix can be accessed as below
m[2, 3]
#We can set value of the matrix similarly
m[2, 3] <- 14
m
#Arrays are multi dimentional, for example
ma <- array(1:16, dim=c(2, 2, 2, 2))
ma
#Here the vector of 16 numbers is broken down into 4 matrix of 2x2 each
#These 4 2x2 matrix form another 2x2 matrix where each element are these
#2x2 matrix
#We access the elements of this matrix a below
ma[1, 2, 2, 2]
#here, first two numbers are the indexes in the small 2x2 matrix. In this
#case, it can be wither 3, 7, 11 or 15clea. The last two identify which of the
#4 2x2 arrays we need to access from. Numbers are always populated
#starting from left and moving from top to down
a <- matrix(data=1:12, nrow=3, ncol=4)
#Access first row
a[1,]
#Access first column
a[,1]
#Access first and third row
a[c(1, 3),]
#Lists are not like those in other prog languages
#They can hold hetrogeneous elements and multiple maned components
person1 <- list(name="Name1", age=30)
person1
#We can access the values using numeric indexes, like 
person1[1]
#more clear way is to access using the name which can be done as
person1["name"]
#Or 
person1$name
#We can have list of lists
person2 <- list(name="Name2", age=25)
people <- list(person1, person2)
people
#It can be accessed as 
people[[1]]$name
#For name of first person, we can also have named variables as below
people <- list(person1=person1, person2=person2)
people$person1$age
#Frames is a collection of multiple vectors holding related data
#Lets see the below a points table
teams <- c('CSK', 'MI', 'RR', 'SH', 'RCB', 'KXIP', 'KKR', 'PW', 'DD')
won <- c(11, 11, 10, 10, 9, 8, 6, 4, 3)
lost <- c(5, 5, 6, 6, 7, 8, 10, 12, 13)
points <- c(22, 22, 20, 20, 18, 16, 12, 8, 6)
#Above points table is shown as v different vectors but are logically related
#We can create a data frame for thee as below
pointsTable <- data.frame(teams, won, lost, points)
pointsTable
#To Get the number of wins for MI we do
pointsTable$won[pointsTable$teams == 'MI']


