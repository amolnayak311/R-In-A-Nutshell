#We Start by defining a simple class for Time Series. This is a class that
#Will hold the data samples over a period of time
setClass("TimeSeries",
	representation(
		data="numeric",
		start="POSIXct",
		end="POSIXct"
	)
)
#This defined a class TimeSeries with three attributes data, start and end
#Of type numeric and the last two of type POSIXct. The attributes of a 
#class are given using the representation attribute. representation is 
#a function which accepts variable arguments and returns a list of them 
#with the given attributes. the above representation is without naming
#The parameters. An alternative is 
setClass(Class="TimeSeries",
	representation = representation(
		data="numeric",
		start="POSIXct",
		end="POSIXct"
	)
)
#Both the representations are valid. Lets define an instance now
my.TimeSeries <- new("TimeSeries",
			data=c(1, 2, 3, 4, 5, 6),
			start=as.POSIXct(
				"07/01/2009 00:00:00",
				tz="GMT",
				format="%m/%d/%Y %H:%M:%S"),
			end=as.POSIXct(
				"07/01/2009 17:30:00",
				tz="GMT",
				format="%m/%d/%Y %H:%M:%S")
)
#Now we can see this instance created with three slots, data, start and end
my.TimeSeries
#Let us now try to instantiate the below instance
my.invalid <- new("TimeSeries",
			data=c(1, 2, 3, 4, 5, 6),
			start=as.POSIXct(
				"07/01/2009 00:00:00",
				tz="GMT",
				format="%m/%d/%Y %H:%M:%S"
			),
			end=as.POSIXct(
				"01/01/1999 00:00:00",
				tz="GMT",
				format="%m/%d/%Y %H:%M:%S"
			)
)
my.invalid
#As we see above, an instance is being created with invalid slots though
#We will now see a way to ensure that such inconsistent instances are 
#not created. We add a validation for it as below, lets define a function
#For checking the validity
validation <- function(object) {
	length(object@data) > 1 &&
	length(object@start) == 1 &&
	length(object@end) == 1 &&
	object@start <= object@end
}
#Now that we have a function lets test if it works with the two instances
#We have
validation(my.TimeSeries)
validation(my.invalid)
#As we can see, it fails for the send instance. But the whole point is to
#not allow such instantiation. We do that but doing the below operation
#So that this function gets invoked automatically before instantiating the
#instance and fails if the function returns false
setValidity("TimeSeries", validation)
#We now test by creating the same invalid instance we created earlier
my.invalid <- new("TimeSeries",
			data=c(1, 2, 3, 4, 5, 6),
			start=as.POSIXct(
				"07/01/2009 00:00:00",
				tz="GMT",
				format="%m/%d/%Y %H:%M:%S"
			),
			end=as.POSIXct(
				"01/01/1999 00:00:00",
				tz="GMT",
				format="%m/%d/%Y %H:%M:%S"
			)
)
#Now we can see that the instance doesnt get created with invalid data.
#We can also define the validation when defining the class as below.
#Let us redefine it as below
setClass("TimeSeries1",
	representation(
		data="numeric",
		start="POSIXct",
		end="POSIXct"
	),
	validity=validation
)
#Let us again try to instantiate an instance of invalid object
my.invalid <- new("TimeSeries1",
			data=c(1, 2, 3, 4, 5, 6),
			start=as.POSIXct("01/01/2011", tz="GMT", 
				format="%m/%d/%Y"),
			end=as.POSIXct("01/01/1999", tz="GMT",
				format="%m/%d/%Y")
)
#We will now see a concept that in OO World is commonly referred to as 
#Method overloading. This is a phenomina where we have methods with
#Same name but different parameter types performing different operations
#Let us first define a class TimeSeries2 with the following definition
setClass("TimeSeries2",
		representation(
		data="numeric",
		period="numeric")
)
#Now let us define one version of period method
period.v1=function(object) {print(object@period)}
#This simply prints out the value of the period slot of the passed param
#Let us define another version, this is intended specifically for the
#TimeSeries class's object
period.v2=function(object) {
	period = (object@end - object@start)/length(object@data)
	print(period)
}
#Now, irrespective of the type of the object, we want to invoke the method
#with the name "period". We want the runtime to decide what method to 
#invoke in what case. Let us define a common default implementation
setGeneric(name="period", 
		def=function(object) {print("Default Implementation")})
#On executing the above step, we define a function with name period with
#a default implementation that will invoke the method printing out the 
#string "Default Implementation" by default
#Now, we want the period.v1 and period.v2 to be invoked when 
#the passed object is of type TimeSeries2 and TimeSeries respectively
#We perform this action as below
setMethod(period,
	signature=c("TimeSeries2"),
	definition=period.v1
)
setMethod("period",
	signature=c("TimeSeries"),
	definition=period.v2
)
#As we see above, in one instance of setMethod we have passed the period
#generic function itself as the parameter and in second case we pass
#the "period" as a string. Both these are valid and achieve the same
#result. Let us put this to test, but first let us define an instance
#of TimeSeries and TimeSeries2
ts <- new("TimeSeries",
		data=c(1, 2, 3, 4, 5, 6),
		start=as.POSIXct("01/01/2011 00:00:00",
				tz="GMT",
				format="%m/%d/%Y %H:%M:%S"),
		end=as.POSIXct("01/01/2011 00:00:05",
				tz="GMT",
				format="%m/%d/%Y %H:%M:%S")
)
ts1 <- new("TimeSeries2",
		data=c(1, 2, 3, 4, 5, 6),
		period=10
)
#Now let us invoke the methods. First the period with ts and then with ts1
period(ts)
period(ts1)
#Let us now invoke the period function with a string argument. It now 
#invokes the default implementation
period("Default")
#You must be wondering how did "Time difference of 0.8333333 secs" came 
#from. This is the standard statement when u subtract two date instances
#You may divide the subtracted number with another integer and the output
#Format will still not change. In this case we divided the time difference
#of 5 secs with 6, which is the input array length
#Let us now look at inheritance
#Suppose we want to measure time series of a person's weight, We call
#it weight WeightHistory. This is imilar to TimeSeries except that it has
#three additional parameters name, height and age. Rather than defining 
#All the attributes we extend the TimeSeries and define the additional
#Attributes in the sub class.
#TODO: See how we can reuse the validity method of the super
setClass("WeightHistory",
	representation(
		height="numeric",
		age="numeric",
		name="character"
	),
	contains=c("TimeSeries")
)
#Let is now instantiate one instance
john.stats <- new("WeightHistory",
	data=c(170, 160, 180, 155, 160),
	start=as.POSIXct("01/01/2013", tz="GMT", format="%m/%d/%Y"),
	end=as.POSIXct("05/01/2013", tz="GMT", format="%m/%d/%Y"),
	name="John",
	age=30,
	height=184
)
john.stats
#As we see above the data, start and end attributes are inherited from 
#TimeSeries. All the validations for this class hold true even for
#the subclass
period(john.stats)
#The period method invoked also works and the version for TimeSeries is 
#invoked
is(john.stats, "TimeSeries")
#The above call checks that the the object john.stats is indeed an instance
#of TimeSeries class
############################################################################
#TODO:"This what we should be able to achieve by using a virtual super 
#class
#But somehow this is not how it functions. Explore more
#We have a common class defining the common attributes of say
#a dog and a person. We call it "LivingThing"
#setClassUnion(name="LivingThing",
#		representation(
#			name="character",
#			age="numeric"
#		)
#)
#Instantiatiating the LivingThings is not possible as it is defined using
#setClassUnion rather than setClass, let us try instantiang it
#new("LivingThing", name="SomeName", age=20)
#Now let us define the two classes Person and Dog which extends from 
#this class
#setClass("Person",
#	representation(nationality="character"),
#	contains="LivingThing")
#setClass("Dog",
#	representation(breed="character"),
#	contains=c("LivingThing")
#)
#As we see above the value of the contains attribute need not be an array
#if have just one class we extend from. Let is instantiate these objects
#new("Person", name="John", age=30, nationality="India")
#new("Dog", name="Snowy", age=5, breed="Labrador")

#TODO: Explore coersion and method management if needed
