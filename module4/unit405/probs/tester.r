rej = 0
ret = 0

for (i in 1:10000)
{
alpha = sample(c(0.1,0.05,0.025,0.02,0.01),1)
zstar = qnorm(alpha)
azs = abs(zstar)

dis = 0.3
dis2 = 2*dis/3

while(T){
    p = round(runif(1,0.09,0.91),3)
    n = sample(1:10,1) * 10^sample(0:3,1)
    se = signif(sqrt(p*(1-p)/n),3)
    if (n*p>10 & n*(1-p)>10 & sqrt(n*p*(1-p))>7)
    {
        break
    }
}
z = round(runif(1,azs-dis2,azs+dis),2) * sample(c(-1,-1,-1,-1,-1,1),1)
phat = signif(p+z*se,3)
z = round((phat-p)/se,2)
Pr = round(pnorm(z),4)
wrd = sample(c('sad','angry','special','greedy','bad','great','strong','happy','popular','cold'),1)
wrd2 = sample(c('less than', 'under', 'below'),1)

if (Pr<alpha)
{
    wrd3 = 'reject'
    sym = '<'
    rej = rej+1
} else {
    wrd3 = 'retain'
    sym = '>'
    ret = ret+1
}

}

rej
ret
