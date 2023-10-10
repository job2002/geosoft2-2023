# **Remote Sensing in R**
Autoren: [@starke01](https://github.com/starke01), [@kgalb01](https://github.com/kgalb01)<br/></br>

## **1. Motivation**
Warum wird R für Fernerkundung genutzt?
* Volle programmatische Kontrolle:
  * Anders als die üblichen Umgebungen zum Verarbeiten von Fernerkundungsdaten (z.B. QGIS), kann R völlig an spezifische Anforderungen und Workflows angepasst werden.
  * R ist bei den meisten Anwendungen und Funktionen skalierbar. Damit kann die Effizienz, mit der große Datenmengen analysiert oder verarbeitet werden, angepasst werden, indem Einfluss auf die Art und Weise genommen wird, wie Anwendungen und Funktionen mit den Datenmengen umgehen.
* Erweiterbarkeit durch Pakete:
  * Die R-Community entwickelt ständig neue Pakete zum Arbeiten mit Fernerkundungsdaten.
* Machine Learning-Integration:
  * R bietet eine große Menge an Paketen zum Thema "Machine Leaning", die überwachte oder automatisierte Klassifikationen der Fernerkundungsdaten ermöglichen
 <br/><br/>
 
## **2. Datenakquise**
Fernerkundungsdaten können von unterschiedlichen Plattformen bezogen werden. Einige davon sind Open Source und bieten ihre Daten kostenlos an, andere wiederum sind kostenpflichtig. Einige Beispiele für diese Plattformen sind die folgenden Websiten:
* Rasterdaten aus verschiedenen Quellen wie zum Beispiel einige Landsat Satelliten: [USGS Earth Explorer](https://earthexplorer.usgs.gov/) (Open Source)
* Rasterdaten von Sentinel-2 Satelliten: [Copernicus Data Space](https://dataspace.copernicus.eu/browser/) (Open Source)
* Verschiedene Raumbezogene Daten aus Münster: [Open Data Münster](https://opendata.stadt-muenster.de) (Open Source) 
<br/><br/>

## **3. Einbindung der Daten in R**
Die Einbindung von Rasterdaten in R erfolgt über Funktionen aus dem Raster-Paket. Dabei gibt es unterschiedliche Arten von Rasterdatenformaten, wie zum Beispiel *.TIF -*, *.JP2 -* oder *.grd -* Dateien, die teilweise unterschiedlich eingebuden werden müssen.
* Die Daten liegen oft als einzelne Dateien für die unterschiedlichen Kanäle (Rot, Grün, Blau, Nahesinfrarot, etc.) vor. Diese Kanäle können einzeln mit der *raster()*-Funktion eingebunden werden.
  * Beispiel: *nir <- raster("name_des_kanals")* würde einen Naheninfrarotkanal einbinden können. Dieser Kanal wird an die Variable *"nir"* gebunden und ist unter diesem Namen auch im Environment von R zu finden und kann darüber aufgerufen werden.
  * Beispiel: *red <- raster("Ordnerpfad/name_des_kanals)* hat den gleichen Effekt für den roten Kanal.
* Soll ein Komposit aus mehreren Kanälen erstellt werden oder die Arbeit an mehreren Kanälen ist aus anderen Gründen benötigt, kann ein *"RasterStack"* erstellt werden, der mehrere Kanäle gleichzeitig an einen Variablennamen bindet. Voraussetzung ist, dass die Metadaten, also zum Beispiel die Auflösung, die Referenzsysteme, die Ausdehnung usw. bei allen Kanälen gleich sind. Ist das der Fall, so können die gewünschten Kanäle mit der Funktion *"stack()"* zu einem *RasterStack* erstellt werden.
  * Beispiel: *data <- stack("blauer_kanal", "gruener_kanal", "roter_kanal")*, wobei die Kanalnamen entsprechend ersetzt werden müssen.
* *.grd* - Dateien beinhalten meistens direkt mehrere Kanäle in einem Dateiformat und können somit lediglich mit Hilfe der *stack()*-Funktion oder der *brick()*-Funktion eingebunden werden.
  * Beispiel: *grd_data <- stack("dateiname.grd")*
* Mit der Funktion *brick()* können so genannte *RasterBricks* erstellt werden. Diese Funktion kann sowohl einzelne als auch mehrere Kanäle einbinden und ist etwas schneller in der Verarbeitung als die bisher bekannten Funktionen. Dafür bieten *"RasterBricks"* etwas weniger Flexibilität.
  * Beispiel: *brick_grd <- brick("dateiname.grd")*
<br/><br/>

 
## **4. Datenanalyse**
Um sich über die vorliegenden Fernerkundungsdaten einen Überblick zu verschaffen, können die Variablennamen aufgerufen werden, mit dem die Daten eingebunden sind.
  + Beispiel: *"nir"* eingeben, um Informationen über den zuvor eingebundenen Naheninfrarotkanal zu erhalten 
<br/><br/>

Auf diese Art und Weise erhält man folgende Informationen:

* Klasse: Was für eine Art von Daten liegt vor?
* Dimension: Wie viele Daten liegen vor?
* Auflösung: Welche Auflösung besitzen meine Daten?
* Ausdehnung: Welche Fläche decken meine Daten ab?
* CRS: Welches Referenzsystem (Koordinaten, Datum, etc.) nutzen meine Daten?
* Quelle: Woher stammen die Fernerkundungsdaten? Vom Speicher in R eingebunden oder durch R aus dem Internet runtergeladen?
* Namen: Wie heißen die Dateien, die eingebunden sind?
<br/><br/>

Diese Informationen können bei der Ver- und Bearbeitung der Rasterdaten nützlich sein, da an den meisten Metadaten noch etwas verändert werden kann.

* Die Klasse kann zum Teil verändert werden, zum Beispiel indem die Daten durch eine andere Funktion eingebunden werden.
  * Beispiel: *"RasterStack"* und *"RasterBrick"* aus dem letzten Abschnitt.
* Die Auflösung der Daten kann geändert werden mit Hilfe der *resample()*-Funktion aus dem Raster Paket.
  * Beispiel: *resample_data <- (resolution_30_data, resolution_20_data)*
  * Die Beispielvariablen würden entsprechend eine Auflösung von 30 x 30 Metern, bzw. 20 x 20 Metern pro Pixel haben und die Funktion würde die Variable *resolution_30_data* konvertieren zu einer Auflösung von 20 x 20 Metern pro Pixel und das Ergebnis im Variablennamen *resample_data* speichern
* Die Ausdehnung der Fernerkundungsdaten kann mit der *crop()*-Funktion aus dem Raster Paket verändert werden. Dazu werden Koordinaten über die gewünschte Ausdehnung benötigt.
    * Beispiel: *cropped_raster <- crop(data, c(Koord-1, Koord-2, Koord-3, Koord-4))*
    * Die Koordinaten müssen dabei in folgender Reihenfolge eingefügt werden:
      * Stelle 1 und 4: Koordinaten vom Punkt in der oberen linken Ecke
      * Stelle 2 und 4: Koordinaten vom Punkt in der oberen rechten Ecke
      * Stelle 1 und 3: Koordinaten vom Punkt in der unteren linken Ecke
      * Stelle 2 und 3: Koordinaten vom Punkt in der unteren rechten Ecke
    * Beispiel: cropped_muenster <- crop(muenster_data, c(394861, 5746419, 5767397))
      * Genutzt werden hier Koordinaten der ungefähren Ausdehnung von Münster im UTM-Format
* Das Referenzsystem, bzw. CRS, von Rasterdaten kann wie folgt verändert werden:
  1. Definiere ein Ziel Referenzsystem, in dem das eigene konvertiert werden soll
      * *ziel_crs <- "+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs"*
      * oder *ziel_crs <- CRS("+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs"*
  2. Projiziere die Rasterdaten mit der *projectRaster()*-Funktion aus dem Raster Paket um:
      * proj_data <- projectRaster(proj_data, crs=ziel_crs), wobei "proj_data" die Beispielrasterdaten sind, die umprojiziert werden sollen
        
Darüber hinaus ist es mit *summary(data)* möglich alle wichtigen statistischen Informationen der Daten zu erhalten
<br/><br/>

## **5. Visualisierung der Fernerkundungsdaten**


