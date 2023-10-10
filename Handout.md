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

 
