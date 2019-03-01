library(xlsx)
df=read.csv(file.choose(),sep=",",header=T)
df$recency
df[1:5]
df[1:2]
df[,3]



temperature=rnorm(5000,mean=28,sd=7)
print.default(temperature)
