# Visualizing continuous and categorical raster data in web apps

## Einführung
Das Lesen von Bildern ist in Python sehr einfach, da viele Bibliotheken zum Lesen, Bearbeiten und Visualisieren verschiedener Bildformate existieren. Beispiele hierfür sind Matplotlib, OpenCV, Pillow, etc. 
Diese Bibliotheken funktionieren perfekt mit gängigen Bildformaten wie .png, .tiff, .jpg, .jpeg usw., aber sie scheinen nicht für GeoTiff-Bilder zu funktionieren. Dies hängt damit zusammen, dass geoTIFF auf dem .tif Format aufbaut, aber zusätzlich räumliche Daten beinhaltet.

## Vorteile des GeoTIFF-Formats
GeoTIFF ist aufgrund seiner Flexibilität ein populäres Format zur Speicherung und Verarbeitung von Rasterdaten. Neben den gängigen TIF-Attributen lässt sich ein GeoTIFF erweitern mit Geodaten wie z.B. passenden Koordinaten oder die verwendete Kartenprojektion. Durch das Speichern von Datensätzen in Datentypen wie "Float" oder größeren Integerformaten, lassen sich Satelitenbilder mit einer sehr hohen Genauigkeit darstellen und weiterverarbeiten. Außerdem können die verschiedenen Kanäle (rot, blau , grün, Infarot, ...) entweder seperat voneinander oder geschachtelt verarbeitet werden. Desweiteren erlaubt es die Verwendung interner Komprimierung z.B. als JPEG.

## GeoTiff in Leaflet
### Komplettes Projekt
[Visualization of Tifs](https://github.com/job2002/Visualization-of-Tiff-Files-in-JavaScript)

### 1. Einbetten der Javascipt Dateien und der Abhängigkeiten
```html
    <!-- Leaflet -->
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
    integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
    integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>

  <!-- Style Css -->
  <link rel="stylesheet" href="style.css">


  <!-- Georasterlayer for Leaflet -->
  <script src="https://unpkg.com/georaster-layer-for-leaflet/dist/georaster-layer-for-leaflet.min.js"></script>

  <!-- Georaster -->
  <script src="https://unpkg.com/georaster"></script>
```
### 2. Erstellen der Karte
```
//Leaflet Map
    let map = L.map('map').setView([51.962331777262506, 7.623985903013933], 13);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);
```
### 2. Einfügen des GeoTiff Layers
```
    // Tif zu Leaflet Karte hinzufuegen
    let url_to_geotiff_file = "./Tifs/Veraenderungsanalyse.tif";  //Replace with your URL
    fetch(url_to_geotiff_file)
      .then(response => response.arrayBuffer())
      .then(arrayBuffer => {
        parseGeoraster(arrayBuffer).then(georaster => {
          let layer = new GeoRasterLayer({
            georaster: georaster,
            opacity: 1,
            pixelValuesToColorFn: values => {   //change to your values
              switch (values[0]) {
                case -1:
                  return '#ff0000';
                case 0:
                  return '#ffffff';
                case 1:
                  return '#0000ff';
                default:
                  return '#000000';
              }
            },
            resolution: 512
          });
          layer.addTo(map);
          map.fitBounds(layer.getBounds());
        });
      });
```

### 4. Erstellen der Legende
```
// Legende
    let legend = L.control({ position: 'topright' });
    legend.onAdd = function (map) {
      let div = L.DomUtil.create('div', 'legend');
      div.style.backgroundColor = 'white';
      div.style.padding = '10px';

      div.innerHTML += '<b>Legend</b><br>';
      div.innerHTML += '<div class="legend-item"><div class="color-block-red" ></div> Wasserrueckgang</div>';
      div.innerHTML += '<div class="legend-item"><div class="color-block-white" ></div> Kein Wasser</div>';
      div.innerHTML += '<div class="legend-item"><div class="color-block-blue" ></div> Wasser</div>';
      return div;
    };
    legend.addTo(map);
```
### 5. Style Sheet
```
#map {
    height: 100%;
}
.legend {
    background-color: white !important; /* Add !important */
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  /* Style for the legend items */
  .legend-item {
    margin-bottom: 5px;
  }
  
  /* Style for the colored rectangles */
  .legend-color {
    width: 20px;
    height: 20px;
    display: inline-block;
    margin-right: 5px;
    background: #ff0000 !important; /* Add !important */
    border: 1px solid #000 !important; /* Add !important */
  }
  .color-block-red {
    width: 20px;
    height: 20px;
    display: inline-block;
    margin-right: 5px;
    background: #ff0000;
    border: 1px solid #000;
  }
  
  .color-block-blue {
    width: 20px;
    height: 20px;
    display: inline-block;
    margin-right: 5px;
    background: #0000ff;
    border: 1px solid #000;
  }
  .color-block-white {
    width: 20px;
    height: 20px;
    display: inline-block;
    margin-right: 5px;
    background: #ffffff;
    border: 1px solid #000;
  }
```
### Abhängigkeiten

* [Leaflet >= 0.7.7](http://leafletjs.com)
* [georaster.js](https://github.com/GeoTIFF/georaster)
* [georaster-layer-for-leaflet.js](https://github.com/GeoTIFF/georaster-layer-for-leaflet) 

## GeoTiff in Html
### 1. Einbetten der Javascipt Dateien und der Abhängigkeiten
```
  <!-- GeoTif -->
  <script src="https://cdn.jsdelivr.net/npm/geotiff"></script>

  <!-- Plotty -->
  <script src="https://stuartmatthews.github.io/leaflet-geotiff/vendor/plotty.js"></script>
```

### 2. Erstellung eines Canvas und eines File Inputs
```
  <canvas id="canvas" width=0 height=0></canvas>
  <input type="file" id="file">
```

### 3. Tif Datei visualisieren
```
 // Eingegebene Tif Datei visualisieren
    let input = document.getElementById('file')
    input.onchange = async function () {
      let tiff = await GeoTIFF.fromBlob(input.files[0]);
      (async function () {
        let image = await tiff.getImage();
        let data = await image.readRasters();
        let canvas = document.getElementById("canvas");
        let plot = new plotty.plot({
          canvas: canvas,
          data: data[0],
          width: image.getWidth(),
          height: image.getHeight(),
          domain: [0, 4],
          colorScale: 'viridis'
        });
        plot.render();
      })();
    }
```
### Abhängigkeiten

* [geotiff.js](https://github.com/constantinius/geotiff.js)
* [plotty](https://github.com/santilland/plotty) 


## Python-Libraries (Beispiel Rasterio)

Rasterio ist eine mächtige Python-Bibliothek um Geodaten zu bearbeiten. Sie funktioniert exzellent im Zusammenspiel mit anderen Bibliotheken und bietet eine große Spanne an **Rasteroperationen** wie z.B.:
* Zuschneiden
* Reprojizieren
* Resampling

So kann rasterio beispielsweise für Aufgaben wie das Lesen und Schreiben von Satellitenbildern, die Durchführung von Geländeanalysen, die Extraktion von Daten aus digitalen Höhenmodellen und die Durchführung von Fernerkundungsanalysen verwendet werden.

### Plotten mit Rasterio

```python
!pip install rasterio #Installiert rasterio, falls noch nicht passiert
````

```python
import rasterio
from rasterio.plot import show
```

```python
# Pfad zur GeoTIFF-Datei
file_path = 'path_to_your_geotiff_file.tif'

# Öffnet GeoTIFF mithilfe von Rasterio
with rasterio.open(file_path) as src:
    # Visualisierung des GeoTIFF mithilfe der Show-Funktion
    show(src, title='GeoTIFF Visualization', cmap='viridis')
```




### Dokumentation
[Reading and Visualizing GeoTiff | Satellite Images with Python](https://towardsdatascience.com/reading-and-visualizing-geotiff-images-with-python-8dcca7a74510)
<br>
[Geotiff in Leaflet](https://github.com/stuartmatthews/leaflet-geotiff)
<br>
[Visualizing Raster Data](https://eox.at/2016/02/visualizing-raster-data/)
<br>
[5 Python Packages For Geospatial Data Analysis](https://www.kdnuggets.com/2023/08/5-python-packages-geospatial-data-analysis.html)

