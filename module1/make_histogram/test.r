shape1 = 2**runif(1,-1,1)
shape2 = 2**runif(1,-1,1)
n = sample(7:15,1)
scale = 10^sample(-2:3,1)
offset = runif(1,0,10)*scale
data = signif(rbeta(n,shape1,shape2)*scale + offset,3)
print(data)
h = hist(data,density=20)
h$breaks
for(i in 1:length(h$counts))
{
    print(paste(c('| $', h$breaks[i], '< X <', h$breaks[i+1], '$| ', h$counts[i], ' |'),collapse=''))
}
