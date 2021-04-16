# Postwork06

# Importe el conjunto de datos match.data.csv
matchData <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-con-R-Santander/master/Sesion-06/Postwork/match.data.csv")

# Agrega una nueva columna sumagoles que contenga la suma de goles por partido.
matchData$sumagoles <- apply (matchData[  ,  c(3,5)], 1, sum)

# Obtén el promedio por mes de la suma de goles.
str(matchData)
class(matchData$date)

matchData <- rename(matchData, Fecha = date)
# matchData <- mutate(matchData, Fecha = as.Date(Fecha, "%y/%m/%d"))
matchData <- mutate(matchData, Fecha = as.Date(Fecha))

class(matchData$Fecha)

#matchData %>%
#  group_by(year(Fecha), month(Fecha)) %>%
#  summarise(Sumas = sum(sumagoles))

matchData %>%
  group_by(month(Fecha)) %>%
  summarise(Promedio = mean(sumagoles))

# Crea la serie de tiempo del promedio por mes de la suma de goles hasta 
# diciembre de 2019.

matchData2019 <- filter(matchData, year(Fecha) < 2020)

stMatchData <- 
  ts(matchData2019$sumagoles, #selecciono la columna de PromedioMensual. 
     frequency = 12,                #La series es mensual, 12 puntos de datos.   
     start=c(2010, 8),              #Inicio de la serie como vector c(año, mes)
     end=c(2019, 12))               #Fin de la serie

class(stMatchData)

# Grafica la serie de tiempo.

plot(stMatchData, ylab = "sumagoles", xlab = "Tiempo", 
     main = "Goles", 
     sub = "Liga Española")
