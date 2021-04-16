# Postwork03

# La probabilidad (marginal) de que el equipo que juega en casa 
# anote x goles (x=0,1,2,)
prop.table(table(Scsv1718$FTHG))

# La probabilidad (marginal) de que el equipo que juega en casa 
# anote y goles (y=0,1,2,)
prop.table(table(Scsv1718$FTAG))

# La probabilidad (conjunta) de que el equipo que juega en casa 
# anote x goles y el equipo que juega como visitante 
# anote y goles (x=0,1,2,, y=0,1,2,)
prop.table(table(Scsv1718$FTHG, Scsv1718$FTAG))

# gráfico de barras para las probabilidades marginales estimadas del número 
# de goles que anota el equipo de casa
barplot(prop.table(table(Scsv1718$FTHG)),
        main = "Equipo local",
        xlab = "Goles", ylab = "Probabilidad", 
        col = c("royalblue")
        )
# gráfico de barras para las probabilidades marginales estimadas del número 
# de goles que anota el equipo visitante.
barplot(prop.table(table(Scsv1718$FTAG)),
        main = "Equipo Visitante",
        xlab = "Goles", ylab = "Probabilidad", 
        col = c("royalblue")
        )

# HeatMap para las probabilidades conjuntas estimadas de los números de 
# goles que anotan el equipo de casa y el equipo visitante en un partido.
ggplot(Scsv1718, aes(x = FTHG, y = FTAG) ) + 
  geom_point() 
#  theme_light() 
#  scale_fill_gradient(low = "white", high = "steelblue")

#names(Scsv1718)
#ggplot(Scsv1718, aes(x = FTHG, y = FTAG, colour = mpg )) + 
#  geom_point() +   
#  theme_gray()   # Temas (inteta cambiarlo)
  
#barplot(prop.table(table(Scsv1718$FTHG)), prop.table(table(Scsv1718$FTAG)),
#        main = "Todos",
#        xlab = "Goles", ylab = "Probabilidad", 
#        col = c("royalblue", "grey")
#        )