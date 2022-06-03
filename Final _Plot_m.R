
rm(list=ls())
setwd("D:/OWC/GHAT/New Sim/RES/BGLR/m")

load("df_m_Ghat.RData")
load("df_m_Corr.RData")
load("df_m_Pval.RData")


library(patchwork)
library(ggplot2)


df_m_Ghat$q           <- as.factor(df_m_Ghat$q)
df_m_Ghat$Pop         <- gsub('sel', 'Selected', df_m_Ghat$Pop)
df_m_Ghat$Pop         <- gsub('con', 'Controlled', df_m_Ghat$Pop)
colnames(df_m_Ghat)[2]<- "Population"


df_m_Corr$q           <- as.factor(df_m_Corr$q)
df_m_Corr$Pop         <- gsub('sel', 'Selected', df_m_Corr$Pop)
df_m_Corr$Pop         <- gsub('con', 'Controlled', df_m_Corr$Pop)
colnames(df_m_Corr)[2]<- "Population"


df_m_Pval$q           <- as.factor(df_m_Pval$q)
df_m_Pval$Pop         <- gsub('sel', 'Selected', df_m_Pval$Pop)
df_m_Pval$Pop         <- gsub('con', 'Controlled', df_m_Pval$Pop)
colnames(df_m_Pval)[2]<- "Population"




tiff(file = "m2.tiff", 
     res = 250, width = 2000, height = 3000)


p1 <- ggplot(df_m_Ghat, aes(x=q, y=Ghat, fill=Population))+
  scale_x_discrete(labels=c("1" = "30", 
                            "2" = "300",
                            "3" = "3000",
                            "4" = "30000",
                            "5" = "60000",
                            "6" = "120000",
                            "7" = "240000",
                            "8" = "480000",
                            "9" = "960000",
                            "95"= "1920000"))+
  
  geom_boxplot()+
  scale_fill_manual(values=c("#9ecae1" , "#3182bd")) + 
  theme_classic()+
  labs(title="A- The Effect of Market Density on Ghat",
       x="Market Density", y = "Ghat")



p2 <- ggplot(df_m_Corr, aes(x=q, y=Corr, fill=Population))+
  scale_x_discrete(labels=c("1" = "30", 
                            "2" = "300",
                            "3" = "3000",
                            "4" = "30000",
                            "5" = "60000",
                            "6" = "120000",
                            "7" = "240000",
                            "8" = "480000",
                            "9" = "960000",
                            "95"= "1920000"))+
  
  geom_boxplot()+
  scale_fill_manual(values=c("#a1d99b", "#31a354")) + 
  theme_classic()+
  labs(title="B- The Effect of Market Density on Ghat-Correlation",
       x="Market Density", y = "Ghat-Correlation")


p3 <- ggplot(df_m_Pval, aes(x=q, y=l, fill=Population))+
  scale_x_discrete(labels=c("1" = "30", 
                            "2" = "300",
                            "3" = "3000",
                            "4" = "30000",
                            "5" = "60000",
                            "6" = "120000",
                            "7" = "240000",
                            "8" = "480000",
                            "9" = "960000",
                            "95"= "1920000"))+
  
  geom_boxplot()+
  scale_fill_manual(values=c("#fc9272", "#de2d26")) + 
  theme_classic()+
  labs(title="C- The Effect of Market Density on Ghat-P.Values",
       x="Market Density", y = "-log10(p)")


p1 +p2 +p3 +plot_layout(ncol=1)

dev.off()
