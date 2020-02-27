# melt 와 cast 만으로...  데이터 구조를 column-wise하게 전환
library(reshape) 

data("airquality")

head(airquality)
names(airquality) = tolower(names(airquality))

aqm = melt(airquality, id = c("month", "day"), na.rm = TRUE)
head(aqm)

# 피버팅 하듯이 자료를 변환
a = cast(aqm, day ~ month ~ variable)
a


#install.packages("sqldf")
library(sqldf)

sqldf("select * from iris")  # 데이터 조회
sqldf("select * from iris limit 10") # head와 같은 기능
sqldf("select count(*) from iris where Species like 'se%'")

#install.packages("googleVis")
library(googleVis)

Fruits
sqldf("select * from Fruits")
sqldf("select * from Fruits order by Year")
sqldf("select * from Fruits order by Year desc")
sqldf("select sum(Sales) from Fruits")
sqldf("select sum(Sales) from Fruits group by Fruit")
sqldf("select sum(Sales) from Fruits group by Year " )


library(dplyr)
iris %>% head

iris %>% group_by(Species) %>% summarise(s_mean = mean(Sepal.Length))
sapply(iris[,1:4], mean)
sapply(iris[,1:4], sum)

sapply(iris, class)
str(iris)


iris %>% group_by(Species) %>% summarise(s_mean = mean(Sepal.Width))


trans_iris = transform(iris, 
                       sepal = Sepal.Length + Sepal.Width,
                       petal = Petal.Length + Petal.Width,
                       sepal_petal = Sepal.Length * Petal.Length)
trans_iris


library(ggplot2)

diamonds %>% select(starts_with("c"))
diamonds %>% select(ends_with("e"))
diamonds %>% select(contains("r"))

diamonds %>% select(color)
diamonds = diamonds %>% 
  mutate(price2 = ifelse(price >= 3933, "Expensive", "Cheap"))
diamonds = diamonds %>% 
  mutate(price3 = ifelse(price >= 5325, "High", 
                         ifelse(price >= 950, "midlle", "low")))
str(diamonds)

iris %>% dim

iris %>% 
  summarize(n.obs = n(),
            n.cut = n_distinct(Species),
            max.sepal = max(Sepal.Length))

diamonds %>% head

diamonds %>% 
  rename(width = x,
         length = y,
         height = z)



?regex

data = c("apple", "banana", "banano")
grep("banana", data)
grepl("banana", data)




