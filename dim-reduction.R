df1=read.csv(file.choose(),header=T)
df1[1:9]

#just looking at age
housing_median_age=2019-df1$housing_median_age
df=cbind(df1,housing_median_age)

#for blank data
countblank=function(x) sum(x=="")

#corelation
m=cor(df[,-c(5,9,10)]); m
m[upper.tri(m)]=NA;m
print(round(m,digits = 2), na.print = "")
#not so useful :p
symnum(m)


#data conversion techniques
