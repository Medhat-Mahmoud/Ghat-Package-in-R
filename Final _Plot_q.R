
rm(list=ls())
setwd("C:/Users/Medhat/Desktop/New Sim/RES/BGLR/q")
library(patchwork)
library(ggplot2)



load("df_q_Ghat.RData")
load("df_q_Corr.RData")
load("df_q_Pval.RData")



df_q_Ghat$q           <- as.factor(df_q_Ghat$q)
df_q_Ghat$Pop         <- gsub('sel', 'Selected', df_q_Ghat$Pop)
df_q_Ghat$Pop         <- gsub('con', 'Controlled', df_q_Ghat$Pop)
colnames(df_q_Ghat)[2]<- "Population"


df_q_Corr$q           <- as.factor(df_q_Corr$q)
df_q_Corr$Pop         <- gsub('sel', 'Selected', df_q_Corr$Pop)
df_q_Corr$Pop         <- gsub('con', 'Controlled', df_q_Corr$Pop)
colnames(df_q_Corr)[2]<- "Population"


df_q_Pval$q           <- as.factor(df_q_Pval$q)
df_q_Pval$Pop         <- gsub('sel', 'Selected', df_q_Pval$Pop)
df_q_Pval$Pop         <- gsub('con', 'Controlled', df_q_Pval$Pop)
colnames(df_q_Pval)[2]<- "Population"





tiff(file = "q.tiff", 
     res = 250, width = 2000, height = 3000)



p1 <- ggplot(df_q_Ghat, aes(x=q, y=Ghat, fill=Population))+
  scale_x_discrete(labels=c("1" = "30", 
                            "2" = "60",
                            "3" = "120",
                            "4" = "240",
                            "5" = "480",
                            "6" = "960",
                            "7" = "1920",
                            "8" = "3840",
                            "9" = "7680",
                            "95"= "15360"))+
  geom_boxplot()+
  scale_fill_manual(values=c("#9ecae1" , "#3182bd")) + 
  theme_classic()+
  labs(title="A- The Effect of Number of QTL on Ghat",
       x="Number of QTL", y = "Ghat")



p2 <- ggplot(df_q_Corr, aes(x=q, y=Corr, fill=Population))+
  scale_x_discrete(labels=c("1" = "30", 
                            "2" = "60",
                            "3" = "120",
                            "4" = "240",
                            "5" = "480",
                            "6" = "960",
                            "7" = "1920",
                            "8" = "3840",
                            "9" = "7680",
                            "95"= "15360"))+
  geom_boxplot()+
  scale_fill_manual(values=c("#a1d99b", "#31a354")) + 
  theme_classic()+
  labs(title="B- The Effect of Number of QTL on Ghat-Correlation",
       x="Number of QTL", y = "Ghat-Correlation")



p3 <- ggplot(df_q_Pval, aes(x=q, y=Pval, fill=Population))+
  scale_x_discrete(labels=c("1" = "30", 
                            "2" = "60",
                            "3" = "120",
                            "4" = "240",
                            "5" = "480",
                            "6" = "960",
                            "7" = "1920",
                            "8" = "3840",
                            "9" = "7680",
                            "95"= "15360"))+
  geom_boxplot()+
  scale_fill_manual(values=c("#fc9272", "#de2d26")) + 
  theme_classic()+
  labs(title="C- The Effect of Number of QTL on Ghat-P.Values",
       x="Number of QTL", y = "-log10(p)")


p1 +p2 +p3 +plot_layout(ncol=1)

dev.off()

