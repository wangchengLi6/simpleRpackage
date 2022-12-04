##### 代码形式 #####
## 绘制若干条长度为L的随机游走链
p.length = 100
p.prob = 0.5
p.num = 2
p.seed = 1

# 生成数据
set.seed(p.seed)
savelist = list()
for(i in 1:p.num){
  ei = rbinom(p.length,1,p.prob)*2 - 1
  xi = c(0,cumsum(ei))
  savelist[[i]] = data.frame("times" = 1:(p.length+1),
                             "x" = xi,
                             "id" = i)
}
dtplot = do.call(rbind,savelist)
dtplot$id = factor(dtplot$id)


# 绘图
library(ggplot2)
p = ggplot(dtplot,aes(x = times,y = x,group = id,color = id))+
  geom_line()+
  geom_abline(intercept = 0,slope = 0)
plot(p)





##### 封装成函数后 #####

gene.chain = function(p.length,p.prob,p.num,p.seed = 1){
  set.seed(p.seed)
  savelist = list()
  for(i in 1:p.num){

    ei = rbinom(p.length,1,p.prob)*2 - 1
    xi = c(0,cumsum(ei))
    savelist[[i]] = data.frame("Times" = 1:(p.length+1),
                               "Value" = xi,
                               "chainId" = i)
  }
  dtplot = do.call(rbind,savelist)
  dtplot$chainId = factor(dtplot$chainId)
  return(dtplot)
}


plot.chain = function(dtplot){
  library(ggplot2)
  p = ggplot(dtplot,aes(x = Times,y = Value,group = chainId,color = chainId))+
    geom_line()+
    geom_abline(intercept = 0,slope = 0)+geom_abline(slope = 0,intercept = -20,col = 2)
  return(p)
}


main = function(p.length,p.prob,p.num,p.seed = 1){
  dt.plot = gene.chain(p.length,p.prob,p.num,p.seed)
  toplot = plot.chain(dt.plot)
  plot(toplot)
}

main(100,0.5,2,1)