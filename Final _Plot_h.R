
rm(list=ls())
setwd("C:/Users/Medhat/Desktop/New Sim/RES/BGLR/h")

load("df_h_Ghat.RData")
load("df_h_cor.RData")
load("df_h_Pval.RData")


library(patchwork)
library(ggplot2)



tiff(file = "h.tiff", 
     res = 250, width = 2000, height = 3000)


df_h_Ghat$h           <- as.factor(df_h_Ghat$h)
df_h_Ghat$Pop         <- gsub('sel', 'Selected', df_h_Ghat$Pop)
df_h_Ghat$Pop         <- gsub('con', 'Controlled', df_h_Ghat$Pop)
colnames(df_h_Ghat)[2]<- "Population"


df_h_cor$h           <- as.factor(df_h_cor$h)
df_h_cor$Pop         <- gsub('sel', 'Selected', df_h_cor$Pop)
df_h_cor$Pop         <- gsub('con', 'Controlled', df_h_cor$Pop)
colnames(df_h_cor)[2]<- "Population"


df_h_Pval$h           <- as.factor(df_h_Pval$h)
df_h_Pval$Pop         <- gsub('sel', 'Selected', df_h_Pval$Pop)
df_h_Pval$Pop         <- gsub('con', 'Controlled', df_h_Pval$Pop)
colnames(df_h_Pval)[2]<- "Population"


p1 <- ggplot(df_h_Ghat, aes(x=h, y=Ghat, fill=Population))+
  scale_x_discrete(labels=c("1" = "0.1", 
                            "2" = "0.2",
                            "3" = "0.3",
                            "4" = "0.4",
                            "5" = "0.5",
                            "6" = "0.6",
                            "7" = "0.7",
                            "8" = "0.8",
                            "9" = "0.9",
                            "95"= "0.95"))+
  
  geom_boxplot()+
  scale_fill_manual(values=c("#9ecae1" , "#3182bd")) + 
  theme_classic()+
  labs(title="A- The Effect of Heritability on Ghat",
       x="Heritability", y = "Ghat")



p2 <- ggplot(df_h_cor, aes(x=h, y=Corr, fill=Population))+
  scale_x_discrete(labels=c("1" = "0.1", 
                            "2" = "0.2",
                            "3" = "0.3",
                            "4" = "0.4",
                            "5" = "0.5",
                            "6" = "0.6",
                            "7" = "0.7",
                            "8" = "0.8",
                            "9" = "0.9",
                            "95"= "0.95"))+
  
  geom_boxplot()+
  scale_fill_manual(values=c("#a1d99b", "#31a354")) + 
  theme_classic()+
  labs(title="B- The Effect of Heritability on Ghat-Correlation",
       x="Heritability", y = "Ghat-Correlation")



p3 <- ggplot(df_h_Pval, aes(x=h, y=Pval, fill=Population))+
  scale_x_discrete(labels=c("1" = "0.1", 
                            "2" = "0.2",
                            "3" = "0.3",
                            "4" = "0.4",
                            "5" = "0.5",
                            "6" = "0.6",
                            "7" = "0.7",
                            "8" = "0.8",
                            "9" = "0.9",
                            "95"= "0.95"))+
  
  geom_boxplot()+
  scale_fill_manual(values=c("#fc9272", "#de2d26")) + 
  theme_classic()+
  labs(title="C- The Effect of Heritability on Ghat-P.Values",
       x="Heritability", y = "-log10(p)")


p1 +p2 +p3 +plot_layout(ncol=1)

dev.off()

