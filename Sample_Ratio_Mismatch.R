#load library
#require(MASS)
#require(date.table)
#require(ggplot2)

#simulation parameters
#N=10000
#sigma1=5
#sigma2=5
#rho=0.7

#3 treatment groups
(sample_counts=c(1,1.06,0.94)*1000)
chisq.test(sample_counts,p=c(1/3,1/3,1/3))
#also can use binomial distribtuion

(binom_pvs=sapply(sample_counts,function(x)
  binom.test(x=x,n=sum(sample_counts), p=1/3)$p.v))


p.adjust(binom_pvs, method = 'bonferroni')
p.adjust(binom_pvs,method = 'BH')
p.adjust(binom_pvs,method='holm')

#iOS $ Android, 2 trt groups A/B
sample_counts_by_device =matrix(c(4710,4979,3925,3904),nrow=2)
dimnames(sample_counts_by_device) = list(c('A','B'),c('iOS','Android'))
sample_counts_by_device

chisq.test(sample_counts_by_device)

chisq.test(sample_counts_by_device[,'iOS'],p=c(.5,.5))
chisq.test(sample_counts_by_device[,'Android'],p=c(.5,.5))

