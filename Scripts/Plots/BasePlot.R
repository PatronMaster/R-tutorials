install.packages("swirl")
packageVersion("swirl")
library(swirl)
install_from_swirl("Exploratory Data Analysis")

library(swirl)
swirl()
#https://github.com/DataScienceSpecialization/courses/
#www.edwardtufte.com



#commands
quantile(ppm)
boxplot(ppm,col = "blue")
abline(h = 12)
hist(ppm,col="green")
rug(ppm) #adicionar linhas por baixo

abline(v=12, lwd=2)# lwd linha tamanho
barplot(height = reg,col="wheat",main = "Number of Counties in Each Region") #col é a cor
boxplot(pm25 ~region,data = pollution,col ="red")#por duas variaveis no mesmo gráfico

east <- subset(pollution,region=="east")#SAME AS pollution[pollution$region=="east",]

with(pollution,plot(latitude,pm25)) #SAME AS with(pollution,plot(latitude,pm25))

?Devices # ver aouptupt devices
dev.cur() #onde está a mostrar o gráfico RStudioGD 2 ou pdf 4
pdf(file="myplot.pdf")
dev.off() #desligar o pdf e voltar ao screem para gravar o ficheiro tem que fechar
dev.copy(device = png,file="geyserplot.png")#copiar um gráfico para imagem não recomendado

#Example
svg(file="myplot.sgv") #Scalable vector graphics
with(faithful, plot(eruptions, waiting,main = "Old Faithful Geyser data2"))
with(faithful, plot(eruptions, waiting,main = "Old Faithful Geyser data"))
dev.off()

#Example
cairo_pdf(file="myplot2.pdf",onefile=TRUE) #Scalable vector graphics
with(faithful, plot(eruptions, waiting,main = "Old Faithful Geyser data2"))
with(faithful, plot(eruptions, waiting,main = "Old Faithful Geyser data"))
dev.off()

#Ploting System in R---------
text(x = mean(cars$speed),y = max(cars$dist),labels = "SWIRL rules")

library(lattice)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4, 1)) # muito bom x é Life, y Icoming, e numero gráfios por região

library(ggplot2)
qplot(x = displ,y = hwy,data = mpg)

#Base Plotting System ----------
range(airquality$Ozone,na.rm = TRUE) #range returns a vector containing the minimum and maximum of all the given arguments.
boxplot(Ozone~Month, airquality) #5 boxplot um para cada mes
boxplot(Ozone~Month, airquality,xlab ="Month",ylab="Ozone (ppb)",col.axis="blue",col.lab="red") 
title(main = "Ozone and Wind in New York City")"add title"

length(par()) # ver argumentos da função quantos tem
par("pch") #podes ver as opcões do pch

plot(airquality$Wind,airquality$Ozone,type = "n")# This tells R to set up the plot but not to put the data in it
may <- subset(airquality, Month==5) #subset
points(may$Wind,may$Ozone,col="blue",pch=17) #fazer gráfico
legend("topright",pch=c(17,8),col=c("blue","red"),legend=c("May","Other Months"))
abline(v=median(airquality$Wind),lty=2,lwd = 2)

mtext(text =  "Ozone and Weather in New York City",outer = TRUE)# fazer pairs e por texto em cima
