# Was ist der STAC? (TIM)
- einheitliches Datenformat zur Beschreibung und Katalogisierung von Geodaten
- der STAC ist eine Spezifikation, die von den einzelnen Datenanbieter:innen umgesetzt werden muss. 
- Nutzt "maturity classifications" um anderen Nutzer:innen zu zeigen, wie wahrscheinlich es ist, dass sich eine Erweiterung in Zukunft ändert

# Warum STAC nutzen? (TIM)

## Die STAC-Spezifikation (TIM)
- besteht aus 4 Teilen:
    - STAC Item, beschreibt ein einzelnes Asset.
    - STAC Catalog, eine JSON Datei mit Links zu einzelnen STAC Items
    - STAC Collection, Erweiterung des STAC Catalogs um Informationen zu den Daten (Lizenz, Schlüsselwörter, Quellen der Daten, etc.)
    - STAC API, RESTful Endpunkt um nach einzelnen STAC Items zu suchen

    > Quelle: https://stacspec.org/en

Diese nennen wir im folgenden _STAC Ressourcen_.

## Die "STAC Ressourcen" (TIM)
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
- sobald ein JSON Objekt die notwendigen Schlüssel einer STAC Collection enthält, wird es als STAC Collection angesehen.
    - Pflichtschlüssel:
        - type
        - stac_version
        - id
        - description
        - license
        - extent
        - links
    - ist ein Superset eines STAC Catalogs (mit Ausßnahme des "type")

### STAC-API (MICHAEL)
- Die STAC API ist eine dynamische Version eines STAC, also eine Implementierung der Spezifikation (https://github.com/radiantearth/stac-api-spec). Die API selbst kann auch wieder unterschiedliche Implementierungen haben.
- hat einen _root-endpoint_ (die sog. "landing page") welche selbst ein STAC Catalog ist, welcher zu weiteren STAC Ressourcen verlinkt.
- wird über den GET Endpoint "\<URL zum STAC>/search?\<searchParams>" erreicht.
    - so kann nach STAC Ressourcen gesucht werden.
- ist wieder eine Spezifikation, besteht aus 3 Grundspezifikationen:
    - _STAC API - Core_
    - _STAC  API - Collections and Features_
    - _STAC API - ItemSearch_

sowie einer Erweiterung durch [Extensions](#extensions) aus der Community.
- Rückgaben einer STAC API sind [Catalogs](#stac-catalog), [Collections](#stac-collection) oder [Items](#stac-item) (als JSON-Objekt) oder eine [ItemCollection](#stac-itemcollection) (eine FeatureCollection, die widerrum nur _STAC Ressourcen_ enthält)
(https://github.com/radiantearth/stac-api-spec#about)

#### Unterschied zum OGC API - Features (OAFeat) Standard
- _STAC API - Collections_ erlaubt eine Suche zwischen unterschiedlichen Collections (dies wird derzeit nicht durch _OAFeat_ unterstüzt). 
(https://github.com/radiantearth/stac-api-spec/blob/main/overview.md#collections-and-features)
- _STAC API - Features_ legt zwingend fest, dass zurückgebene Features das Format eines [STAC Items](#stac-item) haben. Der OAFeat Standard legt nur fest, das die Rückgabe ein "Feature" sein muss, ohne dessen Struktur näher festzulegen.
(https://github.com/radiantearth/stac-api-spec/blob/main/overview.md#collections-and-features)
#### STAC API - Core
- wird diese _Konformitätsklasse_ implementiert, so muss die API folgende Funktionen bieten:
    1. einen "/" GET Endpoint, der eine sog. "landing page" bereitsstellt. Dies ist ein [STAC Catalog](#stac-catalog), der alle Sub-Catalogs und/oder [STAC Item](#stac-item)s enthält, die in diesem STAC zur Verfügung stehen.
    2. einen **"conformsTo"** Schlüssel, der URIs zu allen Konformitätsklassen angibt, die durch diesen STAC erfüllt werden.
        - muss nur im root-Catalog exisitieren.
    3. ein **"links"** Attribut, dass Relationen zu allen in (1.) genannten Features enthält.
    4. einen "/api" GET Endpoint, der eine "service_desc" zurückgibt. Dieser beschreibt, was die STAC API bietet/leistet.
- jede STAC API muss mindestens diese _Konformitätsklasse_ implementieren.

#### STAC API - Collections and Features
- legt Endpoints und Relationen fest, die definieren wie die API Zugriff auf Collections und Items im STAC gewährt.
- Ist aufgeteilt in zwei _Konformitätsklassen_:
    - _STAC API - Features_
    - _STAC API - Collections_

diese implementieren widerrum unterschiedliche OGC API Standards. Für nähere Informationen verweisen wir auf die [Dokumentation der STAC API - Collections and Features Konformitätsklasse](https://github.com/radiantearth/stac-api-spec/tree/main/ogcapi-features), da dieses Handout ansonsten seinen Fokus verliert und zu sehr abschweift.


(https://github.com/radiantearth/stac-api-spec/tree/main/core#core)

#### STAC API - ItemSearch
- wird diese _Konformitätsklasse_ implementiert, so muss die API folgende Funktionen bieten:
    1. eine Relation in "links" der "landing page", die auf den "/search" Endpoint verweist.
    2. einen "/search" GET Endpoint, an den Suchanfragen mit "searchParams" gestellt werden können. Folgende Parameter werden unterstützt:
        - limit
        - bbox
        - datetime
        - intersects
        - ids
        - collections
- _STAC API - ItemSearch_ definiert einen einheitlichen Endpoint, um STAC Ressourcen in einer STAC API zu durchsuchen und erhaltene Ergebnisse zu filtern. Dies unterstützt die Nutzbarkeit dieses Standards und erleichtert auch das Arbeiten mit "fremden" STAC Implementierungen. 
- _STAC API - ItemSearch_ gibt eine kleine Menge an Suchparametern vor. Weitere Suchparameter können im Rahmen von [Extensions](#extensions) durch die Community ergänzt werden.
(https://github.com/radiantearth/stac-api-spec/tree/main/item-search#overview)

#### Extensions
- durch die Community entwickelte Erweiterungen zur STAC API/ dem STAC selbst. 
- werden durch "maturity classification" nach ihrem Entwicklungsgrad geordnet, sodass Nutzer:innen aus der Community sehen können, wie weit die Extension schon entwickelt ist und ob mit häufigen Updates zu rechnen ist.

#### STAC ItemCollection
- eine ItemCollection ist eine JSON FeatureCollection mit weiteren "foreign members". Sie enthält i.d.R. widerrum [Catalogs](#stac-catalog), [Collections](#stac-collection) und/oder [Items](#stac-item).
(https://github.com/radiantearth/stac-api-spec#about)




#### WIE WIRD SICHERGESTELLT, DASS ALLE IMPLEMENTIERUNGEN DIESE STANDARDS EINHALTEN???

#### Minimalbeispiel (MICHAEL)
**"landing page"**
```JSON
{
    "stac_version": "1.0.0",
    "id": "münster-stac-api",
    "title": "simple STAC Implementierung",
    "description": "Dieser Katalog ist eine Implementierung der STAC API",
    "type": "Catalog",
    "conformsTo" : [
        "https://api.stacspec.org/v1.0.0/core"
    ],
    "links": [
        {
            "rel": "self",
            "type": "application/json",
            "href": "https://localhost:3000"
        },
        {
            "rel": "root",
            "type": "application/json",
            "href": "https://localhost:3000"
        },
        {
            "rel": "service-desc",
            "type": "application/vnd.oai.openapi+json;version=3.0",
            "href": "https://localhost:3000/api" // NOTE Was für eine Datei mus das sein?
        },
        {
            "rel": "service-doc",
            "type": "text/html",
            "href": "https://localhost:3000/api.html"
        },
        {
            "rel": "child",
            "type": "application/json",
            "href": "https://localhost:3000/gebäude-in-münster/collection.json"
        },
    ]
}
```


**STAC Item**
```JSON
{
    "stac_version": "1.0.0",
    "type": "Feature",
    "id": "1",
    "bbox": [
        7.612887627573883,
        51.96309881413666, 
        7.613662225863266,
        51.96417021332829
        ],
    "properties": {
        "name": "Schloss Münster",
    },
      "geometry": {
        "coordinates": [
          7.613129509789644,
          51.96360648451028
        ],
        "type": "Point"
      },
    "collection": "gebäude-in-münster",
    "links": [
        // URI zu diesem Item
        {
            "rel": "self",
            "href": "http://localhost:3000/gebäude-in-münster/1.json",
            "type": "application/geo+json"
        },
        // Die root URI aller Collections in diesem STAC
        {
            "rel": "root",
            "href": "http://localhost:3000/catalog.json",
            "type": "application/json"
        },
        // die Eltern Collection dieses Items
        {
            "rel": "parent",
            "href": "http://localhost:3000/gebäude-in-münster/collection.json",
            "type": "application/json"
        },
        // die Collection, aus der dieses Item stammt
        {
            "rel": "collection",
            "href": "http://localhost:3000/gebäude-in-münster/collection.json",
            "type": "application/json"
        },
    ],
    "assets": {}    // wir stellen uns vor, das Asset wäre ein Foto
}

{
    "stac_version": "1.0.0",
    "type": "Feature",
    "id": "2",
    "bbox": [
        7.5998111356582285,
        51.96523053575359,
        7.600521395257971,
        51.96581649639717
        ],
    "properties": {
        "name": "Mensa am Ring",
    },
      "geometry": {
        "coordinates": [
          7.60018432290525,
          51.965556894525406
        ],
        "type": "Point"
      },
    "collection": "gebäude-in-münster",
    "links": [
        // URI zu diesem Item
        {
            "rel": "self",
            "href": "http://localhost:3000/gebäude-in-münster/2.json",
            "type": "application/geo+json"
        },
        // Die root URI aller Collections in diesem STAC
        {
            "rel": "root",
            "href": "http://localhost:3000/catalog.json",
            "type": "application/json"
        },
        // die Eltern Collection dieses Items
        {
            "rel": "parent",
            "href": "http://localhost:3000/gebäude-in-münster/collection.json",
            "type": "application/json"
        },
        // die Collection, aus der dieses Item stammt
        {
            "rel": "collection",
            "href": "http://localhost:3000/gebäude-in-münster/collection.json",
            "type": "application/json"
        },
    ],
    "assets": {}    // wir stellen uns vor, das Asset wäre ein Foto
}
```

**STAC Catalog**
```JSON
{
    "stac_version": "1.0.0",
    "type": "Catalog",
    "id": "gebäude-in-münster",
    "title": "Auflistung von Gebäuden aus Münster.",
    "description": "Dies ist eine Beispielkollektion, daher hat sie keine tiefere Funktion, die man hier im Detail erklären kann.",
    "links": [
        {
            "rel": "item",
            "href": "http://localhost:3000/collections/gebäude-in-münster/items/1.json",
            "type": "application/geo+json"
        },
        {
            "rel": "item",
            "href": "http://localhost:3000/collections/gebäude-in-münster/items/2.json",
            "type": "application/geo+json"
        },
    ],
}
```
> **Hinweis:** Der STAC Catalog ist in diesem Beipiel nur eine vereinfachte Version der nun folgenden STAC Collection. Er wird daher nicht in der Beispielimplementierung genutzt. (HIER LINK ZUR WEB API DIE WIR NOCH ERSTELLEN EINFÜGEN) 


**STAC Collection**
```JSON
{
    "stac_version": "1.0.0",
    "type": "Collection",
    "id": "gebäude-in-münster",
    "title": "Auflistung von Gebäuden aus Münster.",
    "description": "Dies ist eine Beispielkollektion, daher hat sie keine tiefere Funktion, die man hier im Detail erklären kann.",
    "links": [
        {
            "rel": "root",
            "href": "https://localhost:3000/catalog.json",
            "type": "application/json",
        },
        {
            "rel": "self",
            "href": "http://localhost:3000/collections/gebäude-in-münster/collection.json",
            "type": "application/json"
        },
        {
            "rel": "item",
            "href": "http://localhost:3000/collections/gebäude-in-münster/items/1.json",
            "type": "application/geo+json"
        },
        {
            "rel": "item",
            "href": "http://localhost:3000/collections/gebäude-in-münster/items/2.json",
            "type": "application/geo+json"
        },
    ],
    "license": "proprietary",
    "extent": {
        // räumliche Verteilung der Aufnahmen
        "spatial": {
            "bbox": [
                [
                    7.599704413618184,
                    51.96308214659746,
                    7.613861163919182,
                    51.96612881575555
                ]
            ]
        },
        // Datum der Aufnahmen im RFC 3339 Standard
        "temporal": "2023-09-16T13:56:46+00:00",
    }

}
```



# Unsere Fragen
- Wie laüft die "Kette der Lizensierung"? Ist es so gedacht, dass eine root-Collection eine Lizenz vorgibt und alle sub-Kataloge auch unter dieser Lizenz laufen oder ist dieser semantische Zusammenhang nicht implizit?