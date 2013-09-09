#This script will show various save load and editing functions in R
#Let us start by defining a data frame
salary <- c(18700000, 14626720, 14137500, 13980000, 12916666)
positions <- c('QB', 'QB', 'DE', 'QB', 'QB')
team <- c('Colts', 'Patriots', 'Panthers', 'Bengals', 'Giants')
name.last <- c('Manning', 'Brady', 'Pepper', 'Plamer', 'Manning')
name.first <- c('Peyton', 'Tom', 'Julius', 'Carson', 'Eli')
top.5.salaries <- data.frame(name.last, name.first, team, positions, salary)
top.5.salaries
#Now the Edit command below will invoke an editor to edit the contents
#Edit any of the content and remember the change
edit(top.5.salaries)
#Now we print the data frame and see that the change is not reflected
#That is because the value needs to be reassigned back to the variable.
#Go ahead and make the changes again and see
top.5.salaries
top.5.salaries <- edit(top.5.salaries)
#The changes now will be seen
top.5.salaries
#An alternative to change the contents without re assignment is
fix(top.5.salaries)
#Now the changes made will be visible without re assignment
top.5.salaries
#The below variable sets the path at which the files will be kept
#This needs to be changed for running on different system
path <- "D:/Amol/R/R-In-A-Nutshell/Chapter 11"
fix(path)
save(top.5.salaries, 
	file=paste(path, 'top.5.salaries.binary.RData', sep='/'))
#Similarly the data stored in ASCII format as below
save(top.5.salaries, 
	file=paste(path, 'top.5.salaries.ascii.RData', sep="/"),
	ascii=TRUE)
#This saves the file in ASCII format which is human readable. This can be
#compressed and then the format is binary. See the book R In a nutshell for
#Various other possible parameters
#Next we assign the variable top.5.salaries to an integer
top.5.salaries <- 123
top.5.salaries
#Now we load from the file that we had saved earlier
load(paste(path, 'top.5.salaries.ascii.RData', sep='/'))
top.5.salaries
#We can see that the load has now overridden the variable and the new value
#is assigned to it which was the one we saved earlier
#See the book r in a nutshell for other possible options possible for save
#Let us now load the top5 salaries from the file where ";" is delimiter
#and "," is the decimal point
top.5.sal.from.file <- read.table(
	file=paste(path, 'top.5.salaries.eu.csv', sep='/'),
	header=TRUE,
	sep=';',
	dec=',',
	quote='"'
)
top.5.sal.from.file
#We see that the file is successfully loaded. The parameters are self
#explanatory. The header=TRUE states that the first line of the file is 
#the header. The separator character in the file is ;. The value that
#will be used as the quote is "
#But, the second value got rounded to an integer value. Investigate why.
#See other parameters here.
#Let is now do an interesting thing to get the stock details of 
#Google(GOOG) from Yahoo finance for the date 01/03/2010 to 15/03/2010
#http://ichart.finance.yahoo.com/table.csv?
#s=GOOG&a=03&b=01&c=2010&d=03&e=15&f=2010
goog.data <- read.csv(
	paste('http://ichart.finance.yahoo.com/table.csv?',
		's=GOOG&a=03&b=01&c=2010&d=03&e=15&f=2010', sep=''))
goog.data
typeof(goog.data)
#If the internet connection is working and all is fine, the data for 
#google from 1 - 15 Mar 2010 should be seen as a data frame, type is list
#Similarly we can read fixed width files. See the book R In a nutshell
#for the details on this
#Similar to reading the file we can also write data to files as say csv
write.table(
	goog.data,
	file=paste(path, 'googleData.csv', sep='/'),
	sep=";",
	dec=","
)
#This should generate the file googleData.csv with the separator as ;
#and decimal point as , Attributes like quote is TRUE by default which puts 
# a " around the string values. append=FALSE which ensures that existing 
#file is overwritten and not appended. The value row.names and col.names
#is TRUE which puts the row number as String in the output and the header
#in the exported file.
#Now we will see how to connect to Database and work on the data from the
#database. We will use the DBI Approach to connect to the Database
#As odbc approach didnt work.
#First, install the RSQLite package, uncomment for first time only
#install.packages('RSQLite')
#Then load the package as below
library(RSQLite)
#Get the SQLite Driver as below
drv <- dbDriver('SQLite')
#Now we use this driver to connect to the bb.db database. The location of
#the file on the filesystem can be retrieved as below
fileLocation <- system.file('extdata', 'bb.db', package='nutshell.bbdb')
fileLocation
# We use this fileName and the driver to connect to this sqlite db
connection <- dbConnect(drv, fileLocation)
#If all goes well, we now have the connection to this database.
#Let us see if we can find the list of all tables in the database
dbListTables(connection)
#So now we see 27 different table in the database.
#Now let us see the columns of the Allstar table
dbListFields(connection, "Allstar")
#Note that the columns are called fields. So its dbListFields and not 
#dbListColumns. The two parameters are the connection object created
#earlier and the name of the table.
#similarly, let us see what fields(columns) we have in table Teams
dbListFields(connection, "Teams")
#Let us get the total wins and loses for year 2008 
#and league American League. The sql query for this would be 
#select teamID, name, W, L from Teams where yearID = '2008' and lgID = 'AL'
query <- "select teamID, name, W, L from Teams where yearID = 2008 and lgID = 'AL'"
query
#Let us now execute this query
wlrecords.2008 <- dbGetQuery(connection, query)
wlrecords.2008
typeof(wlrecords.2008)
#As we see above, we get the data for the teams. The dimension of the above
#list is 14 X 4. Which is confirmed by the below call of dim.
dim(wlrecords.2008)
# We have successfully queried the table to get the data from it. 
#Now let is execute something more complex.







