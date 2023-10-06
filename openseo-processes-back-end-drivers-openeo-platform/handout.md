# OpenEO - Open Earth Observation 
![Alt-Text](openeo_logo.png)

## Was ist OpenEO?  

**OpenIO** ist eine Initiative zur Vereinfachung des Zugangs und der Verarbeitung von Erdbeobachtungsdaten

### Es gibt zwei grundlegende Probleme:

* Downloadgröße von Erdbeobachtungsdaten ist viel zu groß!
* Organisation von Daten in „Tiles“ macht es unnötig kompliziert für die Analyse!

### Lösung:

1. Speichern von Daten in der Cloud
1. Im Backend berechnen und verarbeiten
1. die Ergebnisse abrufen oder entstandene Analysen downloaden.

## Wie macht OpenEO das?

OpenEO entwickelt eine ***API***, mit der Clients (R, Python, JavaScript) Erdbeobachtungsdaten im Backend auf eine simple und einheitliche Art und Weise verbinden können.

Bild von ohne API und Bild mit API

### API
* zum Erforschen (API, EO Data, Prozesse)
* Authentifizierung (OpenID Connect)
* Nutzen Prozesse
	* [vordefinierte Prozesse](https://openeo.org/documentation/1.0/processes.html)
	* vom Nutzer selbst definierte Prozesse
	* vom Nutzer selbst definierte Funktionen in R, Python oder JavaScript
* Dateimanagement
* Web Services

## Merkmale von OpenEO

* Cloudbasiert
* Open Source
* Wird von der Community geleitet
* Vereinfachte Nutzung über Data Cubes

## Zum Verständnis, OpenEO ist kein(e)...

* anderer Cloud Provider
* geoprocessing software
* traditionelles GIS

## Clients
* [JavaScript](https://openeo.org/documentation/1.0/javascript/#installation) / TypeScript 
* [Python](https://openeo.org/documentation/1.0/python/) 
* [R](https://openeo.org/documentation/1.0/r/) 
*  [QGIS](https://openeo.org/documentation/1.0/qgis/)
* Browser (Web-Editor without programming) 

## Back-ends
* GeoPySpark (Geotrellis)
* **Google Earth Engine**
* GRASS GIS
* JEODPP
* OpenDataCube
* Apache Airflow / eoDataReaders
* **Sentinel Hub**
* WCPS (rasdaman)
* R back-end
* **OpenEO Platform**


## Andere Komponenten

![Alt-Text](openeoplatform.jpg)

### OpenEO Platform
* Cloud Provider

### OpenEO Hub

## Ressourcen und Quellen

* https://openeo.org/about.html
* https://www.youtube.com/watch?v=tCoAedg6RWI
* [OpenEO Cookbook](https://openeo.org/documentation/1.0/cookbook/#chapter-1)
