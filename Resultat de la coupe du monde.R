library(rvest)
library(dplyr)
library(ggplot2)

# 1) fonction pour le site web

url_skysport= "https://www.skysports.com/world-cup-table" 
url_skysport

# visualisation des donnees

dataread=rvest::read_html(url_skysport)
dataread
#retrouvaille de tableau dans le contenu du web
tableaux=rvest::html_table(dataread) 

# 2) nombre ou taille des tableaux

length(tableaux)

#visualisation dans les tableaux
tableaux[[1]]
tableaux[[2]]  
tableaux[[3]]
tableaux[[4]]
tableaux[[5]]
tableaux[[6]]
tableaux[[7]]
tableaux[[8]]

data1=tableaux[[1]]
data2=tableaux[[2]]
data3=tableaux[[3]]
data4=tableaux[[4]]
data5=tableaux[[5]]
data6=tableaux[[6]]
data7=tableaux[[7]]
data8=tableaux[[8]]

# 3) Compilation des differents tableaux en un seul dataframe.

Donnees=bind_rows(data1,data2,data3,data4,data5,data6,data7,data8)
palmares=as.data.frame(Donnees)
best_team=palmares[,c(2,10)]
best_team1=best_team%>%arrange(desc(Pts))
Top10_team=best_team1[c(1:10),]
pts=c(7,7,7,6,6,6,6,6,6,6)
team=c( "netherlands","england","morocco","senegal","argentina","france","australia",
       "japan","bresil","switzerland" )
barplot(pts,col=c(1,2,3,4,5,6,7),names.arg = team, xlab = "Equipes",ylab ="pts",
        main = "les 10 meilleures equipes")










