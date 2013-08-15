#Lets look at some expressions in R
x <- 1
if( 2 > 3) "yes" else "no"
127 %% 10
#Multiple expressions can be given on separate line on same
#line separated by ;
"Hello World"; 7 + 13; cos(0)
#Let us define a character vector with four elements
animals <- c("cow", "chicken", "pig", "tuba")
# Changing the fourth element to duck would be
animals[4] <- "duck"
#lets print it out
animals
#The <- operator is actually a function, below statement is equivalent of 
#above, but we will set it to dog this time, notice is `[<-` with the "["
`[<-`(animals, 4, "dog")
#lets print it out
animals
#Simple assignment (not to an array element as in above element) is `<-`
`<-`(v, 2)
#Lets print v
v
#Similarly for arithmatic operator
`+`(3, 4)
#Object assignment is immutable in R. For e.g.
c <- list(1)
u <- c
#In java we would have had one list in memory and two references to the same
#object, modifying any would modify the same instance in memory.
#It isnt the case in R though
u[[1]] <- "Hello"
#Lets print out u and c, c should stay unchanged
c;u
#Same applies when we pass the value as a parameter, lets define a function
f <- function(x) {x[4] <- 123 ; x}
#Define a vector c
c <- 1:10
c
#invoke the function
f(c)
#print c again
c
#Lets look at some special values in R
#NA stands for Not Available
x <- 1:4
length(x) <- 7
x
#By setting the length to 7, the additional 3 elemsnts were made NA
x[7]
#Positive and negative infinity
2^1024
-2^1024
#Divide by 0 is not error but gives infinity
1/0
#However 0/0 is NaN (Not a number) which s another special value
0/0
Inf - Inf
#Inf + Inf however is Inf
Inf + Inf
#We conclude by looking a bit at coersion
v <- 1:5
v
#This initializes the vector from numbers 1 to 5, the type is numeric
typeof(v)
class(v)
#Lets set a value to string
v[2] <- "dog"
v
#The type of all elements now change to the same string type
typeof(v)
class(v)
#Another example
b <- c("A", "B", "C")
b
#Lets put a boolean
b[2] <- TRUE
b
#The boolean becomes a String in this case
#Roughly the precedence is
#logical <- integer <- numeric <- complex <- character <- list
#Which states that a type of lower precedence gets converted to the one
#with higher precedence
