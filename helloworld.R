print(c('Hello,World','学R写代码'))
#画图
library(ggplot2)
head(mpg)
p <- ggplot(mpg,aes(mpg$displ,mpg$hwy))+geom_point()
p
