#libraries
library(nycflights13)
library(tidyverse)

#df
View(flights)

#5.24.3; How many flights have a missing dep_time? 
sum(is.na(flights$dep_delay))

#answer: 8255

#What other variables are missing? What might these rows represent?
summary(flights)

#answer: dep_time, dep_delay, arr_time, arr_delay, air_time


#5.3.1.2
#Sort flights to find the most delayed flights. Find the flights that left earliest.
arrange(flights, dep_delay)
arrange(flights, desc(dep_delay))

#answers: earliest flight = #97, most delayed = #51

#5.4.1.4
#Does the result of running the following code surprise you?
#How do the select helpers deal with case by default? How can you change that default?
select(flights, contains("TIME"))

#answers: no. it selected the things associated with "TIME", pretty straightforward. 
  #select helpers ignore case by default 'ignore.case = FALSE' will change that.

#5.52.2
#Compare air_time with arr_time - dep_time.
#What do you expect to see? What do you see? What do you need to do to fix it?
fly_time <- (flights$arr_time-flights$dep_time)
'arr_time > fly_time -> prints massive chart'
transmute(flights, arr_time, fly_time)

#answers: a bunch of TRUE/False outputs.and that's what we get.
  #transmute(flights, arr_time, fly_time)
