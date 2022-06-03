rm(list=ls())
setwd("D:/OWC/GHAT/Final_for_man/Ghat")
#options(scipen = 9, stringsAsFactors = F)
#load("c_plot.RData")
#load("pv_plot.RData")
library(corrplot)

c1  <- read.delim("case1_cor.txt")
rownames(c1) <- c1[,1]
c1  <- c1[c(3,1,5,7,6,10,8,12,11,
            4,13,14,15,9,2),]
c1 <- as.matrix(c1[,2:7])


pv1 <- read.delim("case1_pv.txt")
rownames(pv1) <- pv1[,1]
pv1  <- pv1[c(3,1,5,7,6,10,8,12,11,
            4,13,14,15,9,2),]
pv1 <- as.matrix(pv1[,2:7])

p_value <- function(x, ndp=1)
{
  out <- format(signif(x,ndp),
                ns=ndp,
                scientific= TRUE,
                digits = 2,
                na.encode = FALSE, 
                just="centre")
  ifelse(out=="0.0","<0.01", out)
}


png("case_1.png", height=6500,width=4000, 
    pointsize=80)

corrplot(c1,
         #mar = c(0, 0, 0, 4),
         method       = "ellipse",
         type         = "full",
         is.corr      = TRUE,
         #p.mat       = pv, 
         #sig.level   = -0.1, 
         pch          = "*", 
         pch.cex      = 1.5, 
         pch.col      = "black", 
         insig        = "p-value", 
         tl.cex       = 1.2, 
         tl.col       = "black",
         #tl.pos       = "n", 
         tl.srt       = 45, 
         addgrid.col  = "black", 
         #type        = "lower", 
         #cl.pos      = "r", 
         #cl.cex      = 6, 
         #cl.ratio    = 0.4, 
         #diag        = T, 
         #plotCI      ="square", 
         #lowCI.mat   =lowCI, 
         #uppCI.mat   =uppCI,
         na.label = " "
)

pos <- expand.grid(1:ncol(pv1), nrow(pv1):1)
text(pos, t(p_value(pv1)))


dev.off()
