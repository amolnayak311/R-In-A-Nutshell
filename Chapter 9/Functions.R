#Let us define a simple function as below
f1 <- function(x, y) x + y
f2 <- function(x, y) {x + y}
f1(1, 2)
f2(3, 4)
#As we can see if the function has just one statement, we can skip the braces
#The last evaluation result is returned
f3 <- function(x, y = 10) x + y
f3(1)
f3(1, 7)
#The value of the default argument is used if the argument is not provided
#however if one is provided, then the one provided is used
f1(1)
#for functions where arguments dont have default value, we get a error at
runtime if the value is not provided. However consider the below function
f4 <- function(x, y) x^2
f4(2, 3)
f4(3)
#In the below case, though the parameters are x and y, y is never used and
#hence we dont get an error even if it is not passed. Thus an error is 
#flagged only when the parameter is not passed and it is used for evaluating 
#of the expression
#Let us use functions as arguments
sapply <- function(x, func) func(x)
sapply(2, function(x) x^2)
sapply(10, function(x) x + x)
#As we see above we passed function as a parameter to the function
#and invoked it to yield a result. Also note that the method passed as a
#parameter is an anonymous function
#Let us get some information about functions, arg method help us do that
args(f1)
args(sapply)
args(sin)
#similarly, the body function gets the body
body(f1)
body(sapply)
#We wil lnow use the formals method to get the values of the parameters
#and manipulate them
f5 <- function(x, y = 2, z = 4) x + y + z
f5.formals <- formals(f5)
f5.formals
#As we see above, the variable x is not initialized but y and z have
#default values
#let us use args method on this function
args(f5)
#Let us now amend the formals to give x a default value of 1
f5.formals$x <- 1
formals(f5) <- f5.formals
#Let is now get the args and then invoke it without arguments
args(f5)
f5()
#We can similarly change the body as below
body(f5) <- expression(x * y * z)
body(f5)
#Invoking it now gives
f5()
#Note that the value is expression(x * y * z) and not x * y * z. In later
#case we will get the body as the value evaluated after evaluating
#x * y * z
#Let us fially look at named arguments
#we can invoke the function with the name of the arguments e.g
f5(z = 3, x = 3, y = 4)
#When using named arguments the order in which they are specified isn't
#important. In case the named arguments are not used the order should
#be same as the order specified in the declaration of the function
