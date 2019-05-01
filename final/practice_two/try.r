count = 0
for(i in 1:100)
{
while(T)
{
while(T)
{
## DATA GENERATION
## Rejects H0 about 55% of time...
mag = sample(0:3,1)
mu1 = signif(10^mag,3)
sig1 = signif(mu1*runif(1,0.03,0.3),3)
n1 = sample(8:40,1)
se1 = sig1/sqrt(n1)
sig2 = signif(mu1*runif(1,0.03,0.3),3)
n2 = sample(8:40,1)

##df = min(n1,n2)-1
## df = (sig1^2/n1+sig2^2/n2)^2/(sig1^4/n1^2/(n1-1)+sig2^4/n2^2/(n2-1))
df = floor((sig1^2/n1+sig2^2/n2)^2/(sig1^4/n1^2/(n1-1)+sig2^4/n2^2/(n2-1)))

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
}

xbar1 = signif(mean(sam1),3)
xbar2 = signif(mean(sam2),3)
s1 = signif(sd(sam1),3)
s2 = signif(sd(sam2),3)

df = floor((s1^2/n1+s2^2/n2)^2/(s1^4/n1^2/(n1-1)+s2^4/n2^2/(n2-1)))
tstar = round(qt(1-alpha/2,df),2)
se = round(sqrt(s1^2/n1+s2^2/n2),3)

bounds = c(xbar2-xbar1-tstar*se, xbar2-xbar1+tstar*se)
LB = min(bounds)
UB = max(bounds) 

t = round((xbar2-xbar1)/sqrt(s1^2/n1+s2^2/n2),2)
if (abs(t)>tstar)
{
    wrd = 'reject'
    sym = '>'
    sym2 = '<'
} else {
    wrd = 'retain'
    sym = '<'
    sym2 = '>'
}

ps = c(1,0.2,0.1,0.05,0.04,0.02,0.01,0.005,0.004,0.002,0)
pval = 2*(1-pt(abs(t),df))
plow = max(ps[ps<pval])
phigh= min(ps[ps>pval]) 

if(abs(abs(t)-tstar)<0.3 & abs(abs(t)-tstar)>0.04 & abs(t)<2.98)
{
    break
}
}

mag = sample(0:3,1)
mu1 = signif(10^mag,3)
sig1 = signif(mu1*runif(1,0.03,0.3),3)
n1 = sample(8:40,1)
se1 = sig1/sqrt(n1)
sig2 = signif(mu1*runif(1,0.03,0.3),3)
n2 = sample(8:40,1)

##df = min(n1,n2)-1
## df = (sig1^2/n1+sig2^2/n2)^2/(sig1^4/n1^2/(n1-1)+sig2^4/n2^2/(n2-1))
df = floor((sig1^2/n1+sig2^2/n2)^2/(sig1^4/n1^2/(n1-1)+sig2^4/n2^2/(n2-1)))

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
}

xbar1 = signif(mean(sam1),3)
xbar2 = signif(mean(sam2),3)
s1 = signif(sd(sam1),3)
s2 = signif(sd(sam2),3)

df = floor((s1^2/n1+s2^2/n2)^2/(s1^4/n1^2/(n1-1)+s2^4/n2^2/(n2-1)))
tstar = round(qt(1-alpha/2,df),2)
se = round(sqrt(s1^2/n1+s2^2/n2),3)

bounds = c(xbar2-xbar1-tstar*se, xbar2-xbar1+tstar*se)
LB = min(bounds)
UB = max(bounds) 

t = round((xbar2-xbar1)/sqrt(s1^2/n1+s2^2/n2),2)
if (abs(t)>tstar)
{
    wrd = 'reject'
    sym = '>'
    sym2 = '<'
} else {
    wrd = 'retain'
    sym = '<'
    sym2 = '>'
}

if(abs(abs(t)-tstar)<0.3 & abs(abs(t)-tstar)>0.04 & abs(t)<2.98)
{
    break
}
}
ps = c(1,0.2,0.1,0.05,0.04,0.02,0.01,0.005,0.004,0.002,0)
pval = 2*(1-pt(abs(t),df))
print(pval)
plow = max(ps[ps<=pval])
phigh= min(ps[ps>=pval]) 
count = count + (abs(t)>tstar)
}

count
warnings()
