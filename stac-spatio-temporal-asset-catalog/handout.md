# Was ist der STAC?
- einheitliches Datenformat zur Beschreibung und Katalogisierung von Geodaten
- der STAC ist eine Spezifikation, die von den einzelnen Datenanbieter:innen umgesetzt werden muss. 
- Nutzt "maturity classifications" um anderen Nutzer:innen zu zeigen, wie wahrscheinlich es ist, dass sich eine Erweiterung in Zukunft ändert

# Warum STAC nutzen?

## Die STAC-Spezifikation
- besteht aus 4 Teilen:
    - STAC Item, beschreibt ein einzelnes Asset.
    - STAC Catalog, eine JSON Datei mit Links zu einzelnen STAC Items
    - STAC Collection, Erweiterung des STAC Catalogs um Informationen zu den Daten (Lizenz, Schlüsselwörter, Quellen der Daten, etc.)
    - STAC API, RESTful Endpunkt um nach einzelnen STAC Items zu suchen

    > Quelle: https://stacspec.org/en

Diese nennen wir im folgenden _STAC Ressourcen_.

## Die "STAC Ressourcen"
### STAC-Item
- Eine Datei mit Informationen über die Erde die **an einem bestimmten Raum** zu einer **bestimmten Zeit** erfasst wurden.
- ein STAC Item ist ein GeoJSON Feature mit weiteren "foreign members"
    - es ist also ein Superset eines GeoJSONs
- sobald ein JSON Objekt die notwendigen Schlüssel eines STAC Items enthält, wird es als STAC Item angesehen (https://github.com/radiantearth/stac-spec/blob/master/item-spec/item-spec.md)
    - Pflichtschlüssel:
        - type
        - stac_version
        - id
        - geometry
        - bbox
        - properties
        - links
        - assets
### STAC Catalog
- nutzt "Konformitätsklassen" (WAS SIND DAS???!)
- gibt Links zu anderen Endpunkten, die nach der "STAC API - Core" Spezifikation angelegt werden müssen
- ein STAC Catalog ist selbst auch wieder der root-endpoint einer STAC API
- 

### STAC Collection
- sobald ein JSON Objekt die notwendigen Schlüssel einer STAC Collection enthält, wird es als STAC Collection angesehen
    - Pflichtschlüssel:
        - type
        - stac_version
        - id
        - description
        - license
        - extent
        - links
    - ist ein Superset eines STAC Catalogs (mit Ausßnahme des "type")

### STAC-API
- Die STAC API ist eine dynamische Version eines STAC, also eine Implementierung der Spezifikation (https://github.com/radiantearth/stac-api-spec). Die API selbst kann auch wieder unterschiedliche Implementierungen haben
- hat einen root-endpoint (die sog. "landing page") welche selbst ein STAC Catalog ist, welcher zu weiteren STAC Ressourcen verlinkt.
- wird über den GET Endpoint "\<Name eigener STAC>/search?\<searchParams>" erreicht
    - so kann nach STAC Ressourcen gesucht werden

#### Minimalbeispiel

# Unsere Fragen
- Wie laüft die "Kette der Lizensierung"? Ist es so gedacht, dass eine root-Collection eine Lizenz vorgibt und alle sub-Kataloge auch unter dieser Lizenz laufen oder ist dieser semantische Zusammenhang nicht implizit?