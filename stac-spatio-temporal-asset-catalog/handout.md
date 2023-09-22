# Was ist der STAC? (SpatioTemporal Asset Catalog)
- einheitliches Datenformat zur Beschreibung und Katalogisierung von Geodaten
- der STAC ist eine Spezifikation, die von den einzelnen Datenanbieter:innen umgesetzt werden muss. 
- einige der öffentlich angebotenen STAC Datensätze findest du [hier](https://stacspec.org/en/about/datasets/) (z.B. Sentinel & Landsat Daten)
- aufbauend auf der Spezifikation gibt es eine Reihe von [Tools](https://stacspec.org/en/about/tools-resources/)
    - diese decken unter anderem Bereiche wie Client, Server, API und CLI ab, sowie Data Creation, Processing, Visualization und Validation
    - dabei wird ein breites Spektrum von Programmiersprachen abgedeckt
- hinter STAC steht eine aktive Community
    - Anbieter:innen und Nutzer:innen von raumbezogenen Daten
    - Zusammenarbeit mit anderen Standardisierungsorganisationen (z.B. IETF oder OGC)
    - Fokus auf Interoperabilität und Open Source
    - [Gitter-Community](https://gitter.im/SpatioTemporal-Asset-Catalog/Lobby)
> Quelle: https://stacspec.org/en/about/

# Warum STAC nutzen?
- Interoperabilität und Zugänglichkeit von raumbezogenen Daten
- eine Schnittstelle zwischen den unterschiedlichen genutzten Datentypen, -formaten und -sprachen
    - das heißt, dass durch STAC beispielsweise LiDAR-Daten, die typischerweise in dem LAS-Format abgespeichert sind, und als GeoTIFF gespeicherte SAR-Daten, ihre Metadaten in der gleichen STAC-konformen Struktur präsentieren
- persistente Metadaten
- technisch einfache Nutzung durch HTML-Ansatz
    - Anbieter benötigt keine großen Datenbanken und Server
    - einfache Suche über [STAC Index](https://stacindex.org/) oder unterschiedliche Suchmaschinen
- viele [Extensions](#extensions) (z. B. für Datacubes oder Punktwolken) 
> Quelle: https://stacspec.org/en/about/

# Die STAC-Spezifikation
- besteht aus 4 Teilen:
    - STAC Item, Verbindung von einer Geoinformationen, STAC-spezifischen Metadaten und den dazugehörigen Assets
    - STAC Catalog, eine JSON Datei mit Links zu einzelnen STAC Items/Catalogs/Collections
    - STAC Collection, Erweiterung des STAC Catalogs um Informationen zu den Daten (Lizenz, Schlüsselwörter, Quellen der Daten, etc.)
    - STAC API, RESTful Endpunkt, um nach einzelnen STAC Items zu suchen und auf diese zuzugreifen

    > Quelle: https://stacspec.org/en

Diese nennen wir im folgenden _STAC Ressourcen_.

## Die "STAC Ressourcen"
- sobald ein JSON Objekt die notwendigen Schlüssel einer bestimmten STAC Ressource enthält, wird es als diese angesehen
- für alle Schlüssel gibt es weitere Spezifikationen, welcher Wert für den jeweiligen Schlüssel erwartet wird
- [Extensions](#extensions) spezifizieren lediglich weitere (Pflicht-)Attribute
- eine kurze offizielle Einführung findet man auch [hier](https://stacspec.org/en/tutorials/intro-to-stac/)
### STAC-Item
- Eine Datei mit Informationen über die Erde, die **an einem bestimmten Raum** zu einer **bestimmten Zeit** erfasst wurden.
- ein STAC Item ist ein GeoJSON Feature mit weiteren [foreign members](https://www.rfc-editor.org/rfc/rfc7946#section-6.1)
    - es ist also ein Superset eines GeoJSONs
- Beispiel mit Pflichtschlüsseln:
    ```json
    {
    "stac_version": "1.0.0",
    "type": "Feature",
    "id": "20201211_223832_CS2",
    "bbox": [],
    "geometry": {},
    "properties": {},
    "collection": "simple-collection",
    "links": [],
    "assets": {}
    }
    ```
> Quelle und weitere Infos: https://github.com/radiantearth/stac-spec/blob/master/item-spec/item-spec.md

### STAC Catalog
- gruppiert zusammengehörige STAC-Ressourcen
- Beispiel mit Pflichtschlüsseln:
    ```json
    {
    "stac_version": "1.0.0",
    "type": "Catalog",
    "id": "20201211_223832_CS2",
    "description": "A simple catalog example",
    "links": []
    }
    ```
> Quelle und weitere Infos: https://github.com/radiantearth/stac-spec/blob/master/catalog-spec/catalog-spec.md

### STAC Collection
- ergänzt Metadaten wie Lizenz, Schlüsselwörter, Zusammenfassung, etc.
- ist ein Superset eines STAC Catalogs (anhand von "type" unterscheidbar)
- Beispiel mit zusätzlichen Pflichtschlüsseln:
    ```json
    {
    "stac_version": "1.0.0",
    "type": "Collection",
    "license": "ISC",
    "id": "20201211_223832_CS2",
    "description": "A simple collection example",
    "links": [],
    "extent": {},
    "summaries": {}
    }
    ```
> Quelle und weitere Infos: https://github.com/radiantearth/stac-spec/blob/master/collection-spec/collection-spec.md

### STAC-API (MICHAEL)
- Die STAC API ist eine dynamische Version eines STAC, also eine Implementierung der Spezifikation (https://github.com/radiantearth/stac-api-spec). Die API selbst kann auch wieder unterschiedliche Implementierungen haben
- hat einen root-endpoint (die sog. "landing page") welche selbst ein STAC Catalog ist, welcher zu weiteren STAC Ressourcen verlinkt.
- wird über den GET Endpoint "\<Name eigener STAC>/search?\<searchParams>" erreicht
    - so kann nach STAC Ressourcen gesucht werden

#### Minimalbeispiel (MICHAEL)

# Unsere Fragen
- Wie laüft die "Kette der Lizensierung"? Ist es so gedacht, dass eine root-Collection eine Lizenz vorgibt und alle sub-Kataloge auch unter dieser Lizenz laufen oder ist dieser semantische Zusammenhang nicht implizit?