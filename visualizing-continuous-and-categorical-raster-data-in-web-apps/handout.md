# Visualizing continuous and categorical raster data in web apps

## Einführung
Das Lesen von Bildern ist in Python sehr einfach, da viele Bibliotheken zum Lesen, Bearbeiten und Visualisieren verschiedener Bildformate existieren. Beispiele hierfür sind Matplotlib, OpenCV, Pillow, etc. 
Diese Bibliotheken funktionieren perfekt mit gängigen Bildformaten wie .png, .tiff, .jpg, .jpeg usw., aber sie scheinen nicht für GeoTiff-Bilder zu funktionieren. Dies hängt damit zusammen, dass geoTIFF auf dem .tif Format aufbaut, aber zusätzlich räumliche Daten beinhaltet.

## Vorteile des GeoTIFF-Formats
GeoTIFF ist aufgrund seiner Flexibilität ein populäres Format zur Speicherung und Verarbeitung von Rasterdaten. Neben den gängigen TIF-Attributen lässt sich ein GeoTIFF erweitern mit Geodaten wie z.B. passenden Koordinaten oder die verwendete Kartenprojektion. Durch das Speichern von Datensätzen in Datentypen wie "Float" oder größeren Integerformaten, lassen sich Satelitenbilder mit einer sehr hohen Genauigkeit darstellen und weiterverarbeiten. Außerdem können die verschiedenen Kanäle (rot, blau , grün, Infarot, ...) entweder seperat voneinander oder geschachtelt verarbeitet werden. Desweiteren erlaubt es die Verwendung interner Komprimierung z.B. als JPEG.

## GeoTiff in Leaflet 


### 1. Einbetten der Javascipt Dateien und der Abhängigkeiten
```html
    <script src="https://unpkg.com/leaflet@1.3.1/dist/leaflet.js"></script>
    <script src="https://unpkg.com/geotiff@0.4.1/dist/main.js"></script>
    <script src="https://unpkg.com/plotty@0.2.0/src/plotty.js"></script>
    <script src="leaflet-geotiff.js"></script>
    
    <script src="leaflet-geotiff-plotty.js"></script>
    <script src="leaflet-geotiff-vector.js"></script>
```

### 2. Einfuügen des GeoTiff Layer
```
// Create map
var layer = L.leafletGeotiff(url, options).addTo(map);
```

Parameters:
  * `url` - GeoTIFF file URL.  Currently only EPSG:4326 files are supported.
  * `options`:
    * `bounds` - (optional) An array specifying the corners of the data, e.g. [[40.712216, -74.22655], [40.773941, -74.12544]].  If omitted the image bounds will be read from the geoTIFF file.
    * `band` - (optional, default = 0) geoTIFF band to read.
    * `image` - (optional, default = 0) geoTIFF image to read.
    * `clip` - (optional, default = undefined) Clipping polygon, provided as an array of [lat,lon] coordinates.  Note that this is the Leaflet [lat,lon] convention, not geoJSON [lon,lat].
    * `renderer` - Renderer to use (see below).

#### Renderer

**Raster data rendered using Plotty**: `L.LeafletGeotiff.plotty(options)`
Options:
- `displayMin` - (optional, default = 0) Minimum values to plot.
- `displayMax` - (optional, default = 1) Maximum values to plot.
- `clampLow`, `clampHigh` - (optional, default = true) If true values outside `displayMin` to `displayMax` will be rendered as if they were valid values.
- `colorScale` - (optional, default = "viridis").  Plotty color scale used to render the image.

### Abhängigkeiten

  * [Leaflet >= 0.7.7](http://leafletjs.com)
* [geotiff.js](https://github.com/constantinius/geotiff.js)
* [plotty](https://github.com/santilland/plotty) (optional)

Beispiel:
![Sample](https://stuartmatthews.github.io/leaflet-geotiff/example.png)

### Dokumentation
[Reading and Visualizing GeoTiff | Satellite Images with Python](https://towardsdatascience.com/reading-and-visualizing-geotiff-images-with-python-8dcca7a74510)
<br>
[Geotiff in Leaflet](https://github.com/stuartmatthews/leaflet-geotiff)
<br>
[Visualizing Raster Data](https://eox.at/2016/02/visualizing-raster-data/)

