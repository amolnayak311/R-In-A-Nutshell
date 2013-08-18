#We can define matrix and the names of the dimensions as below
matrix <- matrix(data=1:24, 
			nrow=6, 
			ncol=4, 
			dimnames=list(
					c('c1', 'c2', 'c3', 'c4', 'c5', 'c6'),
					c('r1', 'r2', 'r3', 'r4'))
	)
matrix
#Lets look at factors
#It is quite common to encounter categorical values and storing these
#as a vector of characters is in efficient for large names or number of 
#valuescSuppose we have the following color of eyes. Lets store them 
#as a vector first
eyes.color.vector <- c('brown', 'blue', 'blue', 'green', 'brown', 
	'brown', 'brown')
eyes.color.vector
#converting this to factors gives
eyes.color.factors <- factor(eyes.color.vector)
eyes.color.factors
#As we can see quotes are no more present and the distinct values present
#Are levels, they are not ordered in this case and can be considered as 
#a distinct value with the same weight as the others
#Consider the below example where we are conducting a poll
survey.result <- factor(
	c('Disagree', 'Neutral', 'Strongly Disagree',
	  'Neutral', 'Agree', 'Strongly Agree',
	  'Disagree', 'Strongly Agree', 'Neutral',
	  'Strongly Disagree', 'Neutral', 'Agree'),
	levels=c('Strongly Disagree', 'Disagree',
		   'Neutral', 'Agree', 'Strongly Agree'),
	ordered=TRUE
)
survey.result
#The type is integer as we see
typeof(survey.result)
#The class is
class()
)
#Each of these 5 levels have a number associated from 1 to 5
#To see those we do
unclass(survey.result)
#We can do operations like finding the mean of all as below
mean(unclass(survey.result))
#As we can see the mean value is 3, which is Neutral
#Setting the converted values back to factors is not intuitive
#For example, we convert the survey result to integers
survey.integer.result <- unclass(survey.result)
survey.integer.result
class(survey.integer.result)
typeof(survey.integer.result)
#As we can see above the type of both of them is integer
#Suppose we want the values held in survey.integer.result to represent
#factors, we simply change the class attribute to "factor"
class(survey.integer.result) <- "factor"
#By doing the above, we change the class from integer to factor
#and printing it out indeed shows that it is factor
survey.integer.result
#Note that the type now is not ordered and just factor. To make it
#ordered factor like it was earlier, we set the type to a vector of
#two elements
class(survey.integer.result) <- c("factor", "ordered")
survey.integer.result
#It now looks ok, the order of the two strings in the vector is not 
#important
#We will look at forumlas, time series, date time, shingles later on
#as and when we go ahead
#Lets look at the attributes of an object
attributes(matrix)
#Possible attributes are
#class which gives the class of the obbject, comment which gives
#the comments associated giving the user provided description,
#dim giving the dimensi rowons associated and dimnames gives the names
#of the dimensions
#row.names gives the names of the rows
#tsp is the start time of the object
#levels levers of a factor
#Some examples are
levels(survey.result)
dim(matrix)
dimnames(matrix)
row.names(matrix)
#A vector can be converted to a matrix by just setting the attributes
pv <- 1:12
class(pv)
dim(pv) <- c(4, 3)
class(pv)
#Notice how the class change dto matrix on setting the dimensions
#lets print it out
pv
#Lets name the rows and cols
dimnames(pv) <- list(c('r1', 'r2', 'r3', 'r4'), c('c1', 'c2', 'c3'))
pv
#Lets associate comments
comment(pv) <- "My matrix"
#Attributes now are
attributes(pv)
#Checking for equality is interesting
#Lets us set the below vector and matrix
a <- matrix(data=1:12, ncol=3, nrow=4)
b <- 1:12
c <- a
d <- a
dimnames(d) <- list(c('r1', 'r2', 'r3', 'r4'),c('c1', 'c2', 'c3'))
b
a
b
#Lets do a == b, the result is interesting
a == b
#The result is a matrix  of same dimension as a with each element a boolean
#value resulting from the comparison of both the matrix and vector
#The order of comparison doesnt matter
#all.equal returns true if identical. By identical we mean , equal with
#regards to the data and the attributes
all.equal(a, b)
# a and c are exactly identical
all.equal(a, c)
#However a and d are not as d has additional column names
all.equal(a, d)
#If you are however interested in equality only, then invoke the identical
#function
identical(a, d)
identical(a, c)
