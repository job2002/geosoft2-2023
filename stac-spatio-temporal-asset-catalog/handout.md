# Was ist der STAC? (SpatioTemporal Asset Catalog)
- einheitliches Datenformat zur Beschreibung und Katalogisierung von Geodaten
- der STAC ist eine Spezifikation, die von den einzelnen Datenanbieter:innen umgesetzt werden muss. 
- aufbauend auf der Spezifikation gibt es eine Reihe von [Tools](https://stacspec.org/en/about/tools-resources/)
- hinter STAC steht eine aktive Community

# Warum STAC nutzen?
STAC bietet:
- Interoperabilität und Zugänglichkeit von raumbezogenen Daten
- eine Schnittstelle zwischen den unterschiedlichen genutzten Datentypen, -formaten und -sprachen
- persistente Metadaten
- technisch einfache Nutzung durch HTML-Ansatz
    - Anbieter benötigt keine großen Datenbanken und Server
    - einfache Suche über unterschiedliche Suchmaschinen
- Viele [Erweiterungen](https://github.com/radiantearth/stac-spec/tree/master/extensions) (z. B. für Datacubes oder Punktwolken)

# Die STAC-Spezifikation
- besteht aus 4 Teilen:
    - STAC Item, bindet ein einzelnes Asset in STAC-Strukur ein
    - STAC Catalog, eine JSON Datei mit Links zu einzelnen STAC Items/Catalogs/Collections
    - STAC Collection, Erweiterung des STAC Catalogs um Informationen zu den Daten (Lizenz, Schlüsselwörter, Quellen der Daten, etc.)
    - STAC API, RESTful Endpunkt um nach einzelnen STAC Items zu suchen

    > Quelle: https://stacspec.org/en

Diese nennen wir im folgenden _STAC Ressourcen_.

## Die "STAC Ressourcen"
- sobald ein JSON Objekt die notwendigen Schlüssel einer bestimmten STAC Ressource enthält, wird es als diese angesehen
- für alle Schlüssel gibt es weitere Spezifikationen, welche Werte hier erwartet werden
### STAC-Item
- Eine Datei mit Informationen über die Erde die **an einem bestimmten Raum** zu einer **bestimmten Zeit** erfasst wurden.
- ein STAC Item ist ein GeoJSON Feature mit weiteren "foreign members"
    - es ist also ein Superset eines GeoJSONs
- Pflichtschlüssel:
    - type
    - stac_version
    - id
    - geometry
    - bbox
    - properties
    - links
    - assets
> Quelle und weitere Infos: https://github.com/radiantearth/stac-spec/blob/master/item-spec/item-spec.md
### STAC Catalog
- nutzt "Konformitätsklassen" (zeigt welche Standards und Erweiterungen die Daten erfüllen)
- gibt Links zu anderen Endpunkten, die nach der "STAC API - Core" Spezifikation angelegt werden müssen
- ein STAC Catalog ist selbst auch wieder der root-endpoint einer STAC API
- Pflichtschlüssel:
    - type
    - stac_version
    - id
    - description
    - links
> Quelle und weitere Infos: https://github.com/radiantearth/stac-spec/blob/master/catalog-spec/catalog-spec.md
### STAC Collection
- ist ein Superset eines STAC Catalogs (anhand von "type" unterscheidbar)
    - zusätzliche Pflichtschlüssel:
        - license
        - extent
> Quelle und weitere Infos: https://github.com/radiantearth/stac-spec/blob/master/collection-spec/collection-spec.md

### STAC-API (MICHAEL)
- Die STAC API ist eine dynamische Version eines STAC, also eine Implementierung der Spezifikation (https://github.com/radiantearth/stac-api-spec). Die API selbst kann auch wieder unterschiedliche Implementierungen haben
- hat einen root-endpoint (die sog. "landing page") welche selbst ein STAC Catalog ist, welcher zu weiteren STAC Ressourcen verlinkt.
- wird über den GET Endpoint "\<Name eigener STAC>/search?\<searchParams>" erreicht
    - so kann nach STAC Ressourcen gesucht werden

#### Minimalbeispiel (MICHAEL)

# Unsere Fragen
- Wie laüft die "Kette der Lizensierung"? Ist es so gedacht, dass eine root-Collection eine Lizenz vorgibt und alle sub-Kataloge auch unter dieser Lizenz laufen oder ist dieser semantische Zusammenhang nicht implizit?