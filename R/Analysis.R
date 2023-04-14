Final <- read.table(file = snakemake@input[['txt']], header = FALSE)

colnames(Final)[1] = "Date"
colnames(Final)[2] = "Name"
colnames(Final)[3] = "KiloCalories"
colnames(Final)[4] = "Duration"
colnames(Final)[5] = "HeartRateMax"
colnames(Final)[6] = "HeartRateMin"
colnames(Final)[7] = "HeartRateAvg"

library(ggplot2)
library(tidyr)
library(car)
attach(Final)

print(Final)
str(Final)

Final$DurationinHours <- ((Final$Duration/60)/(60))

barplot(Final$DurationinHours, main = "Duration of Exercise in Hours", xlab = "Session")

plot(Final,col="blue",pch=19)

#jpeg(file = "JPEGS/Kilocalories.jpeg")
#barplot(KiloCalories, main = "KiloCalories",xlab="Session",width = 5)
#dev.off()
#barplot(HeartRateMax, main = "Heart Rate Maxiumum", xlab="Session")
###############################################################################################
#newFinal <- data.frame(cbind(HeartRateMin,HeartRateAvg,HeartRateMax))

#df1 <- data.frame(HeartRate=unlist(newFinal))
#barplot(df1$HeartRate)

#A<-rep(x = "A",time = length(Final$HeartRateMin), each = 1)
#B<-rep(x="B",time=length(Final$HeartRateAvg),each=1)
#C<-rep(x="C",time=length(Final$HeartRateMax),each=1)
#df2 <- data.frame(cbind(A,B,C))
#df3<- data.frame(unlist(df2))

#df4 <- cbind(df1,df3)
#colnames(df4)[2] = "HeartRateClass"

#ggplot(df4,aes(x = seq(1,length(df4$HeartRate)), y = df4$HeartRate, fill = df4$HeartRateClass)) + geom_bar(stat = "identity")

############################################################################################################################################
Session=seq(1,length(Final$HeartRateMin))
plot(Session, Final$HeartRateMin,type = "l",ylim = c(0,220),col="grey",lwd=1)
lines(Session,Final$HeartRateAvg, col='green',lwd=2)
lines(Session,Final$HeartRateMax, col = "red", lwd=3)
newdf <- Final[3:7]
scatterplotMatrix(newdf)

mosthighlycorrelated <- function(mydataframe,numtoreport)
{
  # find the correlations
  cormatrix <- cor(mydataframe)
  # set the correlations on the diagonal or lower triangle to zero,
  # so they will not be reported as the highest ones:
  diag(cormatrix) <- 0
  cormatrix[lower.tri(cormatrix)] <- 0
  # flatten the matrix into a dataframe for easy sorting
  fm <- as.data.frame(as.table(cormatrix))
  # assign human-friendly names
  names(fm) <- c("First.Variable", "Second.Variable","Correlation")
  # sort and print the top n correlations
  head(fm[order(abs(fm$Correlation),decreasing=T),],n=numtoreport)
}

y<-mosthighlycorrelated(mydataframe = newdf, numtoreport = 10)
print(y)


p <- ggplot(Final, aes(x = Duration, y = KiloCalories)) + geom_point()
plot(p)

p1 <- ggplot(Final, aes(x = Duration, y = HeartRateMax)) + geom_point()
plot(p1)

p2 <- ggplot(Final, aes(x = Duration, y = HeartRateMin)) + geom_point()
plot(p2)

ggplot2::ggplot(data = Final, aes(x = Name,y = Duration)) + geom_bar(stat="identity")


