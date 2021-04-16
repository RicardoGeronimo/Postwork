# Postwork Sesión 1

# leyendo el fichero desde el repositorio

csvSp1 <-read.csv("https://www.football-data.co.uk/mmz4281/1920/SP1.csv")

# extrae las columnas que contienen los números de goles anotados por los 
# equipos que jugaron en casa (FTHG) y los goles anotados por los equipos 
# que jugaron como visitante (FTAG)

csvSp1$FTHG
csvSp1$FTAG

# La probabilidad (marginal) de que el equipo que juega en casa 
# anote x goles (x = 0, 1, 2, ...)
prop.table(table(csvSp1$FTHG))

# La probabilidad (marginal) de que el equipo que juega como 
# visitante anote y goles (y = 0, 1, 2, ...)
prop.table(table(csvSp1$FTAG))

# La probabilidad (conjunta) de que el equipo que juega en casa 
# anote x goles y el equipo que juega como visitante 
# anote y goles (x = 0, 1, 2, ..., y = 0, 1, 2, ...)
prop.table(table(csvSp1$FTHG, csvSp1$FTAG))
