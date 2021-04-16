# Postwork02

suppressMessages(suppressWarnings(library(dplyr)))

# Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 
# 2019/2020 de la primera división de la liga española

csv1718 <-read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
csv1819 <-read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
csv1920 <-read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

#Obten una mejor idea de las características de los data frames al usar 
# las funciones: str, head, View y summary

str(csv1718)
head(csv1819)
#View(csv1920)
summary(csv1718)

# Con la función select del paquete dplyr selecciona únicamente las 
# columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR; esto para cada 
# uno de los data frames.

csv1718 <- select(csv1718, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
csv1819 <- select(csv1819, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)
csv1920 <- select(csv1920, Date, HomeTeam, AwayTeam, FTHG, FTAG, FTR)

# Asegúrate de que los elementos de las columnas correspondientes de 
# los nuevos data frames sean del mismo tipo 
# (Hint 1: use as.Date y mutate para arreglar las fechas). 

str(csv1718)
str(csv1819)
str(csv1920)

csv1718 <- rename(csv1718, Fecha = Date, Local = HomeTeam, Visita = AwayTeam)
csv1718 <- mutate(csv1718, Fecha = as.Date(Fecha, "%d/%m/%y"))

csv1819 <- rename(csv1819, Fecha = Date, Local = HomeTeam, Visita = AwayTeam)
csv1819 <- mutate(csv1819, Fecha = as.Date(Fecha, "%d/%m/%y"))

csv1920 <- rename(csv1920, Fecha = Date, Local = HomeTeam, Visita = AwayTeam)
csv1920 <- mutate(csv1920, Fecha = as.Date(Fecha, "%d/%m/%y"))

# Con ayuda de la función rbind forma un único data frame que contenga 
# las seis columnas mencionadas en el punto 3 (Hint 2: la función 
# do.call podría ser utilizada).

Scsv1718 <- rbind(csv1718, csv1819, csv1920)
