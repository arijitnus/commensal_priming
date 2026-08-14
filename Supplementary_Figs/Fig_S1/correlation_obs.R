library(readxl)
library(ggplot2)
dat<-read_excel('/Users/arijitm/Documents/Phenotyping/germination/germination.xlsx',
                sheet = "coreel_obs",col_names = T,skip = 0)
dat<-as.data.frame(dat)
shapiro.test(c(dat$Ichiho,dat$Terry))# Not normal
cor.test(dat$Ichiho,dat$Terry,method = "spearman")

#cor= -0.716; p = 5.95e-11

p<-ggplot(dat,aes(x=Ichiho,y=Terry))+
  geom_point()+
  geom_smooth(method = 'lm')+
  labs(title = '',
       x='Observer 1',
       y="Observer 2")+
  theme_classic()+
  theme(axis.text.x = element_text(size = 16),
        axis.text.y = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        axis.title.x=element_text(size=16),
        axis.line = element_line(colour="black", size = 0.7),
        strip.background = element_blank())

p
ggsave(
  "correl_obs.tiff",
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 4,
  height = 6,
  units = "in",
  dpi = 400,
)
dev.off()




