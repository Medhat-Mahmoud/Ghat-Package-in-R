
setwd("C:/Users/User/ownCloud/GHAT/Finalll")
library(ggpubr)
rm(list=ls())

load("data_ci_3.RData")


colnames(data)[5] <- "Years"

A <- data[grepl(c("Grain|Harvest|Radiation"), data$Traits), ]

B <- data[grepl(c("Above-ground|sqm|Thousand-kernel"), 
                data$Traits), ]

C <- data[grepl(c("Crude|Protein|Nitrogen"), data$Traits), ]

D <- data[grepl(c("height|spike|Resistance"), data$Traits), ]


labels <- c("1970" = "1966-1975", "1980" = "1976-1985", 
            "1990" = "1986-1995", "2000" = "1996-2005", 
            "2010" = "2006-2015")


jpeg(filename = "New_x.jpg", 
     width = 6000, height = 10000 ,
     units = "px", pointsize = 50, quality = 10000,
     bg = "white", res = 700, family = "", 
    restoreConsole = TRUE,
     type = c("windows", "cairo"))


########################
########################

rm(p1)


p1 <- ggplot(data = A,
            mapping = aes(x = Years, y = Selection_Direction,
                          ymin = clow,
                          ymax = cupp,
                          group = Traits, color = Traits))+ 
  geom_pointrange(position = position_dodge(width = 3))+
  
  labs(x = "Years", y = "Ghat Correlation", fill = "Traits")+
  
  ggtitle("Yield parameters traits") +
  
  # geom_point(alpha= 0.7) +

  scale_size(range = c(10, 50), 
             name="P-values", guide=FALSE) +
  
  #scale_color_viridis(discrete=TRUE, name = "Traits:", option="A") +
  scale_color_brewer(type = "qual", palette = "PuOr") +
  
  facet_grid(. ~ Years, scales = "free", 
             labeller=labeller(Years = labels),switch = "both")+
  
  scale_x_continuous(breaks = c(1970,1980,1990,
                                2000,2010),
                     labels = c("1966-1975","1976-1985","1986-1995",
                                "1995-2005","2005-2010"))+
  
  geom_hline(yintercept=0, linetype="dashed", color = "red")+
  
  labs(fill = "P-valuessss")+
  theme_minimal(base_size = 20)+ 
  theme_bw()+
  
  theme(
    plot.title = element_text(size = 14,hjust = 0.5,
                family="Montserrat", face = "bold"),
    text=element_text(family="Montserrat"),
    axis.text.x  = element_blank(),
    axis.text.y  = element_text(colour="black", size = 12),
    axis.title   = element_text(size=12,face="bold"),
    
    legend.position="bottom",
    
    legend.key.height = unit(0.0001, "cm"),
    legend.spacing.x = unit(0.1, 'cm'),
    
    legend.title=element_text(size=12), 
    legend.text=element_text(size=10))+

    guides(color=guide_legend(override.aes=list(size=0.8)))

p1

########################
########################

p2 <- ggplot(data = B,
            mapping = aes(x = Years, y = Selection_Direction,
                          ymin = clow,
                          ymax = cupp,
                          group = Traits, color = Traits))+ 
  
  geom_pointrange(position = position_dodge(width = 3))+
  
  labs(x = "Years", y = "Ghat Correlation", fill = "Traits")+
  
  ggtitle("Biomass parameters traits") +
  
  # geom_point(alpha= 0.7) +
  
  scale_size(range = c(10, 50), 
             name="P-values", guide=FALSE) +
  #scale_color_viridis(discrete=TRUE, name = "Traits:", option="B") +
  scale_color_brewer(type = "qual", palette = "Set1") +
  
  facet_grid(. ~ Years, scales = "free", 
             labeller=labeller(Years = labels),switch = "both")+
  
  scale_x_continuous(breaks = c(1970,1975,1980,
                                1985,1990,1995,
                                2000,2005,2010),
                     labels = c("1966-1970", "1970-1975","1975-1980",
                                "1980-1985","1985-1990","1990-1995",
                                "1995-2000","2000-2005","2005-2010"))+
  
  geom_hline(yintercept=0, linetype="dashed", color = "red")+
  
  labs(fill = "P-valuessss")+
  theme_minimal(base_size = 20)+ 
  theme_bw()+
  
  theme(
    plot.title = element_text(size = 14,hjust = 0.5,
                              family="Montserrat", face = "bold"),
    text=element_text(family="Montserrat"),
    axis.text.x  = element_blank(),
    axis.text.y  = element_text(colour="black", size = 12),
    axis.title   = element_text(size=12,face="bold"),
    
    legend.position="bottom",
    legend.key.height = unit(0.0001, "cm"),
    legend.spacing.x = unit(0.1, 'cm'),
    legend.title=element_text(size=12), 
    legend.text=element_text(size=10))+
  guides(color=guide_legend(override.aes=list(size=0.8)))


########################
########################

p3 <- ggplot(data = C,
            mapping = aes(x = Years, y = Selection_Direction,
                          ymin = clow,
                          ymax = cupp,
                          group = Traits, color = Traits))+ 
  
  geom_pointrange(position = position_dodge(width = 3))+
  
  labs(x = "Years", y = "Ghat Correlation", fill = "Traits")+
  
  ggtitle("Quality parameters traits") +
  
  # geom_point(alpha= 0.7) +
  
  scale_size(range = c(10, 50), 
             name="P-values", guide=FALSE) +
  #scale_color_viridis(discrete=TRUE, name = "Traits:", option="D") +
  scale_color_brewer(type = "qual", palette = "Dark2") +
  
  facet_grid(. ~ Years, scales = "free", 
             labeller=labeller(Years = labels),switch = "both")+
  
  scale_x_continuous(breaks = c(1970,1975,1980,
                                1985,1990,1995,
                                2000,2005,2010),
                     labels = c("1966-1970", "1970-1975","1975-1980",
                                "1980-1985","1985-1990","1990-1995",
                                "1995-2000","2000-2005","2005-2010"))+
  
  geom_hline(yintercept=0, linetype="dashed", color = "red")+
  
  labs(fill = "P-valuessss")+
  theme_minimal(base_size = 20)+ 
  theme_bw()+
  
  theme(
    plot.title = element_text(size = 14,hjust = 0.5,
                              family="Montserrat", face = "bold"),
    text=element_text(family="Montserrat"),
    axis.text.x  = element_blank(),
    axis.text.y  = element_text(colour="black", size = 12),
    axis.title   = element_text(size=12,face="bold"),
    
    legend.position="bottom",
    legend.key.height = unit(0.0001, "cm"),
    legend.spacing.x = unit(0.1, 'cm'),
    legend.title=element_text(size=12), 
    legend.text=element_text(size=10))+
  guides(color=guide_legend(override.aes=list(size=0.8)))

#####################
#####################

p4 <- ggplot(data = D,
            mapping = aes(x = Years, y = Selection_Direction,
                          ymin = clow,
                          ymax = cupp,
                          group = Traits, color = Traits))+ 
  
  geom_pointrange(position = position_dodge(width = 3))+
  
  labs(x = "Years", y = "Ghat Correlation", fill = "Traits")+
  
  ggtitle("Morphological and disease resistance traits") +
  
  # geom_point(alpha= 0.7) +
  
  scale_size(range = c(10, 50), 
             name="P-values", guide=FALSE) +
  #scale_color_viridis(discrete=TRUE, name = "Traits:", option="D")+
  scale_color_brewer(type = "qual", palette = "Paired") +
  
  facet_grid(. ~ Years, scales = "free", 
             labeller=labeller(Years = labels),switch = "both")+
  
  scale_x_continuous(breaks = c(1970,1975,1980,
                                1985,1990,1995,
                                2000,2005,2010),
                     labels = c("1966-1970", "1970-1975","1975-1980",
                                "1980-1985","1985-1990","1990-1995",
                                "1995-2000","2000-2005","2005-2010"))+
  
  geom_hline(yintercept=0, linetype="dashed", color = "red")+
  
  labs(fill = "P-valuessss")+
  theme_minimal(base_size = 20)+ 
  theme_bw()+
  
  theme(
    plot.title = element_text(size = 14,hjust = 0.5,
                              family="Montserrat", face = "bold"),
    text=element_text(family="Montserrat"),
    axis.text.x  = element_blank(),
    axis.text.y  = element_text(colour="black", size = 12),
    axis.title   = element_text(size=12,face="bold"),
    
    legend.position="bottom",
    legend.key.height = unit(0.0001, "cm"),
    legend.spacing.x = unit(0.1, 'cm'),
    legend.title=element_text(size=12), 
    legend.text=element_text(size=10))+
  guides(color=guide_legend(override.aes=list(size=0.8)))

#####################
#####################


## all in one

figure <- ggarrange(p1, p2, p3, p4, ncol = 1, 
          labels = c("A","B", "C", "D"),nrow = 4)

annotate_figure(figure, top = text_grob("50 Years of Wheat Breeding ", 
                        color = "black", face = "bold", size = 16))


dev.off()

