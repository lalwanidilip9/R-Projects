#Script Name: dilip.k.lalwani_HW04_Script.R
#Location: D:\STAT_604_FA17
#Created by Dilip Lalwani
#Creation Date: 09/13/17
#Purpose: Practice working with vectors, matrices, and data frames.
#Last executed: 09/13/17

Sys.time()

#1 housekeeping

objects()
ls()
rm(list=ls())

#2 Send output to the console and to a text files
sink("D:/STAT_604_FA17/HW04.txt", split=TRUE)

#3 Create and display a vector of numeric values from 4 to 100 with an increment of 4
(V1 <- seq(4,100,4))
# show the type of data contained in the vector
mode(V1)

#4 Create and display a vector of numeric values from .8 to 40 with an increment of .8
(V2 <- seq(0.8,40,0.8))
# show the type of data contained in the vector
mode(V2)

#5 Use the second vector to create and display a matrix by columns that is 5 columns wide
m1 <- matrix(data = V2, ncol = 5, byrow = FALSE, dimnames = NULL)
m1

#6 Combine the two vectors as columns to create and display a new matrix
# When two vectors are combined to create a new matrix, values in shorter arguments are transformed to
# achieve the length of new matrix. Similarly, first vector values are repeated twice to match length of
# second vector
(m2 <- cbind(V1,V2))

#7 Combine the two vectors as rows to create and display a new matrix
(m3 <- rbind(V1,V2))

#8a show contents of workspace
ls()

#8b load previously saved workspace
load("D:/STAT_604_FA17/HW04.RData")

#8c show contents of workspace again
ls()

#9 Display the object type and the type of data contained in the object loaded in the workspace
class(Oklahoma)
mode(Oklahoma)

#10 Display the same information for column 1 from that object
class(Oklahoma[,1])
mode(Oklahoma[,1])

#11 Display the structure of the object loaded in the HW04 workspace
str(Oklahoma)

#12 Display a summary of the object loaded in the HW04 workspace
summary(Oklahoma)

#13 Display the first 10 rows and all but column 12 from the object
Oklahoma[1:10,-(12)]

#14 Create and display a new object from Oklahoma using the first 25 rows, the first 2 columns, columns 4 and 5, and columns 13 through 15
Oklahoma[1:25,c(1:2,4,5,13:15)]

#15 close output file
sink()