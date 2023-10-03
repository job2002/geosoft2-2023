# Geosoftware II handout Micro-Services (WiSe 2023/24)

Autoren: [@astru03](https://github.com/astru03) & [@GolfEchoOscar](https://github.com/GolfEchoOscar)

## Was sind Micro-services?

Der Begriff „Micro-services“ wurde bei einem Softwarearchitekturworkshop im Jahr 2012 geprägt (JAX Blog - Und jetzt? Microservices nach dem Hype). Internetpioniere wie Amazon und Netflix hatten bis dato noch eine monolithische Softwarearchitektur. Mit dem rasant wachsenden Erfolg der Unternehmen war die Fehlerbehebung und Weiterentwicklung der Software immer schwieriger und träger geworden, sodass neue Ideen für alternative Softwarearchitekturen benötigt wurden (msg-group - Sind Microservices die bessere SOA?). So entstand die Idee der Micro-services.

Micro-services ist ein Software-Architekturstil, bei dem die Software aus einem Zusammenspiel kleinerer Services besteht (martinfowler - Mikrodienste eine Definition dieses neuen Architekturbegriffs). Die Anwendung ist dabei so aufgebaut, dass Services innerhalb einer Software unabhängig voneinander funktionieren, diese jedoch untereinander interagieren können um so eine Softwareanwendung zu betreiben.

## Warum verwendet man Micro-services? Why?

Micro-services werden angewendet weil sie einige Vorteile im Vergleich zur traditionellen Monolithischen Softwarearchitektur aufweisen.

**Vorteile**
* Micro-services erzwingen eine Aufteilung der einzelnen Services einer Anwendung.
* Durch die Unabhängigkeit der Micro-services voneinander, ist die Entwicklung und Anpassung der gesamten Anwendung schneller und agiler.
* Micro-services sind schnell skalierbar.
* Enge Absprach zwischen den Teams ist nicht erforderlich.
* Es können keine unerwünschten und versteckten Abhängigkeiten zwischen Services/Funktionen entstehen.
* Die einzelnen Services können mit unterschiedlichen Technologien, Versionen und Sprachen entwickelt werden. Große und risikoreiche Technologie-Update können vermieden werden.
* Services können einzeln getestet und ausgeliefert werden, wodurch insgesamt kürzere Auslieferungszeiträume möglich sind.

**Nachteile**
* Der dezentrale Ansatz, von Micro-services, ohne irgendeine Art von zentraler Steuerung der einzelnen Services, ist schlecht beherrschbar. Es kann schwierig werden ein Überblick über alle verwendeten * Services zu behalten und die Wiederverwendung von Services zu kontrollieren. Abhilfe dafür schaffen Tools, wie z.b. Kubernetes. (msg-group - Sind Microservices die bessere SOA?).
* Es gibt kein einheitliche Vorgehensbeschränkung. Ist ein Micro-service nun eine eigenständige Webanwendung mit Benutzeroberfläche oder wirklich nur ein Webservice der auf anderem Wege integriert werden muss (msg-group - Sind Microservices die bessere SOA?).
* Micro-services akzeptieren ein gewisses Maß an Redundanz zwischen Services, wie jedoch die Verteilung und der Abgleich der Daten erfolgt, darüber macht der Architekturstil Micro-services keine Aussage (msg-group - Sind Microservices die bessere SOA?).
* Es gibt für viele Herausforderungen noch keine Standardlösungen (msg-group - Sind Microservices die bessere SOA?).
* Wenn ein Service nicht erreichbar ist kann keine Kommunikation zwischen zwei Services stattfinden. Ggf. wird auf ein anderen Service zugegriffen und dadurch ein anderes ggf. falsches Ergebnisse erhalten.
* Datenbanken werden voneinander separiert. Fremdschlüssel-Verknüpfungen zwischen zwei Micro-services sind nicht mehr möglich. Die Aufrechterhaltung der Datenintegrität wird auf den Anwendungsbereich verschoben.

## Wie Funktionieren Micro-services? How?
**Unterschied zwischen Monolith-Architektur und Micro-service-Architektur:** <br />
 ![sketch](https://github.com/astru03/geosoft2-2023/assets/134288087/65847f6f-846d-4e5a-a1f5-f347660e0bea) <br />
https://martinfowler.com/articles/microservices/images/sketch.png

| Monolith-Architektur | Microservice-Architektur |
| -------- | -------- |
| Alle Services sind Teil einer Einheit | Anwendung besteht aus mehreren kleinen Services   |
| Entwicklung und Ausliferung geschieht als eine EInheit.   | Services sollten unabhängig voneinander und in sich geschlossen sein  |
| Anwendung basiert und läuft auf einer Technologie unter Verwendung einer vordefinierten Sprache und auf einer Laufzeitumgebung. |  Jeder Service kan eigenständig entwickelt, installiert, betrieben, überwacht und ausgeliefert werden. |
| Organisation der Teammitglieder geschieht vor allem auf technischer Ebene. (Ein Team für die Benutzeroberfläche, ein Team für die Datenhaltung, ein Team für die Geschäftslogik.) | Services können aber natürlich untereinander interagieren. |
| | Die Aufteilung der Services für eine Anwendung erfolgt zumeist anhand der Geschäftsfunktionalitäten (Bsp. Useraccount, Produkte, Bezahlung) und nicht nach der technischen Funktionalität. |
|  | Ein Service sollte immer nur eine Geschäftsfunktionalitäten (Aufgabe) beinhalten/abarbeiten. Dadurch haben Micro-services auch Auswirkung auf die Organisation der Teammitglieder. |
|  | Teams werden gebildet nach Geschäftsfunktionalitäten (Ein Team für den Useraccount, eins für die Produkte etc.)|

Microservices werden oft mit monolithischer Softwareachritektur verglichen.
Monolithische Architektur ist vergleichbar mit einer All-in-one Küchenmaschine, die den Teig rührt, knetet, ruhen lässt und anschließend backt.
Microservices dagegen sind kleine klar definierte Komponenten, die die Lösung eines Problems übernehmen und nür über eine Schnittstelle (API) kommunizieren.

Würde man die All-in-one Küchenmaschine in Microservices umwandeln wollen, würden wir zuerst die einzelnen zu lösenden Aufgaben herauskristallisierien. In dem Küchenmaschinenbeispiel würden folgende zu lösende Aufgaben entstehen:

- rühren
- kneten
- backen
  
Für das Rühren, das Kneten und das Backen würden wir jeweils einen eigenen Microservice enwtickeln und bereitsstellen. Den Mixer, das Knetgerät und einen Backofen.
Dafür könnten drei Teams gebildet werden, die je ein Microservice entwickeln. Durch die Unabhängigkeit der einzelnen Komponenten muss nicht auf den Fortschritt eines anderen Teams gewartet werden. Die drei Teams können die Entwicklung parallel starten und durchführen. <br />
![Team](https://github.com/astru03/geosoft2-2023/assets/134288087/85d85c31-7d1d-4bfc-bb00-e4f516b0796b) <br />
https://jax.de/blog/microservices-nach-dem-hype/

**Kommunikation zwischen Microservices** <br />
Auch bei Microservices können Abhängigkeiten untereinander entstehen. Diese sollten so gering wie möglich gehalten werden, da es sonst dem Prinzip der Microservice-Architektur widerspricht.
Für die Kommunikation zwischen den verschiedenen Microservices gibt es zwei Ansätze. Die bevorzugte “Asynchrone Kommunikation” und die “Synchrone Kommunikation” (SDX - Microservices – Kommunikation).

**_Asynchrone Kommunikation_** <br />
Bei der Asynchronen Kommunikation werden Nachrichten geschickt, ohne auf eine direkte Antwort (Abhängigkeit) warten zu müssen. Dieses Prinzip kann mit Hilfe eines Messaging-Systems realisiert werden. An dieses System können Nachrichten/Anfragen gesendet werden (ähnlich wie eine Warteschlange), die von anderen Microservices bearbeitet werden. Dadurch ist die Kapselung und die Unabhängigkeit der Microservices untereinander so weit es geht gegeben (SDX - Microservices – Kommunikation). <br />
![Asynchrone Kommunikation](https://cdnp-sdxhomepage-static-prod.azureedge.net/wp-content/uploads/2016/10/micorservices-3.2.jpg) <br /><br />
https://www.sdx-ag.de/2016/11/microservices-kommunikation/

**_Synchrone Kommunikation_** <br />
Bei der Synchronen Kommunikation, wird auf eine direkte Antwort gewartet, wodurch Abhängigkeiten entstehen. Um diese so gering wie möglich zu halten, sollten die Aufrufe nur in einer Richtung verlaufen (SDX - Microservices – Kommunikation). <br />
![Synchrone Kommunikation](https://cdnp-sdxhomepage-static-prod.azureedge.net/wp-content/uploads/2016/09/microservices5-e1477492451414.jpg) <br />
https://www.sdx-ag.de/2016/11/microservices-kommunikation/

Aber was spricht für diese Vorgehensweise? Wann könnte es Sinn machen auf eine monolithische Architektur zu verzichten und sein Programm in Microservices zu unterteilen?

## Wann macht der Einsatz von Micro-services Sinn? When?
Es gibt keine Einheitliche Definition, ab wann der Einsatz von Micro-services Sinn macht. Generell kann man aber sagen, dass es erst für große Anwendungsprojekte mit einer hohen Anzahl von Teammitgliedern Sinn macht, da der Arbeitsaufwand für die Einrichtung einer Anwendung basierend auf einer Micro-services-Architektur zu groß ist. Daraus ergibt sich, dass die Einführung einer Micro-services Architektur immer dann Sinnvoll ist, wenn die Weiterentwicklung und Wartung der Anwendung, aufgrund ihrer Größe, zu träge wird und damit zu viel kosten verursacht.
Für kleine Anwendungen wird empfohlen, jeden Services in der Anwendung mit einer klar vordefinierten Schnittstelle zu entwerfen. Wenn die Anwendung schließlich eine Größe erreicht hat, an der es Sinn macht eine Micro-services-Architektur einzusetzen, kann so eine Migration besser koordiniert werden. <br />
https://www.youtube.com/watch?v=lTAcCNbJ7KE
<br />

Microservice-Architektur kann vor allem dann sinnvoll sein, wenn eine hohe Ausfallsicherheit erforderlich ist.
Küchenmaschinen-Beispiel:
Kommt es in dem monolithischen All-in-one Küchengerät (aus dem obigen Beispiel) zu einem Kurzschluss, ist das gesamte Gerät außer Betrieb. Es kann weder der Teig gerührt, geknetet noch gebacken werden. Die komplette Anwendung ist so lange offline/handlungsunfähig, bis der Kurzschluss repariert und die Maschine einsatzbereit ist.

Kommt es hingegen beim Microservice-Pendant zu einem Problem eines Einzelgerätes (Mixer, Knetgerät, Backofen), können die anderen Geräte weiterhin ihre Arbeit verrichten. Fällt der Backofen aus, kann der Teig weiterhin vorbereitet (gerührt und geknetet) werden. Sobald der Backofen einsatzbereit ist, können die vorbereiteten Portionen abgearbeitet werden

## Wie können Micro-services mit Docker-Compose verwaltet werden?
Micro-services können als Docker-Container umgesetzt werden. Damit bietet Docker-Compose eine Möglichkeit, Micro-services zu koordinieren und deren konsistente Kommunikation sicherzustellen (DZone - Manage Microservices With Docker Compose).

* Docker-File: Ist ein Textdokument, das Anweisungen zum Erstellen von Docker-Images enthält.
* Docker-Image: Docker-Images fungieren als eine Reihe von Anweisungen zum Erstellen eines Docker-Containers.
* Docker-Container: Ist ein leichtes, eigenständiges, ausführbares Softwarepaket, das alles enthält, was zum Ausführen einer Anwendung erforderlich ist.

Damit die Verwaltung der Micro-services über Docker Compose geschehe kann, muss zunächst für jeden Services ein Dockerfile erstellt werden. In diesen werden alle benötigten Befehle eingerichtet um aus dem Service ein Image zu erstellen. Aus dem Image kann dann ein Container gebaut werden, welches ein Softwarepaket darstellt, das alles enthält, was zum Ausführen eines Services als Anwendung erforderlich ist.

**Aufbau eines Dockerfile** <br />
FROM -> Spezifiziert das Basis-Image. <br />
LABLE -> Liefert Metadaten. Wer stellt das File bereit? <br />
COPY -> Kopiert Dateien und Verzeichnisse in den Container. <br />
ENTRYPOINT -> Stellt Befehle und Argumente für einen ausführenden Container bereit. <br />

Weitere Dockerfile-Befehle können unter folgenden Link nachgeschlagen werden: <br />
https://dzone.com/articles/understanding-dockerfile

**Docker Compose** <br />
Mit Docker-Compose können YAML-Dateien erstellt werden, um die einzelnen Services und deren Abhängigkeiten zu definieren. Der große Vorteil von Docker-Compose besteht darin, dass alle verwendeten Services in einer Datei aufgelistet sind und es anderen eine einfache Möglichkeit bietet, weitere Services zum Projekt hinzuzufügen (Docker-docs - Use Docker Compose).
Eine YAML-Datei enthält Containerdetails, Konfigurationen und Befehle, die von Docker-Compose ausgeführt werden. Jeder Service kann dabei, spezifische Unterpunkten beinhaltet (DZone - Manage Microservices With Docker Compose).

**Aufbau eines Docker-compose.yml** <br />
```
services:
	mongo-db:
	    container_name:  mongo-db  
	    image: mongodb
	    port:
	        - '8888:8888'
	    ...
	config-server:
	    container_name: config-server
	    depents_on:
	        - mongo-db
	    ...
```
Weitere Docker-compose.yml Befehle können unter folgenden Link nachgeschlagen werden: <br />
https://docs.docker.com/compose/compose-file/05-services/
https://docs.docker.com/get-started/08_using_compose/

Das in der Abbildung dargestellte Beispiel für die Verwaltung von Micro-services über Docker-Compose, kann über folgenden Link detailliert nachvollzogen werden. <br />
https://dzone.com/articles/manage-microservices-with-docker-compose <br />
![Unterschied zwischen Monolith-Architektur und Micro-service-Architektur.](https://dz2cdn3.dzone.com/storage/temp/16332748-1666720612139.png) 


## Literaturverzeichnis
JAX Blog - Und jetzt? Microservices nach dem Hype <br />
  https://jax.de/blog/microservices-nach-dem-hype/ <br /> (abgerufen am 01.10.2023)
  
msg-group - Sind Microservices die bessere SOA? <br />
  https://publikation.msg.group/publikationsarchiv/fachartikel/158-beitrag-im-public-kundenmagazin-sind-microservices-die-bessere-soa/file <br /> (abgerufen am 01.10.2023)
  
martinfowler - Mikrodienste eine Definition dieses neuen Architekturbegriffs <br />
  https://martinfowler-com.translate.goog/articles/microservices.html?_x_tr_sl=en&_x_tr_tl=de&_x_tr_hl=de&_x_tr_pto=rq <br /> (abgerufen am 01.10.2023)
  
DZone - Manage Microservices With Docker Compose <br />
  https://dzone.com/articles/manage-microservices-with-docker-compose <br /> (abgerufen am 02.10.2023)
  
Docker-docs - Use Docker Compose <br />
  https://docs.docker.com/get-started/08_using_compose/ <br /> (abgerufen am 02.10.2023)

SDX - Microservices – Kommunikation <br />
  https://www.sdx-ag.de/2016/11/microservices-kommunikation/ <br /> (abgerufen am 03.10.2023)
