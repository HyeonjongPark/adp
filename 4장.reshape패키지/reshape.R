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

Fruits %>% group_by(Year) %>% summarise(sum_sales = sum(Sales))

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


diamonds



data = c("apple", "banana", "banano")
grep("banana", data)
grepl("banana", data)





mpg %>% filter(manufacturer == "toyota") %>% select(hwy) %>% summarise(mean = mean(hwy))
mpg %>% filter(manufacturer == "audi") %>% select(hwy) %>% summarise(mean = mean(hwy))


df = read.csv("http://goo.gl/HKnl74")
df

m1 = lm(df$overall ~ df$rides)
plot(df$overall ~ df$rides , xlabe = "Statisfaction with RIdes", ylab = "Overall Satisfaction") 
abline(m1, col = 'blue')

summary(m1)

m2 = lm(df$overall ~ df$rides + df$games + df$clean)
summary(m2)


m3 = lm(df$overall ~ df$rides + df$games + df$clean + df$weekend)
summary(m3)




corona = read.csv("C:/Users/onycom/Downloads/경기도코로나19신천지방역현황.csv")
corona


corona %>% colnames
corona %>% select(데이터기준일시)
corona 
unique(corona$시군명)


str(corona)
unique(corona$시설구분명)
summary(corona)
unique(corona$방역여부) 
class(corona$방역여부)
dim(corona)


corona
gsub("", NA, corona$방역주기)
ifelse(corona$방역주기 == "", NA, corona$방역주기)
corona


corona %>% head
corona$시군명
library(leaflet)

table(is.na(corona$위도 | corona$경도))
## na인 위 경도 값은 제거

is.na(corona$위도) %>% table
corona %>% filter(is.na(위도) != TRUE & is.na(경도) != TRUE)

corona = corona %>% select(위도,경도)

install.packages("leaflet.extras")
library(leaflet.extras)

install.packages("ggmap")
library(ggmap)


leaflet(corona) %>%
  setView(lng = 경도, lat = 위도, zoom = 3) %>%
  addTiles() %>%
  addCircles(lng = ~lon, lat = ~lat)
