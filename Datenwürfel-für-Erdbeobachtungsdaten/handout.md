# Datenwürfel für Erdbeobachtungsdaten
Erstellt von [@sonja-becker](https://github.com/sonja-becker) und [@SimonPepe](https://github.com/SimonPepe)

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


## Beispiele
- __Open Data Cube (ODC)__ ist ein Open-Source-Projekt zur Verwaltung und Analyse von Geodaten, das hilft die Leistungsfähigkeit von Satellitendaten zu nutzen. Im Kern besteht der ODC aus einer Reihe von Python-Bibliotheken und einer PostgreSQL-Datenbank
- __Google Earth Engine__ verwendet datacubes, um eine skalierbare und interaktive Plattform für die Analyse von EO Daten bereitzustellen. Google Earth Engine ermöglicht den Zugriff auf und die Analyse von großen Geodatensätzen für Anwendungen wie Umweltüberwachung, Landbedeckungskartierung und Studien zum Klimawandel.
- __Euro Data Cube__ wurde geschaffen, um die technischen Hürden zu senken, die bei der Gewinnung von Informationen aus Earth ovservation und deren Aufbereitung für die Analyse bestehen. Sie kombiniert EO-Daten aus verschiedenen Quellen an einem Ort, darunter Daten von den Sentinel-Satelliten, Daten von anderen kommerziellen Satellitenmissionen mit sehr hoher Auflösung sowie Produkte und Daten von Copernicus-Diensten und anderen EO-Initiativen.
- __EODataBee__ integriert Sentinel-Daten, Daten des Copernicus-Dienstes und vom Nutzer gelieferte Daten in einem DataCube-System und generiert so hochwertige Informationen für die Industrie auf dem Küsten- und Binnenwassermarkt.


## Datacubes in openEO 
Daten werden in openEO immer als datacubes representiert. 
Die folgenden Eigenschaften sind in der Regel für Dimensionen verfügbar:

    name
    type (potential types include: spatial (raster or vector data), temporal and other data such as bands)
    axis (for spatial dimensions) / number
    labels (usually exposed through textual or numerical representations, in the metadata as nominal values and/or extents)
    reference system / projection
    resolution / step size
    unit (either explicitly specified or implicitly given by the reference system)
    additional information specific to the dimension type (e.g. the geometry types for a dimension containing geometries)



### Beispiel 
In diesem Beispiel soll ein monatliches RGB-Komposit aus Sentinel-1-Rückstreudaten über dem Gebiet von Wien, Österreich, für drei Monate im Jahr 2017 erstellt werden. Dies kann für die Klassifizierung und die Überwachung von Pflanzen genutzt werden.
Es wird ein JavaScript-Client in einer Node.js-Umgebung und das Google Earth Engine-Backend genutzt. Quelle: https://openeo.org/documentation/1.0/javascript/


```javascript
// Make the client available to the Node.js script
// Also include the Formula library for simple math expressions
const { OpenEO, Formula } = require('@openeo/js-client');

async function example() {
  // Connect to the back-end
  var con = await OpenEO.connect("https://earthengine.openeo.org");
  // Authenticate ourselves via Basic authentication
  await con.authenticateBasic("group11", "test123");
  // Create a process builder
  var builder = await con.buildProcess();
  // We are now loading the Sentinel-1 data over the Area of Interest
  var datacube = builder.load_collection(
    "COPERNICUS/S1_GRD",
    {west: 16.06, south: 48.06, east: 16.65, north: 48.35},
    ["2017-03-01", "2017-06-01"],
    ["VV"]
  );

  // Since we are creating a monthly RGB composite, we need three separated time ranges (March aas R, April as G and May as G).
  // Therefore, we split the datacube into three datacubes using a temporal filter.
  var march = builder.filter_temporal(datacube, ["2017-03-01", "2017-04-01"]);
  var april = builder.filter_temporal(datacube, ["2017-04-01", "2017-05-01"]);
  var may = builder.filter_temporal(datacube, ["2017-05-01", "2017-06-01"]);

  // We aggregate the timeseries values into a single image by reducing the time dimension using a mean reducer.
  var mean = function(data) {
    return this.mean(data);
  };
  march = builder.reduce_dimension(march, mean, "t");
  april = builder.reduce_dimension(april, mean, "t");
  may = builder.reduce_dimension(may, mean, "t");

  // Now the three images will be combined into the temporal composite.
  // We rename the bands to R, G and B as otherwise the bands are overlapping and the merge process would fail.
  march = builder.rename_labels(march, "bands", ["R"], ["VV"]);
  april = builder.rename_labels(april, "bands", ["G"], ["VV"]);
  may = builder.rename_labels(may, "bands", ["B"], ["VV"]);

  datacube = builder.merge_cubes(march, april);
  datacube = builder.merge_cubes(datacube, may);

  // To make the values match the RGB values from 0 to 255 in a PNG file, we need to scale them.
  // We can simplify expressing math formulas using the openEO Formula parser.
  datacube = builder.apply(datacube, new Formula("linear_scale_range(x, -20, -5, 0, 255)"));

  // Finally, save the result as PNG file.
  // In the options we specify which band should be used for "red", "green" and "blue" color.
  datacube = builder.save_result(datacube, "PNG", {
    red: "R",
    green: "G",
    blue: "B"
  });

  // Now send the processing instructions to the back-end for (synchronous) execution and save the file as result.png
  await con.downloadResult(datacube, "result.png");
}

// Run the example, write errors to the console.
example().catch(error => console.error(error));


```

 ![getting-started-result-example 7820ee84](https://github.com/sonja-becker/geosoft2-2023/assets/102386695/22684765-b65a-438a-94b2-b74cc116ba73)



## Literaturverzeichnis
- Kopp, S., Becker, P., Doshi, A., Wright, D. J., Zhang, K., & Xu, H. (2019): Achieving the full vision of earth observation data cubes. Data, 4(3), 94.
- OpenEO: https://openeo.org/documentation/1.0/javascript/ (abgerufen am 5.10.2023)
- OpenEO: https://openeo.org/documentation/1.0/datacubes.html#what-are-datacubes (abgerufen am 5.10.2023)
- Pebesma, E., & Bivand, R. (2023): Spatial data science: With applications in R. CRC Press.
- Smith, J. (2017): Spatial Data Analysis with Data Cubes: Implementation in R. CRC Press.
