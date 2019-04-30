images = c("bike",
           "cat",
           "dog",
           "flower",
           "gem",
           "horn",
           "pig",
           "shovel",
           "tree",
           "wheel")
colors = c("red","orange","yellow","green","blue","indigo","violet","white",
           "black","teal","pink","gray")
ni = sample(2:5,1)
nc = sample(2:5,1)
is = sort(sample(images,ni))
cs = sort(sample(colors,nc))

nums = matrix(sample(10:99,ni*nc),ni)
tot = sum(nums)


#marginal image
i1 = sample(1:ni,1)
p1 = signif(sum(nums[i1,])/tot,3)
t1 = paste0("What is the probability a random card is a ",is[i1],"?",sep="")
numer1 = paste(nums[i1,],collapse="+")
denom1 = paste(tot)
ex1 = paste0("$P(\\text{",is[i1],"})$",sep="")

#marginal color
c2 = sample(1:nc,1)
p2 = signif(sum(nums[,c2])/tot,3)
t2 = paste0("What is the probability a random card is ",cs[c2],"?",sep="")
numer2 = paste(nums[,c2],collapse="+")
denom2 = paste(tot)
ex2 = paste0("$P(\\text{",cs[c2],"})$",sep="")

#joint
i3 = sample(1:ni,1)
c3 = sample(1:nc,1)
p3 = signif(nums[i3,c3]/tot,3)
t3 = paste0("What is the probability a random card is both a ",
            is[i3]," and ",cs[c3],"?",sep="")
numer3 = paste(nums[i3,c3])
denom3 = paste(tot)
ex3 = paste0("$P(\\text{",is[i3]," and ",cs[c3],"})$",sep="")

#disjoint
i4 = sample(1:ni,1)
c4 = sample(1:nc,1)
p4 = signif((sum(nums[i4,])+sum(nums[,c4])-nums[i4,c4])/tot,3)
t4 = paste0("What is the probability a random card is either a "
            ,is[i4]," or ",cs[c4],"?",sep="")
numer4 = paste(paste(c(nums[i4,],nums[,c4]),collapse="+"),
               nums[i4,c4],sep="-")
denom4 = paste(tot)
ex4 = paste0("$P(\\text{",is[i4]," or ",cs[c4],"})$",sep="")

#conditioned on image
i5 = sample(1:ni,1)
c5 = sample(1:nc,1)
p5 = signif(nums[i5,c5]/sum(nums[i5,]),3)
t5 = paste0("What is the probability a random card is ",
            cs[c5]," given it is a ",is[i5],"?",sep="")
numer5 = paste(nums[i5,c5])
denom5 = paste(nums[i5,],collapse="+")
ex5 = paste0("$P(\\text{",cs[c5]," given ",is[i5],"})$",sep="")

#conditioned on color
i6 = sample(1:ni,1)
c6 = sample(1:nc,1)
p6 = signif(nums[i6,c6]/sum(nums[,c6]),3)
t6 = paste0("What is the probability a random card is ",
            is[i6]," given it is a ",cs[c6],"?",sep="")
numer6 = paste(nums[i6,c6])
denom6 = paste(nums[,c6],collapse="+")
ex6 = paste0("$P(\\text{",is[i6]," given ",cs[c6],"})$",sep="")

ts = c(t1,t2,t3,t4,t5,t6)
ps = c(p1,p2,p3,p4,p5,p6)
numers = c(numer1,numer2,numer3,numer4,numer5,numer6)
denoms = c(denom1,denom2,denom3,denom4,denom5,denom6)
exs = c(ex1,ex2,ex3,ex4,ex5,ex6)
ord = sample(1:6)

tt = ts[ord]
pp = ps[ord]
nn = numers[ord]
dd = denoms[ord]
ee = exs[ord]

paste(cs,collapse=' | ')
s = ""
for(i in 1:ni)
{
    s = paste(s,"\\n","|",paste(c(is[i],paste(nums[i,],sep=" | ")),collapse=" | "),"|",collapse="") 
}
s
