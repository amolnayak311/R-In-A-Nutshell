#Lets look at some assignments
x <- 1
y <- 2
z <- 3
v <- c(x, y, z)
v
x <- 4
v
#The above sample shows that the values of x, y and z when v was assigned
#a value were used. So even changing the value of x, y or z later 
#doesnt affect the value of v
#We can have deferred execution as below as and when we need it to
x <- 1
y <- 2
z <- 3
v <- quote(c(x, y, z))
eval(v)
x <- 4
eval(v)
#another possible way is as below
x <- 1
y <- 2
z <- 3
delayedAssign("v", c(x, y, z))
x <- 5
v
#In above case the value of  v gt evaluated when we first used it
#This is called creating a promise
#you can look at all the variables defined in the current environment
#as below
objects()
#We can remove an object using rm
rm(x)
objects()
#x should be gone now
#A new session created created a new global environment
#It is obtained using .GlobalEnv. Lets get its parent
x <- .GlobalEnv
while(environmentName(x) != environmentName(emptyenv())) {
	x <- parent.env(x)
	print(environmentName(x))
}
#To summarize, 
#Get the global environment using .GlobalEnv
#Get the parent of an enviroment using parent.env(<env>)
#Get the name of an enviromnent as environmentName(<env>)
#empty environment is represented as emptyenv()
#Let us look at environments and functions
env.demo <- function(a, b, c, d, e) {
	print(objects())
	print(y)
	print(environmentName(parent.env(.GlobalEnv)))
	print(environmentName(.GlobalEnv))
}
env.demo(1, 2, 3, 4, 5)
#As we can see here a new local enviromnent is created in the function 
#containing the 5 variables passed, the remaining variables are present
#in the parent environment
#An interesting thing to note here is, though the variable x is 
#not shown up in the objects() function call but it is still available,
#????
#The name of the environment is still the same R_GlobalEnv, which is the 
#environment from which the function was invoked
#???? Investigate this ????
#Parent environmnet is the one in which the function is defined and
#not the one it was executed in. In this case both are same, however, 
#in case the function is defined in a package. The parent environment will
#not be same the the one it was invoked in. The parent will be the same
#environment as the package


#TODO, we will not look at getting the stack of execution environments now
#We will take this up later as and when we need to.
#We will also not look at the attach and detach for adding and removing
#objects from current environment. We will take this up later as and when 
#required

#Let us look at exception handling
#We first look at signalling errors
#Let us write a function that open a file that doesn't exist and then
#writes an error message stopping ant further execution
function.fileopen  <- function(fileName, shouldWarn) {
	if(file.exists(fileName)) {
		"exists"
	} else {
		if(shouldWarn) {
			warning("File doesnot exist: ", fileName)
		} else {
			stop("File doesnot exist: ", fileName)
		}
	}
	print("After error/warn")
}
function.fileopen("Non existent", TRUE)
function.fileopen("Non existent", FALSE)
#Above we have defined a function that tries to find a on existent file
#In one case it is a warning and other case it is an error. The methods
#are warning and stop respectively. Notice that in case of warning, the
#execution continues and the message "After error/warn" prints out.
#If just a message is to be printed the method is message.
#So the methods in decreasing level of severity are
#stop, warning, message
#Let us look at the approach we are used to in programming languages.
#the try catch approach
#First, there is a try method with silent=TRUE option
try(
	open("Non existent"),
	silent=TRUE
)
#There is a try method with silent=FALSE option
try(
	open("Non existent"),
	silent=FALSE
)
#As we can see the second one flashes the error while the first one didn't
#let is perform the same operations using tryCatch
evalTryCatch <- function(exp) {
	tryCatch(
		exp,
		warning=function(w) {print("In Warning")},
		error=function(e) {print("Caught Error")},
		finally={print("Cleaning up")}
	)
}
evalTryCatch(open("Non Existent"))
evalTryCatch(
	{
		v <- c(TRUE, FALSE)
		if(v == TRUE) {
			TRUE 
		} else {
			FALSE
		}
	}
)
evalTryCatch( x <- 1)
#As we see above, we defined a tryCatch function with one handler for
#warning and one for error and one finally block that will be executed
#always, even if no exception was thrown the finally block gets executed
#We have three conditions. In one case the fie open fails and we get an 
#error, we see that the error handler gets invoked
#In another case the if condition has == operator with a vector which
#flags a warning and thus we have the warning handler invoked.
#In third case, no exception occurs. In all cases the finally handler 
#gets executed

