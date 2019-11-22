print("I'm thinking of a number 1-100...")
progNum<-sample(1:100)[1]

for(i in 1:10) {
  print("Guess: ")
  userNum<-as.integer(readline())
  
  if(progNum == userNum) {
    print("Correct!")
    break
  } else if(progNum > userNum) {
    print("Higher")
  } else if(progNum < userNum) {
    print("Lower")
  }
}
print("Game over!")