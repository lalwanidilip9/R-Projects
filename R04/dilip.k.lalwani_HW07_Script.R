#Script Name: dilip.k.lalwani_HW07_Script.R
#Location: C:\Users\dilip\Google Drive\FALL 2017 CLASSES\STAT 604\HW07
#Created by Dilip Lalwani
#Creation Date: 10/04/17
#Purpose: Practice using higher level graphics and adding objects to graphs.
#Last executed: 10/05/17

Sys.time()
#1 housekeeping
objects()
ls()
rm(list=ls())
#2 load previously saved workspace
load("C:/Users/dilip/Google Drive/FALL 2017 CLASSES/STAT 604/HW04/HW04.RData")
# show contents of workspace
ls ()
#3 Send graphics to PDF file
pdf("C:/Users/dilip/Google Drive/FALL 2017 CLASSES/STAT 604/HW07/dilip.k.lalwani_HW07_graph.pdf")
#4a First histogram with default number of breaks
hist(Oklahoma$PTRatio, freq=FALSE, xlab="Pupils/Teacher", main="Pupil/Teacher Ratios in Oklahoma Schools")
#4b Vector that can be used to extend the length of the X axis and force breaks every 5 pupils/teacher
brv <- seq(0,max(Oklahoma$PTRatio, na.rm=TRUE),5)
#4c New histogram with break points at 5 pupils/teacher
hist(Oklahoma$PTRatio, freq=FALSE, breaks=brv, xlab="Pupils/Teacher", main="Pupil/Teacher Ratios in Oklahoma Schools")
#5 Maroon line to the graph that shows the normal distribution density of the PTRatio numbers
xd <- seq(min(Oklahoma$PTRatio, na.rm=TRUE), max(Oklahoma$PTRatio, na.rm=TRUE), 0.01)
yd <- dnorm(xd, mean=mean(Oklahoma$PTRatio, na.rm=TRUE), sd=sd(Oklahoma$PTRatio, na.rm=TRUE))
lines(xd, yd, col="RED")
#6 Vertical line on the previous histogram at the average PTRatio
abline(v=mean(Oklahoma$PTRatio, na.rm=TRUE), col=5)
#7 New plot showing the number of teachers compared to the PTRatio
plot(Oklahoma$Teachers, Oklahoma$PTRatio, pch=3, col="#FF9900",xlim=c(0,140), xlab="Teachers", ylab="Pupil/Teacher Ratio")
#8 Colored fit line for the plot
abline(lm(PTRatio~Teachers, Oklahoma), col="PURPLE")
fl <- lm(PTRatio~Teachers, Oklahoma)
summary(fl)
#9 Date and time of creation embedded near the upper right hand corner of the graph area
text(80, 150, Sys.time(), adj=0)
#10 Boxplot of the number of students in each grade (Columns Grade7 through Grade12)
boxplot(Oklahoma[6:11], range=0, names=c(7,8,9,10,11,12), xlab="Grades", ylab="Students", main="Tulsa County vs. State", col="lightgreen")
#11 Diamonds representing average number of students in each grade from Tulsa County.
okla <- rep(0, 6)
for(i in 6:11)
{
okla[i-5] <- mean(Oklahoma[grepl("Tulsa", Oklahoma$County, ignore.case = TRUE),i], na.rm=TRUE)
}
lines(okla, type="p", pch=23, col="red", bg="darkgreen", cex=1.5)
dev.off()