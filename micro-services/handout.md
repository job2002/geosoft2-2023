# Geosoftware II handout Micro-Services (WiSe 2023/24)

[@astru03](https://github.com/astru03) & [@GolfEchoOscar](https://github.com/GolfEchoOscar)

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
![Unterschied zwischen Monolith-Architektur und Micro-service-Architektur.](https://martinfowler.com/articles/microservices/images/sketch.png)

## Wann macht der Einsatz von Micro-services Sinn? When?

## Fragen: Warum können MS scheitern? Was sind alternativen zu MS?


## Literaturverzeichnis
JAX Blog - Und jetzt? Microservices nach dem Hype
  
  https://jax.de/blog/microservices-nach-dem-hype/ (abgerufen am 01.10.2023)

msg-group - Sind Microservices die bessere SOA?
  
  https://publikation.msg.group/publikationsarchiv/fachartikel/158-beitrag-im-public-kundenmagazin-sind-microservices-die-bessere-soa/file (abgerufen am 01.10.2023)
  

martinfowler - Mikrodienste eine Definition dieses neuen Architekturbegriffs

  https://martinfowler-com.translate.goog/articles/microservices.html?_x_tr_sl=en&_x_tr_tl=de&_x_tr_hl=de&_x_tr_pto=rq (abgerufen am 01.10.2023)
