#some tests to try
source('multiDimComparisonQuick.R')


d <- 3
samples <- 20

result <- c(0,0,0,0)

for (trial in 1:50){
A <- mvrnorm(samples,rep(0,d),diag(d))
B <- mvrnorm(samples,rep(0.1,d),diag(d))
#B <- cbind(rexp(samples),rexp(samples),rexp(samples))

result <- result + multiDimComp(A,B)
}

result <- rbind( c('lab1','lab2','uMMD','lMMD'),result)
print(result)