library(ggplot2)
data<-read.table("UWvMSU_1-22-13.txt",header=TRUE,sep='\t')

cumulScores<-data.frame(Time=double(),UWscore=integer(),MSUscore=integer())
cumulScores[1,1]<-0 #1st col: time
cumulScores[1,2]<-0 #2nd col: UW score
cumulScores[1,3]<-0 #3rd col: MSU score

for(i in 2:nrow(data)) {
  cumulScores[i, 1]<-data[i, 1]
  if(data$team[i] == "UW"){
    cumulScores[i, 2]<-cumulScores[i-1,2]+data$score[i]
    cumulScores[i, 3]<-cumulScores[i-1,3]
  } else if(data$team[i] == "MSU") {
    cumulScores[i, 2]<-cumulScores[i-1,2]
    cumulScores[i, 3]<-cumulScores[i-1,3]+data$score[i]
  }
}

plot(cumulScores$Time, cumulScores$UWscore, type='l',col='blue', xlab = "Time (quarter)", ylab = "Cumulative score",labels=FALSE)
lines(cumulScores$Time, cumulScores$MSUscore, type='l')
axis(side=1,at=c(5,15,25,35),labels=c("1st","2nd","3rd","4th"),tck=0) #custom x-axis labels
axis(side=2,at=c(0,10,20,30,40),labels=c(0,10,20,30,40)) #custom y-axis labels