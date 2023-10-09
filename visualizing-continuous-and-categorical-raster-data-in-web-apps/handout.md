# Visualizing continuous and categorical raster data in web apps

## Einführung
Das Lesen von Bildern ist in Python sehr einfach, da viele Bibliotheken zum Lesen, Bearbeiten und Visualisieren verschiedener Bildformate existieren. Beispiele hierfür sind Matplotlib, OpenCV, Pillow, etc. 
Diese Bibliotheken funktionieren perfekt mit gängigen Bildformaten wie .png, .tiff, .jpg, .jpeg usw., aber sie scheinen nicht für GeoTiff-Bilder zu funktionieren. Dies hängt damit zusammen, dass geoTIFF auf dem .tif Format aufbaut, aber zusätzlich räumliche Daten beinhaltet.

## Vorteile des GeoTIFF-Formats
GeoTIFF ist aufgrund seiner Flexibilität ein populäres Format zur Speicherung und Verarbeitung von Rasterdaten. Neben den gängigen TIF-Attributen lässt sich ein GeoTIFF erweitern mit Geodaten wie z.B. passenden Koordinaten oder die verwendete Kartenprojektion. Durch das Speichern von Datensätzen in Datentypen wie "Float" oder größeren Integerformaten, lassen sich Satelitenbilder mit einer sehr hohen Genauigkeit darstellen und weiterverarbeiten. Außerdem können die verschiedenen Kanäle (rot, blau , grün, Infarot, ...) entweder seperat voneinander oder geschachtelt verarbeitet werden. Desweiteren erlaubt es die Verwendung interner Komprimierung z.B. als JPEG.


### Dokumentation
[Reading and Visualizing GeoTiff | Satellite Images with Python](https://towardsdatascience.com/reading-and-visualizing-geotiff-images-with-python-8dcca7a74510)
[Visualizing Raster Data](https://eox.at/2016/02/visualizing-raster-data/)

