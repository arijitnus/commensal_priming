library(readxl)
library(ggplot2)
dat<-read_excel('/Users/arijitm/Documents/Phenotyping/Sanya/Noco_conc_2/qPCR_conc2.xlsx',
                sheet = "correl_input",col_names = T,skip = 0)
dat<-as.data.frame(dat)

shapiro.test(c(dat$lgp,dat$Hpa_amt))
cor.test(dat$lgp,dat$Hpa_amt,method = "pearson")

#cor= -0.5563214; p = 0.0007

p<-ggplot(dat,aes(x=lgp,y=Hpa_amt))+
  geom_point()+
  geom_smooth(method = 'lm')+
  labs(title = '',
       x='Relative amount of Hpa Actin to Arabidopsis Actin',
       y=expression(paste(log[2]," green pixel ratio (d12/d0)")))+
  theme_classic()+
  theme(axis.text.x = element_text(size = 16),
        axis.text.y = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        axis.title.x=element_text(size=16),
        axis.line = element_line(colour="black", size = 0.7),
        strip.background = element_blank())

p
ggsave(
  "correl_conc2.tiff",
  plot = last_plot(),
  device = NULL,
  path = NULL,
  scale = 1,
  width = 6,
  height = 6,
  units = "in",
  dpi = 400,
)





