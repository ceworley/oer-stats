alpha = sample(c(0.2,0.1,0.05,0.04,0.02,0.01,0.005),1)
zstar = qnorm(1-alpha/2)
z = round(zstar + runif(1,-0.3,0.3),2)
while(T)
{
    p1 = round(runif(1,0.01,0.99),3)
    n1 = sample(1:10,1)*10^sample(1:3,1)
    n2 = sample(1:10,1)*10^sample(1:3,1)     
    p2 = round((n2*(z*sqrt(n2^2*(z^2+n1*(4*p1-4*p1^2))
               +n1^2*n2*(4*p1-4*p1^2))
               +n1*(z^2-2*p1*z^2)+2*n1^2*p1)
               +n1*z*sqrt(n2^2*(z^2+n1*(4*p1-4*p1^2))
               +n1^2*n2*(4*p1-4*p1^2))
               +n2^2*(z^2+2*n1*p1))
               /(n2^2*(2*z^2+2*n1)+2*n1^2*n2), 3)
    pp = (p1*n1+p2*n2)/(n1+n2)
    se = signif(sqrt(pp*(1-pp)/n1+pp*(1-pp)/n2),3)
    is_norm = (pp*(n1+n2)>10 & (1-pp)*(n1+n2)>10)
    if(is_norm & se>0.005 & p2>=0 & p2<=1)
    {
        break
    }
}
s1 = round(n1*p1,0)
f1 = round(n1*(1-p1),0)
s2 = round(n2*p2,0)
f2 = round(n2*(1-p2),0)
n1 = s1+f1
n2 = s2+f2

p1 = signif(s1/n1,3)
p2 = signif(s2/n2,3)
pp = signif((s1+s2)/(n1+n2),3)
se = signif(sqrt(pp*(1-pp)/n1 + pp*(1-pp)/n2),3)

z = round(((p2-p1)-0)/se,2)
pval = 2*pnorm(-abs(z))
if (pval < alpha)
{
    wrd = 'yes'
    rwrd = 'reject'
} else {
    wrd = 'no'
    rwrd = 'retain'
}
adj = sample(c("cold","angry","sorry","abysmal",
               "happy", "preoccupied", "sick", "green",
               "fluorescent", "folksy", "reclusive", "omnivorous",
               "special"), 1)

pval
wrd
