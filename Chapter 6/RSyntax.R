#Numbers are doubles in R by default
one <- 1
typeof(one)
2^1023
#Number can be represented in Hex
0x0FF
#A number initialized in below fashion will be initialized to Integer 
intOne <- 1:1
typeof(intOne)
#Numbers can also have imaginary part, its type is complex
imag <- 0 + 1i
typeof(imag)
#Below will give -1 but the type will still be complex
imag ^ 2
#Similarly sqrt will be wil give 0 + 1i
sqrt(-1 + 0i)
#However sqrt(-1) will give Nan
sqrt(-1)
dQuoteStr <- "Hello"
sQuoteStr <- 'Hello'
sQuoteStr == dQuoteStr
#Variable names(symbols) are case sensitive
x <- 1
#following will give an error
X
#Following will not
x
#Symbol name can contain . _ numbers and characters. But begins with char
x.1 <- "hello"
#The assignment is above is to create a new symbol x.1. It is nothing to do
#with the symbol x
#and the 1 is not a property of x as one might think
x.1
#For defining variables that use special characters use `
`123` <- 123
`123`
#Integer division can be done using %/%
21%/% 2
#We can define our custom binary operators using `%<oper name>%`, remember
# It begins with `
`%add%` <- function(x, y) {x + y}
4 %add% 6
#Curly braces evaluate a serier of expressions and return only the last 
#expression in the brace
{cbOne <- 1 ; cbTwo <- 2; cbOne + cbTwo}
#The variables defined in the brace are available in 
#the current environment though
cbOne
cbTwo
#Control structures, if is a special type of control structure
typeof(`if`)
x <- 10
y <- c(1, 2, 3, 4, 15, 20 , 25)
if(x < y) x else y
#In the above comparison, the value of x is compared to the first element
#of the vector y ti yield the result.
#If we want to deal with vectors, we do the following
ifelse(y < x, y, x)
#In the above call, the output value of y will not be an entire vector
#but the element of the vector for which the comparison happened
#If can get verbose at times and we would like something more concise
#switch is used for this very reason
animal <- function(id) {
	switch(id,
		c='Camel',
		d='Dog',
		'Unknown'
	)
}
animal('d')
animal('a')
#Loops
#repeat may be used to repeat a block multiple times
i <- 5
repeat {if(i < 30) {print(i);i <- i + 5} else break }
#Another way to write the above loop is using while, additionally 
#we have a next, next is synomymous to continue in java
i <- 0
while(i < 25) {i <- i + 5; if(i == 10) next ; print(i)}
#break can be used within while loop
#for loops can be used too as below
for(i in seq(from=5, to=25, by=5)) print(i)
#Looking up the elements in a vector
vector <- 100:119
#Fifth element is 
vector[5]
#ELement 1 to 5 are
vector[1:5]
#1, 6, 11 and 16th element is 
vector[c(1, 6, 11, 16)]
#Same applies to list
list <- list(a=1, b=2, c=3, d=4, e=5, f=6, g=7, h=8, i=9, j=10)
#First three elements are 
list[1:3]
#All elements except 3 and 7 are 
list[c(-1, -7)]
#All elements except first 3
list[-3:-1]
#Accessing list bt name
#ath elem
list$a
#a, d and f
list[c('a', 'd', 'f')]
#Let is define a matrix
m <- matrix(data=101:112, nrow=3, ncol=4)
m
#Getting the third row
m[3,]
#To get the first element of the third row we do
m[3]
#or
m[3, 1]
#In former case though it is similar to accessing a single dimentional 
#vector
#Getting 1st and 3rd row
m[c(1, 3),]
#Getting a sub matrix of elements in 2nd and 3rd row and column
m[2:3, 2:3]
#Let us define an array of dim 2, 3, 4
a <- array(data=101:124, dim=c(2, 3, 4))
a
#Accessing the element in 1, 1 of all the 4 matrix, result will be 
#a matrix of 4 elements, type is a vector
a[1, 1, ]
#accessing all first rows in each of the 4 matrix, result will be a matrix
#However the rows will be formed by first element of each of the 4 matrix
#second elem of each of the four matrix etc, type is a matrix
a[1, , ]
getting a 2 x 2 matrix from 2 (first and second) of the four matrices
#Type is an array
a[1:2, 1:2, 1:2]
#Accessing values of vector by boolean values
v <- 1:10
v[c(TRUE, FALSE)]
#By doing the above, we retrieve every alternate element
#the size of the vector v is 10 where as the parameter given is of size 2
#In this case the provided parameter is repeated till till the count
is same as the size of the vector, another example is which shows that the
#Size of the parameter vector need not be a multiple os and the size of 
#vector v
v[c(TRUE, FALSE, FALSE)]
#Finally we look at a sample for matching the name when retrieving
#the elements of a list
dairy <- list(milk="1 gallon", butter="1 pound", eggs=12)
#Below will not select anything and will get NULL
dairy[["mil"]]
#However with exact=FALSE we will get one
dairy[["mil", exact=FALSE]]
#Note that the match will just match the prefix and not any substring, 
#Thus the following will not match anything
dairy[["ilk", exact=FALSE]]
