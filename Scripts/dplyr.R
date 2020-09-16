library(tidyverse)
require(data.table)


#1.0 -Read All Files #################
files<-paste0("directory",list.files("directory/"))
PM <- rbindlist(lapply(files, fread))

#1.1 -Summarise some Col #################
PM %>% 
  group_by(`Short name`) %>% 
  summarise(
    n=n(),
    Is_Missing_A =sum(is.na(as.numeric(A))),
    Is_Missing_B =sum(is.na(as.numeric(B))),
    ) -> Missing


# Sum of NAs by column
Missing_all_colums<-apply(PM,2,function(x) sum(is.na(x)))


#1.2 -Filter the collums #################
Missing %>% 
  filter(
    Is_Missing_A < 10,
    Is_Missing_B < 10
  ) -> Missing_less_than_10


#1.3 -Sort    #################
Missing %>% 
  arrange(desc(Is_Missing_A))-> Missing

#1.4 -Sum All numeric #################
Missing %>%
  select_if(is.numeric) %>%
  map_dbl(sum)-> Total

#1.5 -Plot all missing data #################
Total<-as.data.frame(Total)
Total$names<-row.names(Total)

Total %>% 
  mutate(percentage = (1-(Total/2720844))*100) %>% 
  arrange(desc(percentage))->Total

theme_set(theme_bw())
ggplot(data = B,aes(x=names, y = percentage))+
  geom_bar(stat="identity", width=.5,fill="tomato3")+
  labs(title="Missing Data", 
       subtitle="All feactures ", 
       caption="source: Raw Data") + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6))
