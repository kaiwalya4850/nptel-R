#PCA APPLIED ONLY ON LATITUDE AND LONGITUDE

#importing
df1=read.csv(file.choose(),header=T)
head(df1)

#looking at structure
str(df1)

#taking backup
dfb=df1

df1=df1[,-c(4,5,8)]
head(df1)

#applying PCA on lat/long 
range(df1$longitude)
range(df1$latitude)
plot(df1$longitude,df1$latitude, xlim=c(-125,-110), ylim=c(30,45),
     xlab="Long",ylab="Lat")
#Manual reduction
cor(df1)
x=cor(df1)
x[upper.tri(x)]=NA;x

#Automated PCA
dfpca=df1[,c(1,2)]
mod=prcomp(dfpca)
names(mod)
summary(mod) #96:3 is the ratio of contribution

#weights of new dimensions
mod$rotation

#in order to classify in graph, taking slopes
slp=with(mod,rotation[2,1]/rotation[1,1]) #like y/x
int=with(mod,center[2]-slp*center[1])  
abline(coef=c(int,slp))

slp1=-1/slp
int1=with(mod,center[2]-slp1*center[1])
#second component
abline(coef=c(int1,slp1))


