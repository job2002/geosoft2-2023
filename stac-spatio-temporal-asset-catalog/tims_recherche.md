# STAC
## Was ist der STAC?
STAC steht für SpatioTemporal Asset Catalog 


**ÜBERARBEITEN MIT** : https://stacspec.org/en/tutorials/intro-to-stac/

### Standard (STAC Spec)
- Aufbauend auf GeoJSON-Format
- Grundstruktur eines [STAC-ITEMs](https://github.com/radiantearth/stac-spec/blob/master/item-spec/item-spec.md): 
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
- Weitere Spezifikationen für: [Catalog](https://github.com/radiantearth/stac-spec/blob/master/catalog-spec/catalog-spec.md), [Collection](https://github.com/radiantearth/stac-spec/blob/master/collection-spec/collection-spec.md),  [API](https://github.com/radiantearth/stac-api-spec)
- JSON-Kernseiten können in durchsuchbare, interaktive HTML-Seiten umgewandelt werden
- Durch JSON-Format flexibel (neue Attribute)
- Viele [Erweiterungen](https://github.com/radiantearth/stac-spec/tree/master/extensions) (z. B. für Datacubes oder Punktwolken)

### Community
- Anbieter und Nutzer von raumbezogenen Daten
- Zusammenarbeit mit anderen Standardisierungsorganisationen
- Fokus auf Interoperabilität und Open Source
- [Gitter-Community](https://gitter.im/SpatioTemporal-Asset-Catalog/Lobby)

### Tools
- Aufbauend auf den STAC spec gibt es eine Reihe von [Tools](https://stacspec.org/en/about/tools-resources/):
- Diese decken unter anderem Bereiche wie Client, Server, API und CLI ab, sowie Data Creation, Processing, Visualization und Validation
- Dabei wird ein breites Spectrum von Programmiersprachen abgedeckt

## Warum STAC nutzen?
STAC bietet:
- Interoperabilität und Zugänglichkeit von raumbezogenen Daten
- eine Schnittstelle zwischen den unterschiedlichen genutzten Datentypen, -formaten und -sprachen
- persistente Metadaten
- technisch einfache Nutzung durch HTML-Ansatz
    - Anbieter benötigt keine großen Datenbanken und Server
    - einfache Suche über unterschiedliche Suchmaschinen

## Wie nutzt man den STAC?
Vorgefertigte STAC-Tools können bei der Nutzung helfen ([siehe Abschnitt "tools"](#tools))

### Als Anbieter
1. Daten STAC-spec-konform (inkl. Metadaten) aufbereiten
2. Daten per STAC-API hosten und somit veröffentlichen

### Als Nutzer
1. Suche z. B. in den [STAC-Datasets](https://stacspec.org/en/about/datasets/) nach beliebigen Daten, die die STAC spec erfüllen (u. a. openEO)
2. Egal von wem du welche Daten beschaffst, sie sind immer in dem gleichen Format

## Was sind Herausforderungen vom STAC?
- Komplexität von Geodaten und deren Metadaten 
- Uneinheitlichkeit der verwendeten Formate
- Versionierung von STAC selbst (stetiger Prozess)
- Verbreitung in der Praxis

## Quellen
- [stacspec.org](https://stacspec.org/en)
- [github.com/radiantearth/stac-spec/](https://github.com/radiantearth/stac-spec/)