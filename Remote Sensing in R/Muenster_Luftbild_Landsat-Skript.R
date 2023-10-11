# Quelle der Daten: Earthexplorer.usgs.gov
# Inhalt der Daten: Luftbilder von Münster und Umgebung vom Landsat 8-9 OLI/TIRS C2 L1 vom 11.09.2023
# Autoren: Jonas Starke & Kieran Galbraith


#####################
# Vorbereitung der Arbeit
# Löscht alles im Workspace
rm(list=ls())

# Setzt den Pfad für Dateien, achtung! / in R und \ in Windows!
setwd("/Users/kgalb/OneDrive/Dokumente/Workspace/R/Münster/Münster Landsat")
list.files() # Übersicht über die Dateien im Workspace
#####################




#####################
# Einbinden der benötigten Pakete/Librarys

library(raster) # -> vorher install.packages("raster")
library(mapview) # -> vorher install.packages("mapview")
#library(sp)
#library(rgdal) # ...
#library(leaflet)
#library(leaflet.extras)
#library(mapedit)

#####################




#####################
# Einbinden und Plotten

nir <- raster("LC09_L1TP_197024_20230911_20230911_02_T1_B5.TIF") # Einbinden des NIR-Bandes
nir # Informationen über das Band
plot(nir) # Erstes Plotten des Bandes

# Blauen, Grünen und Roten Kanal einbinden und zusammenfügen
# Bänder: 2 = Blue, 3 = Green, 4 = Red, 5 = NIR, ...

muenster_landsat_all <- stack("LC09_L1TP_197024_20230911_20230911_02_T1_B2.TIF",
                          "LC09_L1TP_197024_20230911_20230911_02_T1_B3.TIF",
                          "LC09_L1TP_197024_20230911_20230911_02_T1_B4.TIF",
                          "LC09_L1TP_197024_20230911_20230911_02_T1_B5.TIF")
plot(muenster_landsat_all)

# Achtung! Die zusammengefassten Bänder müssen eine Einheitliche Auflösung besitzen!
#####################




#####################
# Schneiden der Rasterdaten -> Zuerst Eckpunkte von unserem Gebiet (Münster) in Erfahrung bringen
# Achtung! Wir brauchen UTM Daten! Konvertieren wenn nötig!
# Unsere Koordinaten sind: 
# Oben Links: Lat/Long: 52.047204, 7.466846 oder UTM: 394861 Easting, 5767397 Northing -> Altenberge
# Oben Rechts: Lat/Long: 52.047204, 7.835575 oder UTM: 420134 Easting, 5767397 Northing -> Ostbevern
# Unten Links: Lat/Long: 51.858571, 7.466846 oder UTM: 394861 Easting, 5746419 Northing -> Senden
# Unten Rechts: Lat/Long: 51.858571, 7.835575 oder UTM: 420134 Easting, 5746419 Northing -> Sendenhorst

muenster_landsat <- crop(muenster_landsat_all, c(394861, 420134, 5746419, 5767397))

# Wie? UTM Koordinaten von oben links an Stelle 1 & 4, oben rechts an 2 & 4, unten link an 1 & 3 und unten rechts an 2 & 3
plot(muenster_landsat) # Plotten der zugeschnittenen Bänder
muenster_landsat # Anzeigen der Informationen über unseren Stack

####################




####################
# Visualisierung der Rasterdaten 
mapview(muenster_landsat)

# Als Echtfarbkomposit:
plotRGB(muenster_landsat,b=1,g=2,r=3,stretch="lin")

# Falschfarbkomposit:
plotRGB(muenster_landsat, b=2, g=3, r=4, stretch="lin")
#####################




#####################
# Mit den Rasterdaten arbeiten: NDVI berechnen 
NDVI <- (muenster_landsat$LC09_L1TP_197024_20230911_20230911_02_T1_B5 - muenster_landsat$LC09_L1TP_197024_20230911_20230911_02_T1_B4)/(muenster_landsat$LC09_L1TP_197024_20230911_20230911_02_T1_B5 + muenster_landsat$LC09_L1TP_197024_20230911_20230911_02_T1_B4)
plot(NDVI)

# Weiter arbeiten mit NDVI
# Filtert die Werte vom NDVI so, dass nur noch Gewässer übrig bleiben
gewaesser <- NDVI<=0
plot(gewaesser, col=c("white", "blue"))

# Filtert die Werte vom NDVI so, dass nur noch Brachland übrig bleiben
brachland <- NDVI>0 & NDVI<0.17
plot(brachland)

# Filtert die Werte vom NDVI so, dass nur noch Wald übrig bleibt
forest <- NDVI>=0.27
plot(forest)

# Filtert die Werte vom NDVI so, dass nur noch Acker übrig bleiben
acker <- NDVI>=0.17 & NDVI<0.27
plot(acker)

# NDVI innerhalb einer 3x3 mit Hilfe des Medians glätten
smooth_ndvi <- focal(NDVI, fun=median, w=matrix(1, nrow=3, ncol=3))
plot(smooth_ndvi)
#####################



#####################
# Export der Ergebnisse

# Export von Plotts als PDF
# Schritt 1: "pdf" aufrufen um das Speichern der PDF einzuleiten
pdf("NDVI_muenster.pdf")
# Schritt 2: Den Plott erstellen
muenster_landsat$NDVI <- (muenster_landsat$LC09_L1TP_197024_20230911_20230911_02_T1_B5 - muenster_landsat$LC09_L1TP_197024_20230911_20230911_02_T1_B4)/(muenster_landsat$LC09_L1TP_197024_20230911_20230911_02_T1_B5 + muenster_landsat$LC09_L1TP_197024_20230911_20230911_02_T1_B4)
plot(muenster_landsat$NDVI)
legend("topleft",legend=c("NDVI von Münster am 11.09.2023"))
# Schritt 3: dev.off() um das Speichern des Plotts in der PDF zu beenden
dev.off()

## Export der Stacks als .grd
writeRaster(muenster_landsat,"/Users/kgalb/OneDrive/Dokumente/Workspace/R/Münster/Münster Landsat/muenster_landsat.grd", overwrite=TRUE)
#####################
