#PCA APPLIED ALMOST ON ALL PARAMETERS

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

#new
dfpca2=dfb
mod2=prcomp(dfpca2)
summary(mod2)
names(dfpca2)

#printing weights
mod2$rotation
print(round(mod2$rotation,digits=3))
#from output above, look whic one is contributing more

#normalization
mod3=prcomp(dfpca2, scale.=T)   #scale is indicating unit varience or not
summary(mod3)
print(round(mod3$rotation,digits=3))
range(mod3$x[,1]) #that of variable 1
range(mod3$x[,2]) #that of variable 2

plot(mod3$x[,1], mod3$x[,2], xlim=c(-4,35),ylim=c(-4,6), xlab="z1", ylab="z2")  
