#1
rm(list=ls())
ls()
setwd("E:/A_FoutrhYear/secterrm/Big data/lab1")


#2
dfm <- read.csv("titanic.csv")

#3.a
dimension=dim(dfm)
dimension

#3.b
str(dfm)

#3.c
head(dfm,n=10L)
tail(dfm,n=10L)

#3.d
summary(dfm)

#4.a
summary(dfm$Age)

# 4.b ---> 1st Qu. = 20.12 , 3rd Qu. = 38 
    #first quartile is the value under which 25% of data points are found when they are arranged in increasing order
    # third quartile is the value under which 75% of data points are found when arranged in increasing order

#4.c
anyNA(dfm$Age)
is.na(dfm$Age)

# 4.c ----> Yes , tere are 177 rows has no value for age 
#     is.na() : returns a list of T , F indicating which  (rows) has a value for age  
#     anyNA() : returns True if at least there is one NA value for age (implements any(is.na(x)))
#     use is.na() in our case as we need the number of NAs

#4.d
typeof(dfm$Embarked)
factor(dfm$Embarked)
length(unique(dfm$Embarked))


# 4.d --->typeof(dfm$Embarked) is character , levels : Space ,C , Q , S 
         # No , length of levels of embarked variable = 4 but expected 3 (S,C,Q) 

     #4.e ----> preprocessing is needed.   

#5.a
dfm =dfm[is.na(dfm$Age)==FALSE,]

#5.b
dfm =dfm[dfm$Embarked!= '',]

#5.c
#for checking there is no NA in age
anyNA(dfm$Age) # returns False  

#for checking there is no NA in age
length( is.na(dfm$Age)) # returns nrows - number of NAs(=177) = 891-177=714
factor(dfm$Embarked) # levels = 3 (not 4)
length(unique(dfm$Embarked)) # 3

#5.c---> yes , this is what I expect = 3 (not 4) as above




#5.d
dfm=subset(dfm, select = -c(Cabin,Ticket ))
dim(dfm)

#6.a
gender_table=table(dfm$Gender)
gender_table
number_of_females=gender_table[[1]]
number_of_males=gender_table[[2]]
number_of_females
number_of_males





#6.b,c1
pie(c(gender_table[[2]],gender_table[[1]]),c("males","females"),col=c("blue","red"))

#6.c2
Survived_gender=table(dfm$Survived,dfm$Gender)
Survived_gender
Survived_males=Survived_gender[2,"male"]
Survived_females=Survived_gender[2,"female"]

NotSurvived_males=Survived_gender[1,"male"]
NotSurvived_females=Survived_gender[1,"female"]
Survived_males
NotSurvived_males
Survived_females
NotSurvived_females





#6.d
pie(c(Survived_gender[2,"male"],Survived_gender[2,"female"]),c("survived_males","survived_females"),col=c("blue","red"))

#6.e--->  number of survived_females > survived_males althougth the num of males > females



#6.f
Survived_class=table(dfm$Survived,dfm$Pclass)
Survived_class

Survived_1=Survived_class[2,1]
Survived_1
Survived_2=Survived_class[2,2]
Survived_2
Survived_3=Survived_class[2,3]
Survived_3
NotSurvived_1=Survived_class[1,1]
NotSurvived_1

NotSurvived_2=Survived_class[1,2]
NotSurvived_2

NotSurvived_3=Survived_class[1,3]
NotSurvived_3


#6.g,h
barplot(Survived_class,
main = "Survival of Each Class",
legend.text = c("Not Survived","Survived"),

xlab = "Class",
col = c("red","blue")
)
legend("topleft",

c("Not survived","Survived"),
fill = c("red","green")
)

# 6.i ----> I can observe that class_1 has the most survived passengers then class_2 then class_3 
           # and this is intuitive 


#6.j
boxplot(dfm$Age,

xlab = "years",
ylab = "Age",
col = "orange",
border = "brown",
horizontal = TRUE,
notch = TRUE
)
summary(dfm$Age)
# 6.k ----> the box plot shows that most of passengers were 20 : 38 years 
            #The box covers the interquartile interval, where 50% of the data is found
            # ages obetween 65 : 80 are outliers 
            # it gives info as max , min , median , 1st,3rd quartile

#6.l
hist(dfm$Age)

#7
new_dfm=dfm[c("Name","Survived")]
dim(new_dfm)
write.csv(new_dfm,"titanic_preprocessed.csv",row.names=FALSE)

