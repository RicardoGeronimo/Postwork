# Postwork05
# Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 
# 2019/2020 de la primera divisiÃ³n de la liga espaÃ±ola

csv1718 <-read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
csv1819 <-read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
csv1920 <-read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

# Con la funciÃ³n select del paquete dplyr selecciona Ãºnicamente las 
# columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR; esto para cada 
# uno de los data frames.

csv1718 <- select(csv1718, Date, HomeTeam, AwayTeam, FTHG, FTAG)
csv1819 <- select(csv1819, Date, HomeTeam, AwayTeam, FTHG, FTAG)
csv1920 <- select(csv1920, Date, HomeTeam, AwayTeam, FTHG, FTAG)

csv1718 <- rename(csv1718, Fecha = Date, Local = HomeTeam, Visita = AwayTeam)
csv1718 <- mutate(csv1718, Fecha = as.Date(Fecha, "%d/%m/%y"))

csv1819 <- rename(csv1819, Fecha = Date, Local = HomeTeam, Visita = AwayTeam)
csv1819 <- mutate(csv1819, Fecha = as.Date(Fecha, "%d/%m/%y"))

csv1920 <- rename(csv1920, Fecha = Date, Local = HomeTeam, Visita = AwayTeam)
csv1920 <- mutate(csv1920, Fecha = as.Date(Fecha, "%d/%m/%y"))

dfWrite <- rbind(csv1718, csv1819, csv1920)

getwd()
setwd("C:/WRK/Bedu/Sesion05/")

write.csv(x = dfWrite, file = "soccer.csv", row.names = FALSE)

# funci�n create.fbRanks.dataframes
#create.fbRanks.dataframes(scores.file=match.files, teams.file=team.file, date.format="
csvSoccer <- create.fbRanks.dataframes(soccer.csv)
