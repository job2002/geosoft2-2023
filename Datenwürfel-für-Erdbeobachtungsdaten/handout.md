# Datenwürfel für Erdbeobachtungsdaten

## Definition und Aufbau

- repräsentieren multidimensionale Datenstrukturen (vgl. Smith 2017)
- Organisation von Informationen in einem mehrdimensionalen Raum (vgl. ebd.)
- mehrdimensionales Array (vgl. Pebesma et al. 2023)
- Speicherung von Erdbeobachtungsdaten (vgl. ebd.)
- Dimensionen: Latitude, Longitude und Zeit (vgl. ebd.)
- Struktur erleichtert den Zugriff und die Analyse raumbezogener Daten (vgl. ebd.)

<img width="438" alt="image" src="https://github.com/sonja-becker/geosoft2-2023/assets/102386695/b173d115-9bfc-4d02-84a8-b7ba5a6645f9">

Abb. 1: Datenwürfel für Erdbeobachtungsdaten (Pebesma et. al. 2023)

## Grundoperationen und Anwendungen

### Slicing eines Würfels

Dabei handelt es sich um die Auswahl eines Teils eines Datenwürfels, indem eine Dimension auf einen bestimmten Wert festgelegt wird. Dies kann mit der zeitlichen, spektralen oder räumlichen Dimension geschehen. Bei der räumlichen Filterung wird nicht eine einzelne räumliche Dimension fixiert, sondern es wird eine spezifische Teilregion ausgewählt.

### Anwendung von Funktionen auf Dimensionen

Dabei handelt es sich um die Durchführung von Operationen auf einer oder mehreren Dimensionen des Würfels. Es können einfache Funktionen wie der Betrag, Sinus oder die Quadratwurzel auf alle Werte angewendet werden. 

### Reduzierung von Dimensionen

Wenn eine Funktion auf einen gesamten Datenwürfel angewendet wird, verschwinden alle Dimensionen, was zu einem Würfel mit null Dimensionen führt. Funktionen können auch auf eine Teilmenge von Dimensionen angewendet werden, wodurch ausgewählte Dimensionen verschwinden oder reduziert werden.

(vgl. Pebesma et al. 2023)

## Vorteile

- __Effiziente Datenspeicherung und -zugriff__: Data Cubes ermöglichen die effiziente Organisation von raumbezogenen Daten, was den Zugriff und die Verarbeitung beschleunigt.
- __Mehrdimensionale Analysen__: Durch die multidimensionale Struktur können komplexe Analysen durchgeführt werden, die in herkömmlichen Datenformaten schwierig umzusetzen wären.
- __Zeitreihenanalysen__: Data Cubes eignen sich hervorragend für die Analyse von zeitlich veränderlichen Umweltdaten, da sie die Speicherung von Daten über verschiedene Zeitpunkte hinweg erleichtern.
- __Benutzerfreundliche Anwendung__

## Nachteile

- __Speicherplatzbedarf__: Aufgrund der multidimensionalen Struktur können Data Cubes vergleichsweise mehr Speicherplatz benötigen als herkömmliche Datenformate.
- __Komplexität der Implementierung__: Die Erstellung und Verwaltung von Data Cubes erfordert spezifisches Know-how und geeignete Softwaretools.
- __Datenaktualisierung__: Das Hinzufügen neuer Daten oder die Aktualisierung bestehender Daten in einem Data Cube kann komplex sein und erfordert besondere Aufmerksamkeit.

## Literaturverzeichnis
- Kopp, S., Becker, P., Doshi, A., Wright, D. J., Zhang, K., & Xu, H. (2019): Achieving the full vision of earth observation data cubes. Data, 4(3), 94.
- Pebesma, E., & Bivand, R. (2023): Spatial data science: With applications in R. CRC Press.
- Smith, J. (2017): Spatial Data Analysis with Data Cubes: Implementation in R. CRC Press.
