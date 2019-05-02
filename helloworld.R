print(c('Hello,World','学R写代码'))
#画图
library(ggplot2)
head(mpg)
p <- ggplot(mpg,aes(mpg$displ,mpg$hwy))+geom_point()

library(pacman)
# 1数据科学包
p_load(tidyverse)
# 2 实现功能library(tidyverse)
# 3加载记分卡包
p_load(scorecard)
#4 加载多重共线性分析包
p_load(car)
#5 使用机器学习GBGT包
p_load(gbm)
p_load(ggdmc)
