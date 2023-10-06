# AWS - Amazon Web Services

## Was ist AWS?

![aws Logo](https://a0.awsstatic.com/libra-css/images/logos/aws_logo_smile_1200x630.png)
Amazon Web Services (AWS) ist eine nach eigenen Angaben führende Cloud-Computing-Plattform und stellt IT-Ressourcen für Unternehmen und Entwickler bereit. Statt eigene Server zu betreiben, können Unternehmen die IT-Infrastrukturen und Dienste der Tochterfirma von Amazon nutzen. Dies umfasst sowohl Infrastrukturlösungen wie Compute-Ressourcen, Speicher und Datenbanken als auch Lösungen zu aktuellen Trends wie Machine Learning, Künstliche Intelligenz oder Internet of Things.

## Historie

AWS wurde 2006 als Tochterunternehmen vom Online-Versandhändler Amazon.com gegründet um Entwicklern eine IT-Infrastruktur anbieten zu können. Der Fokus lag von Beginn an auf den Unternehmen statt auf den Endverbrauchern. Amazon selbst wollte für die eigene Plattform wiederverwendbare Module herstellen, die auch Dritten angeboten werden sollten. Der erste Server für aws-Dienste wurde in Südafrika entwickelt.
Seit 2010 gibt es ein kostenloses Angebot für AWS als Reaktion auf konkurrierende Projekte. Mittlerweile gibt es Konkurrenzunternehmen wie Microsoft Azure und Google Cloud.
Im Oktober 2021 erhielt aws einen Großauftrag des britischen Geheimdienst um ein Cloud-System für geheime Daten in Großbritannien aufzubauen.
Die aws Server sind überall auf der Welt verteilt und die Dienste sowie die Produktpalette entwickeln sich stetig weiter. 

## Branchen

- Werbung und Marketing
- Automobildindustrie
- Verbrauchsgüter
- Bildung
- Finanzdienstleistungen
- Games
- Behörden
- Gesundheitswesen und Biowissenschaften
- Industrie
- Produktion
- Medien und Unterhaltung
- Gemeinnützigkeit
- Strom- und Energieversorgung
- Einzelhandel
- Halbleiter
- Sport
- Telekommunikation
- Tourismus und Hotellerie

## Services & Produkte

AWS bietet mehr als 200 verschiedene Dienste in den unterschiedlichsten Branchen (s.o.). Hier werden beispielhaft einige Services aufgelistet.

1. **Computing Services**

- **Amazon EC2:** virtuelle Server, die Rechenkapazität in der Cloud zur Verfügung stellen
- **AWS Lambda:** serverloses Computing, bei dem Code ausgeführt werden kann, ohne, dass sich um die Verwaltung von Servern gekümmert werden muss

2. **Speicherdienste**

- **Amazon S3:** (Simple Storage System) Speicherdienst der für beliebige Datenmengen genutzt werden kann
- **Amazon EBS:** Elastic Block Store, blockbasierter Speicher für EC2-Instanzen

3. **Datenbankdienste**

- **Amazon RDS:** (Relational Database Service) verwaltet relationale Datenbankdienste für verschiedene Datenbank-Engines wie MySQL, PostgreSQL, Oracle, etc.
- **Amazon Dynamo DB:** Ein NoSQL-Datenbankdienst

4. **Netzwerkdienste**

- **Amazon VPC:** Virtual Private Cloud zu Erstellung isolierter Netzwerke in der Cloud
- **Amazon Route 53:** Webdienst zur Domain Namensauflösung

5. **Analytik und Big Data**

- **Amazon Redshift:** Data Warehouse Dienst
- **Amazon EMR:** Elastic MapReduce zur Verarbeitung großer Datenmengen

6. **Künstliche Intelligenz**

- **Amazon SageMaker:** Entwicklung, Schulung und Bereitstellung von Machine-Learning-Modellen
- **Amazon Rekognition:** Bild- und Videoanalyse

7. **Entwicklerwerkzeuge**

- **AWS CodeDeploy:** Bereitstellung von Anwendungen
- **AWS CodePipeline:** Werkzeug zur Entwicklung und Automatisierung für Freigabe von Software

8. **Sicherheit**

- **AWS Identity and Access Management (IAM):** Verwaltung von Benutzerzugriff und Berechtigung
- **Amazon GuardDuty:** Ein Dienst zu Bedrohungsüberwachung und -abwehr

9. **Content Delivery**

- **Amazon CloudFront:** CDN zur schnellen Bereitstellung von Inhalten

## Produkte für Verarbeitung von Geodaten

- **Amazon Location Service:** Ermöglicht die Nutzung von Postionsdaten und die Integrierung verschiedener Funktionalitäten in Anwendungen
  - **Maps:** Erstellt Karten von verschiedenen Datenanbietern wie beispielsweise ESRI
  - **Places:** Integriert Suchfunktionalität, Geocoding und reverse Geocoding
  - **Routes:** Errechnet Routen und erwartbarer Reisezeit
  - **Geofencing:** Ermöglicht das Erstellen Virtueller Zäune, wo bei ein oder Austritt in dieses Gebiet trigger Events gestartet werden können
  - **Trackers:** Ermöglicht das Nachverfolgen der jetzigen und historischen Postitionen, bei freigegeben Geräten
  - **[Video Tutorial](https://www.youtube.com/watch?v=mtV3uJY917g&t=5s&ab_channel=AmazonWebServices)**
- **Amazon S3:** Ein skalierbarer, webbasierter Cloud-Speicherdienst der das Sichern und Archivieren von Daten und Anwedungen online in AWS ermöglicht
  - **Anwendungsfälle:** Speicherung von (Geo-)daten (Karten, Luftbilder, etc.), Datenarchive- und sicherung, Softwarebereitstellung, Data Lakes, Datenanalyse mit Kompatiblen AWS, etc.
  - **Funktionsweise:** Amazon S3 ist ein Objektspeicherdienst. Dies unterscheidet sich von Block- und Dateispeicher die häufig im Cloud-Computing verwendet werden. Jedes Objekt ist eine Datei mit ihren zugehörigen Metadaten und erhält eine ID. Diese Objekte können dann in vorher erstellte Buckets, die einen Namen und eine Region besitzen, eingeordnet werden. Über S3-Versioning kann man auch ältere Versionen in den Buckets behalten, falls fehler in einer neuen Version auftauchen sollten, die nicht zu lösen sind. Jedes Objekt ist über eine Kombination von Webservice-Endpunkt, Bucket-Name, Schlüssel und wahlweise einer Version aufrufbar. Beispielsweise das Objekt **ortophotos/canada.jpg** im Bucket **EXAMPLE-BUCKET** in der Region **Germany**(Europe-Frankfurt/eu-central-1) wäre addressierbar über die Location-Bucket-Schlüssel-Kombo: `https://EXAMPLE-BUCKET.s3.eu-central-1.amazonaws.com/ortophotos/canada.jpg`
  - **Speicherklassen:** Es sind 7 Speicherklassen erhältlich, die sich hauptsächlich in der Häufigkeit der Zugriffe, der Latenz der Antwort und der Abrufgröße unterscheiden. Es gibt auch das "S3 Intelligent-Tiering", welches Anhand des Kundenzugriffsmusters automatisch die Daten in das Kostengünstigste Modul einordnet
  - **[Benutzerhandbuch mit Click-Tutorial](https://docs.aws.amazon.com/de_de/AmazonS3/latest/userguide/Welcome.html)**
- **Amazon Elastic MapReduce (EMR):** Verarbeitung großer Datenmengen, wie Beispielsweise in S3 gespeicherte Data Lakes. Kann für die Analyse von Geodaten und die Ausführung von Big-Data-Workloads verwendet werden. Es Entkoppelt Speicherung und Nutzung von Daten, sodass beide unabhängig voneinander wachsen können. Außerdem sind die erstellbaren Cluster skalierbar anpassbar auf den momentanen Aufwand.
  - **Anwendungsfälle:** Big Data Analysen mithilfe von statistischen Algorithmen, Korrelation und Prognose Modellen durchführen. Aufbauen skalierbarer Data Pipelines. Verarbeiten von Echtzeit-Data-Streams, sowie Beschleunigung der Datenverarbeitung. Skalierbar genutzt werden, können dafür Apache Spark/Hadoop und, für den Geo-Kontext, z.B. [ESRI's ArcGIS GeoAnalytics Engine](https://aws.amazon.com/de/blogs/apn/big-data-analytics-with-amazon-emr-and-esri-arcgis-geoanalytics-engine/). Eine Geospatial Spark library mit über 120 Funktionen, die direkt auf E3 Data-Lakes angewendet werden kann
  - **[Benutzerhandbuch mit Tutorial](https://docs.aws.amazon.com/de_de/emr/latest/ManagementGuide/emr-what-is-emr.html)**
- **Amazon Kinesis:** Serverloser Data-Streaming-Service für die Analyse und Verabeitung von streaming-data. Diese Daten stehen dennachgelagerten Anwendungen schon nach Sekunden zur Verfügung. Es verwaltet die Infrastruktur und Konfiguration die benötigt ist um Daten von z.B. clickstreams, social media und anderen Geodaten wie GPS-Trackern und Sensoren zu verarbeiten. Mit Kinesis Data Firehouse, können die gestreamten Daten direkt in andere AWS, wie beispielsweise E3 geladen werden.

  - **[Getting Startet mit Kinesis](https://aws.amazon.com/de/kinesis/getting-started/?nc=sn&loc=3)**

- **Amazon QuickSight:** Business Intelligence-Tool zur Visualisierung von Geodaten und zur Erstellung von interaktiven Dashboards. Unterstützt eine integrierte Machine Learning Engine in Q um Berechnungen Vorzunehmen, Daten zu analysieren und aufzubereiten um sie auf den Dashboards darzustellen. Es arbeitet flawless mit z.B S3, PostgreSQL, MySQL und anderen Datenbanken zusammen. Auch interaktive Karten sind integrierbar. Vergleichbar mit ArcGIS Insights, falls bekannt.
  - **[Video Tutorial](https://www.youtube.com/watch?v=hh6ItJbCUQ0&ab_channel=Academind)**
- **Amazon EC2:** Ermöglicht es virtuelle Computer zu mieten, auf denen Eigene Computeranwendungen ausgeführt werden können
  Instanzen von EC2 können verwendet werden, um maßgeschneiderte Geodatenverarbeitungsanwendungen zu erstellen und auszuführen.
  - **Anwendung:** Man erstellt eine sogenannte Instanz, bei der man eine geeignete [Instanzart](https://aws.amazon.com/de/ec2/instance-types/) auswählen muss. Daraufhin kann man eigene Firewall Regeln und die Art der Speicherung festlegen. Nach dem Deployment kann man sich über E2 Instance Connect mit der Instanz verbinden. Es gibt einige Instance-Typen die bei Befolgen einiger Regelen gratis nutzbar sind.
  - **Geo-Kontext:** Man kann auf EC2 Server [GIS-Server](https://enterprise.arcgis.com/de/server/10.4/cloud/amazon/launch-ec2-instance-running-arcgis-server.htm), R(Studio), etc. aufsetzen, was sogar ArcGIS unterstützt wird, da diese mit AWS an mehreren stellen zusammenarbeiten.

## Wer kann AWS nutzen?

- Jede dritte Webseite nutzt AWS. Über eine Million Nutzer*innen hat die Plattform. Bekannte AWS-Kunden sind Netlfix, Twitch, Reddit.
- insbesondere kleine Unternehmen, die Nutzung wird nach Leistung abgerechnet die in Preislisten einsehbar sind
- Kostenloses Kontingent verfügbar, entweder Testversionen oder für maximal 12 Monate (und 750 Stunden Rechenleistung oder Speichereinschränkung) oder ganz kostenlos, je nach angebotenem Produkt. Richtet sich an Studenten, Unternehmer, Kleinunternehmer und Fortune-500-Unternehmen.

## Vor- und Nachteile

### Vorteile

- Kunden zahlen nur Verbrauch
- Keine eigenen Server nötig, Wartung und Updates entfallen
- Schnelle Lösungen für Probleme verfügbar
- Flexibilität, es können jederzeit Dienste hinzugebucht werden
- Große Auswahl an Diensten für verschiedenste Branchen

### Nachteile

- Sicherheitsbedenken aufrgund von Cloud-Speicherung
- Abhängigkeiten an den Diensten
- Kosten können aus dem Ruder laufen
- Unübersichtlichkeit, das sehr große Angebot kann überfordernd sein
- Wenig Beratung für kleine Unternehmen

### Quellen

- [AWS](https://aws.amazon.com/de/)
- [ComputerWeekly](https://www.computerweekly.com/de/definition/Amazon-Simple-Storage-Service-Amazon-S3)
- [Geospatial Data Analytics on AWS](https://books.google.de/books?id=zkTJEAAAQBAJ&pg=PA29&lpg=PA29&dq=amazon+kinesis+for+geodata&source=bl&ots=TPdpFQSzyd&sig=ACfU3U2rGH_2s2B0v-TQmNgif3kqwECing&hl=de&sa=X&ved=2ahUKEwjH_uqt996BAxVWgP0HHZEwCtY4ChDoAXoECAIQAw#v=onepage&q=amazon%20kinesis%20for%20geodata&f=false)(Buch)
- [medium](https://aws.plainenglish.io/all-about-amazon-location-service-725239540dba)
- [plusserver](https://www.plusserver.com/blog/was-ist-aws-cloud/)
- [seo-kueche](https://www.seo-kueche.de/lexikon/amazon-web-service/#:~:text=Amazon%20Web%20Services%2C%20auch%20als,Aufgaben%20mieten%20und%20vieles%20mehr.)
- [Historie](https://datascientest.com/de/amazon-web-services)
- [Sicherheitsbedenken](https://www.computerbild.de/artikel/cb-Aktuell-Internet-Sicherheitslecks-Amazon-Web-Services-Ruhr-Universitaet-Bochum-6560372.html)
