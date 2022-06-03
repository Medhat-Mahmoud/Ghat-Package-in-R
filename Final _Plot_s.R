
rm(list=ls())
setwd("C:/Users/Medhat/Desktop/New Sim/RES/BGLR/s")

load("df_s_Ghat.RData")
load("df_s_Corr.RData")
load("df_s_Pval.RData")


library(patchwork)
library(ggplot2)


df_s_Ghat$q           <- as.factor(df_s_Ghat$q)
df_s_Ghat$Pop         <- gsub('sel', 'Selected', df_s_Ghat$Pop)
df_s_Ghat$Pop         <- gsub('con', 'Controlled', df_s_Ghat$Pop)
colnames(df_s_Ghat)[2]<- "Population"


df_s_Corr$q           <- as.factor(df_s_Corr$q)
df_s_Corr$Pop         <- gsub('sel', 'Selected', df_s_Corr$Pop)
df_s_Corr$Pop         <- gsub('con', 'Controlled', df_s_Corr$Pop)
colnames(df_s_Corr)[2]<- "Population"


df_s_Pval$q           <- as.factor(df_s_Pval$q)
df_s_Pval$Pop         <- gsub('sel', 'Selected', df_s_Pval$Pop)
df_s_Pval$Pop         <- gsub('con', 'Controlled', df_s_Pval$Pop)
colnames(df_s_Pval)[2]<- "Population"




tiff(file = "s.tiff", 
     res = 250, width = 2000, height = 3000)


p1 <- ggplot(df_s_Ghat, aes(x=q, y=Ghat, fill=Population))+
  scale_x_discrete(labels=c("1" = "50", 
                            "2" = "100",
                            "3" = "200",
                            "4" = "400",
                            "5" = "800",
                            "6" = "1600",
                            "7" = "3200",
                            "8" = "6400",
                            "9" = "12800",
                            "95"= "25600"))+
  
  geom_boxplot()+
  scale_fill_manual(values=c("#9ecae1" , "#3182bd")) + 
  theme_classic()+
  labs(title="A- The Effect of Sample Size on Ghat",
       x="Sample Size", y = "Ghat")



p2 <- ggplot(df_s_Corr, aes(x=q, y=Corr, fill=Population))+
  scale_x_discrete(labels=c("1" = "50", 
                            "2" = "100",
                            "3" = "200",
                            "4" = "400",
                            "5" = "800",
                            "6" = "1600",
                            "7" = "3200",
                            "8" = "6400",
                            "9" = "12800",
                            "95"= "25600"))+
  
  geom_boxplot()+
  scale_fill_manual(values=c("#a1d99b", "#31a354")) + 
  theme_classic()+
  labs(title="B- The Effect of Sample Size on Ghat-Correlation",
       x="Sample Size", y = "Ghat-Correlation")


p3 <- ggplot(df_s_Pval, aes(x=q, y=Pval, fill=Population))+
  scale_x_discrete(labels=c("1" = "50", 
                            "2" = "100",
                            "3" = "200",
                            "4" = "400",
                            "5" = "800",
                            "6" = "1600",
                            "7" = "3200",
                            "8" = "6400",
                            "9" = "12800",
                            "95"= "25600"))+
  
  geom_boxplot()+
  scale_fill_manual(values=c("#fc9272", "#de2d26")) + 
  theme_classic()+
  labs(title="C- The Effect of Sample Size on Ghat-P.Values",
       x="Sample Size", y = "-log10(p)")


p1 +p2 +p3 +plot_layout(ncol=1)

dev.off()

df_s_Pval$dd <- -log10(df_s_Pval$pval) 


