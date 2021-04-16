# Postwork05
# Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 
# 2019/2020 de la primera divisiÃÂ³n de la liga espaÃÂ±ola

csv1718 <-read.csv("https://www.football-data.co.uk/mmz4281/1718/SP1.csv")
csv1819 <-read.csv("https://www.football-data.co.uk/mmz4281/1819/SP1.csv")
csv1920 <-read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

# Con la funciÃÂ³n select del paquete dplyr selecciona ÃÂºnicamente las 
# columnas Date, HomeTeam, AwayTeam, FTHG, FTAG y FTR; esto para cada 
# uno de los data frames.

csv1718 <- select(csv1718, Date, HomeTeam, AwayTeam, FTHG, FTAG)
csv1819 <- select(csv1819, Date, HomeTeam, AwayTeam, FTHG, FTAG)
csv1920 <- select(csv1920, Date, HomeTeam, AwayTeam, FTHG, FTAG)

csv1718 <- rename(csv1718, date = Date, home.team = HomeTeam, away.team = AwayTeam, home.score = FTHG, away.score = FTAG)
csv1718 <- mutate(csv1718, date = as.Date(date, "%d/%m/%y"))

csv1819 <- rename(csv1819, date = Date, home.team = HomeTeam, away.team = AwayTeam, home.score = FTHG, away.score = FTAG)
csv1819 <- mutate(csv1819, date = as.Date(date, "%d/%m/%y"))

csv1920 <- rename(csv1920, date = Date, home.team = HomeTeam, away.team = AwayTeam, home.score = FTHG, away.score = FTAG)
csv1920 <- mutate(csv1920, date = as.Date(date, "%d/%m/%y"))

dfWrite <- rbind(csv1718, csv1819, csv1920)

getwd()
setwd("C:/WRK/Bedu/Sesion05/")

write.csv(x = dfWrite, file = "soccer.csv", row.names = FALSE)

# función create.fbRanks.dataframes
#create.fbRanks.dataframes(scores.file=match.files, teams.file=team.file, date.format="
listasoccer <- create.fbRanks.dataframes("soccer.csv", date.format="%Y-%m-%d", na.remove=FALSE)
class(listasoccer)
