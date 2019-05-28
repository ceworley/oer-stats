rout = 3 #inches

pdf("spinner.pdf",width=2*rout,height=2*rout,paper="letter",title = "Spinner") 
par(mar = c(0,0,0,0))
plot.new()
fig.align="center"

xc = 0.5
yc = 0.5
r1 = 0.25
r1t= 0.15
s1a= 0.05
s1b= 0.03
cen = c(xc,yc)

for(ell in seq(0,1,0.01))
{
    angle = ell*2*pi
    x0 = xc+cos(angle)*(r1-s1b)
    y0 = yc+sin(angle)*(r1-s1b)
    x1 = xc+cos(angle)*(r1+s1b)
    y1 = yc+sin(angle)*(r1+s1b)
    segments(x0,y0,x1,y1)
}

for(ell in seq(0,0.9,0.1))
{
    angle = ell*2*pi
    x0 = xc+cos(angle)*(r1-s1a)
    y0 = yc+sin(angle)*(r1-s1a)
    x1 = xc+cos(angle)*(r1+s1a)
    y1 = yc+sin(angle)*(r1+s1a)
    segments(x0,y0,x1,y1,lwd=2)
    xt = xc+cos(angle)*(r1t)
    yt = yc+sin(angle)*(r1t) 
    text(xt,yt,ell)
}

r2 = 0.4
r2t = 0.48

for(z in seq(-3,3,1))
{
    ell = pnorm(z)
    angle = ell*2*pi
    x0 = xc+cos(angle)*(r2-s1a)
    y0 = yc+sin(angle)*(r2-s1a)
    x1 = xc+cos(angle)*(r2+s1a)
    y1 = yc+sin(angle)*(r2+s1a)
    segments(x0,y0,x1,y1,lwd=2)
    xt = xc+cos(angle)*(r2t)
    yt = yc+sin(angle)*(r2t) 
}

for(z in seq(-2,2,0.5))
{
    ell = pnorm(z)
    angle = ell*2*pi
    xt = xc+cos(angle)*(r2t)
    yt = yc+sin(angle)*(r2t)
    text(xt,yt,z) 
}
text(xc+r2t,yc+0.013,"-3")
text(xc+r2t,yc-0.013,"3")


for(z in seq(-3,3,0.1))
{
    ell = pnorm(z)
    angle = ell*2*pi
    x0 = xc+cos(angle)*(r2-s1b)
    y0 = yc+sin(angle)*(r2-s1b)
    x1 = xc+cos(angle)*(r2+s1b)
    y1 = yc+sin(angle)*(r2+s1b)
    segments(x0,y0,x1,y1)
}
for(z in seq(-1,1,0.01))
{
    ell = pnorm(z)
    angle = ell*2*pi
    x0 = xc+cos(angle)*(r2-s1b/2)
    y0 = yc+sin(angle)*(r2-s1b/2)
    x1 = xc+cos(angle)*(r2+s1b/2)
    y1 = yc+sin(angle)*(r2+s1b/2)
    segments(x0,y0,x1,y1,lwd=0.5)
}



dev.off()
