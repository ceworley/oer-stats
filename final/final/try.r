while(T)
{
alpha = sample(c(0.2,0.1,0.05,0.04,0.02,0.01,0.005),1)
zstar = qnorm(1-alpha/2)
while(T)
{

    z = round(zstar + runif(1,0.1,0.3),2)*sample(c(-1,1),1)
    p1 = round(runif(1,0.05,0.95),3)
    n1 = sample(16:300,1)
    n2 = abs(n1+sample((-60:40),1))+10
    p2 = round((n2*(z*sqrt(n2^2*(z^2+n1*(4*p1-4*p1^2))
               +n1^2*n2*(4*p1-4*p1^2))
               +n1*(z^2-2*p1*z^2)+2*n1^2*p1)
               +n1*z*sqrt(n2^2*(z^2+n1*(4*p1-4*p1^2))
               +n1^2*n2*(4*p1-4*p1^2))
               +n2^2*(z^2+2*n1*p1))
               /(n2^2*(2*z^2+2*n1)+2*n1^2*n2),3)
    pp = (p1*n1+p2*n2)/(n1+n2)
    se = signif(sqrt(pp*(1-pp)/n1+pp*(1-pp)/n2),3)
    is_norm = (pp*(n1+n2)>10 & (1-pp)*(n1+n2)>10)
    sss1 = c(z,p1,n1,p2,n2,pp,se)
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
    pval = 2*round(pnorm(-abs(z)),4)
    if (pval < alpha)
    {
        wrd = "yes"
        rwrd = "reject"
        sym = "<"
        wrd2 = ""
    } else {
        wrd = "no"
        rwrd = "retain"
        sym = ">"
        wrd2 = "not"
    }
    if(is_norm & se>0.005 & p2>=0 & p2<=1 & abs(z)<2.8 & abs(abs(z)-zstar)<0.3 & abs(abs(z)-zstar)>0.03 & f1>3 & s1>3 & f2>3 & s2>3)
    {
        break
    }
}

adj = sample(c("cold","angry","sorry","abysmal","glossy",
               "happy", "sick", "green", "pink","organic",
               "fluorescent", "folksy", "reclusive", "omnivorous",
               "special"), 1)
if(s1==0 | s2==0 | f1==0 | f2==0)
{
    print(sss1)
}
}
