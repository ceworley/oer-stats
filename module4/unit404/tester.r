suc = 0
fai = 0

for (i in 1:1e3)
{
mag = sample(0:2,1)
mu1 = signif(10^mag,3)
sig1 = signif(mu1*runif(1,0.1,0.3),3)
n1 = sample(3:8,1)
sig2 = signif(mu1*runif(1,0.1,0.3),3)
n2 = sample(3:8,1)

df = min(n1,n2)-1
## df = (sig1^2/n1+sig2^2/n2)^2/(sig1^4/n1^2/(n1-1)+sig2^4/n2^2/(n2-1))
## df = round((sig1^2/n1+sig2^2/n2)^2/(sig1^4/n1^2/(n1-1)+sig2^4/n2^2/(n2-1)), 0)

alpha = sample(c(0.1,0.05,0.04,0.02,0.01),1)
gamma = signif(1-alpha,2)
tstar = round(qt(1-alpha/2,df),2)

mu2 = mu1+tstar*sqrt(sig1^2/n1+sig2^2/n2)
mu2 = signif(mu2,3)

if(sample(c(T,F),1)) {
    sam1 = round(rnorm(n1,mu1,sig1),-mag+2)
    sam2 = round(rnorm(n2,mu2,sig2),-mag+2)
}else{
    sam1 = round(rnorm(n2,mu2,sig2),-mag+2)
    sam2 = round(rnorm(n1,mu1,sig1),-mag+2)
    n3 = n1
    n1 = n2
    n2 = n3
}

xbar1 = signif(mean(sam1),3)
xbar2 = signif(mean(sam2),3)
s1 = signif(sd(sam1),3)
s2 = signif(sd(sam2),3)

SE = round(sqrt(s1^2/n1+s2^2/n2),3)

bounds = c(xbar2-xbar1-tstar*SE, xbar2-xbar1+tstar*SE)
LB = min(bounds)
UB = max(bounds) 

t = (xbar2-xbar1)/sqrt(s1^2/n1+s2^2/n2)
if (abs(t)>tstar){
    wrd = 'yes'
    pin = '<'
    tin = '>'
    wrd2 = 'reject'
    wrd3 = 'not'
} else {
    wrd = 'no'
    pin = '>'
    tin = '<'
    wrd2 = 'retain'
    wrd3 = ''
}

ps = c(1,0.2,0.1,0.05,0.04,0.02,0.01,0.005,0.004,0.002,0)
pval = 2*(1-pt(abs(t),df))
plow = max(ps[ps<pval])
phigh= min(ps[ps>=pval]) 
if(abs(t)>tstar){fai = fai+1}else{suc=suc+1}
}

print(suc)
print(fai)

##options(scipen=999)

### DATA GENERATION
### Rejects H0 about 55% of time...
##mag = sample(-1:3,1)
##mu1 = signif(10^mag,3)
##sig1 = signif(mu1*runif(1,0.1,0.3),3)
##n1 = sample(3:6,1)
##se1 = sig1/sqrt(n1)
##sig2 = signif(mu1*runif(1,0.1,0.35),3)
##n2 = n1

##df = min(n1,n2)-1
### df = (sig1^2/n1+sig2^2/n2)^2/(sig1^4/n1^2/(n1-1)+sig2^4/n2^2/(n2-1))
### df = round((sig1^2/n1+sig2^2/n2)^2/(sig1^4/n1^2/(n1-1)+sig2^4/n2^2/(n2-1)), 0)

##alpha = sample(c(0.1,0.05,0.04,0.02,0.01),1)
##tstar = round(qt(1-alpha/2,df),2)

##mu2 = mu1+tstar*sqrt(sig1^2/n1+sig2^2/n2)
##mu2 = signif(mu2,3)

##if(sample(c(T,F),1)) {
##    sam1 = round(rnorm(n1,mu1,sig1),-mag+2)
##    sam2 = round(rnorm(n2,mu2,sig2),-mag+2)
##}else{
##    sam1 = round(rnorm(n2,mu2,sig2),-mag+2)
##    sam2 = round(rnorm(n1,mu1,sig1),-mag+2)
##}


##xbar1 = mean(sam1)
##xbar2 = mean(sam2)
##s1 = sd(sam1)
##s2 = sd(sam2)

### df2 = df = (s1^2/n1+s2^2/n2)^2/(s1^4/n1^2/(n1-1)+s2^4/n2^2/(n2-1))
##t = (xbar2-xbar1)/sqrt(s1^2/n1+s2^2/n2)
##if (abs(t)>tstar){wrd = 'yes'} else {wrd = 'no'}

##ps = c(1,0.2,0.1,0.05,0.04,0.02,0.01,0.005,0.004,0.002,0)
##pval = 2*(1-pt(abs(t),df))
##plow = max(ps[ps<pval])
##phigh= min(ps[ps>pval]) 

##pval
##plow
##phigh
