@ElenaGla @awilberg00

# Containerisierung mit Docker 

![das ist nur ein Test](https://logos-world.net/wp-content/uploads/2021/02/Docker-Logo-2015-2017.png)

## Inhalte
1. Was ist Docker?
1. Warum Containerisierung mit Docker?
1. Wie funktioniert Docker?
1. Bonusmaterial
1. Quellen


## Was ist Docker?
- Ein vielfältiger Begriff:
    - **IT-Software für die Containerisierung von Anwendungen**
    - Unternehmen
    - Community
- IT-Software für die Containerisierung von Anwendungen:
    - Bereitstellung von mobilen, abgekapselten Containern
    - Enthalten Anwendung und alle nötigen Abhängigkeiten
    - Können lokal oder in der Cloud ausgeführt werden
    - Schnelles und einfaches Portieren zwischen verschiedenen Systemen
    - Kostenlos

## Warum Containerisierung mit Docker?
- **Ursprungsproblem:** Abhängigkeiten, die zum Ausführen einer Anwendung nötig sind, sind nicht immer in der Arbeitsumgebung gegeben
- **Folge:** Anwendung läuft bei Person A, aber bei Person B nicht
- **Lösung: Containerisierung mit Docker**
  - Anwendung zusammen mit allen Abhängigkeiten als Container bereitstellen
  - Ermöglicht einfache und schnelle Portabilität von Anwendungen
### Weitere Vorteile:
- **Modularität:** Teile von Anwendungen können aktualisiert oder repariert werden, ohne die gesamte Anwendung deaktivieren zu müssen (Continuous Integration)
- **Schichten:** eingebautes Änderungsprotokoll (bei Änderung von einem Docker-Image wird eine neue Schicht erstellt)
- **Rollback:** Anwendung kann auf ältere Versionen zurückgesetzt werden (Continuous Deployment)
- **Schnelle Bereitstellung von Anwendungen:** dauerte Tage, mittleweile in wenigen Sekunden möglich
### Nachteile:
- Verwaltung von einzelnen Containern problemlos möglich
- Probleme bei Verwaltung von Apps, die in Hunderte Bestandteile (Container) zerlegt sind
- Lösungsmöglichkeit: Container gruppieren
- Dafür nützlich: Kubernetes (Software zur Container-Orchestrierung)
### Docker vs. Virtuelle Maschine
- Gemeinsam: verschiedene IT-Komponenten werden in Paketen vereint und vom Rest des Systems isoliert
- Größte Unterschiede: Skalierbarkeit und Portierbarkeit
- **Docker:**
  - Nur App und alle zum Ausführen erforderlichen Abhängigkeiten
  - Häufig einzelne Funktionen einer App paketiert (Microservices)
  - Nur wirklich notwendige Rechenkapazitäten werden bereitgestellt
  - vergleichsweise kleine Dateien
- **Virtuelle Maschine:**
  - Weitere nicht notwendige Abhängigkeiten, die zu Konflikten führen können
  - Rechenkapazitäten werden reserviert, aber nicht unbedingt genutzt
  - vergleichsweise große Dateien

## Wie funktioniert Docker?
- Voraussetzung: Installation von Docker Desktop
- Verwendet Linux-Kernel
- Läuft bei Mac- und Windowsnutzer über virtuelle Maschine
- Container werden wie modulare virtuelle Maschinen behandelt
- Ermöglicht gleichzeitige Ausführung verschiedener Anwendungen ohne Störungen

### Architektur von Docker 
- **Client:** kommuniziert mit Docker daemon über Schnittstelle (z.B. Kommandozeile)
- **Docker daemon:** reagiert auf Anfragen und verwaltet Images, Container, networks und volumes
- **Docker registries:** Sammlung von Images (z.B. Docker Hub)

### Dockerfile:
- Wird benötigt, um Image zu erstellen
- Befehl, um Image zu erstellen: docker build . –t <username/imagename>
- Schritte werden der Reihe nach ausgeführt
- Punkt, wenn in Projektordner navigiert wurde (aus Befehl)
- Namenskonvention: Image kann direkt dem Docker-Account zugeordnet werden

### Docker Image:
- Eingepackte Anwendung
- Wird aus Dockerfile erstellt
- Besteht aus Schichten
- Änderung = neue Schicht
- Beliebig viele Container können gestartet werden
- Vergleich objektorientiert Programmierung: Image (Klasse), Container (Objekt)

### Docker Container:
- Enthält Anwendung und alle nötigen Abhängigkeiten
- Ausführbare Instanz des Images
- Default: abgekapselter Container
- Verbindung zu anderen Containern und Speicherung von Daten möglich
- Schnittstellen müssen aktiv eingerichtet werden
- Definition durch Image und Befehle beim Starten

### Nützliche Befehle:
- **pull image from docker hub and run it**
  - docker search hello-world
  - docker pull hello-world
  - docker run hello-world
  - docker exec –it <container id> /bin/bash (ermöglicht Navigation zum Dateisystem des Containers)
- **start a docker container**
  - docker run –p [localport:dockerport] –d [imagename]
- **push an image to docker hub**
  - docker tag [repositoryname] [username]/[imagename]:[tag]
  - docker login
  - docker push [username]/[imagename]

### Typische Abläufe:
- Erstellen:
  - Image wird mit Dockerfile erstellt
  - Image wird in Registry gepusht
- Abrufen:
  - Image wird aus Registry gepullt
  - Container wird gestartet

## Bonus
### Docker Compose 
- In der Praxis unverzichtbar
- Szenario: Webanwendung läuft nicht ohne Datenbank (zwei abgekapselte Container)
- Ermöglicht Management und Verknüpfung von mehreren Containern
- Konfiguration in einer einzigen YAML-Datei
- Enthält Definition von Abhängigkeiten (z.B. zuerst Datenbank, dann Anwendung starten)
- Alle darin enthaltenen Container lassen sich gleichzeitig starten und stoppen

### Docker Volumes
- Erinnerung: Docker-Image besteht aus Schichten
- Neue Schicht, wenn Container gestartet wird
- Schicht geht verloren, wenn Container gestoppt wird (auch Daten gehen verloren)
- Ermöglicht Austausch und dauerhaftes Speichern von Daten aus einem Container
- Speicherung außerhalb des Containers auf dem Host-Computer

## Quellen
- DOCKER INC. (o.J.): Docker overview. Online unter: https://docs.docker.com/get-started/overview/ (abgerufen am 05.10.2023)
- IONOS SE (2023): Compose: Docker-Container-Anwendungen orchestrieren. Online unter: https://www.ionos.de/digitalguide/server/konfiguration/docker-compose-tutorial/ (abgerufen am 10.10.2023)
- IONOS SE (2022): Docker-Container-Volumes verstehen und verwalten. Online unter: https://www.ionos.de/digitalguide/server/knowhow/docker-container-volumes/ (abgerufen am 10.10.2023)
- KRIEG, D. (2023): Cloud Technologies. Online unter: https://saracus.com/synvert-saracus-blog/docker-ein-blick-in-die-welt-der-containerisierung/ (abgerufen 
am 15.09.2023)
- RED HAT (2023): Was ist Docker? Welche Vorteile bietet Containerisierung? Online unter: https://www.redhat.com/de/topics/containers/what-is-docker 
(abgerufen am 05.10.2023)
- U-LABS (2021): Einführung: Das ist Docker-Compose und so installierst du es auf dem Raspberry Pi! Online unter: https://u-labs.de/portal/einfuehrung-das-ist-docker-compose-und-so-installierst-du-es-auf-dem-raspberry-pi/ (abgerufen am: 10.10.2023)







