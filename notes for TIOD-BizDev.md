# Part 1
## Tips
* expectation management, both sides
* martin, as presenter
    - te snelle start
    - missende interactie --> door AJ geen kans, maar waarschijnlijk ook missend zonder AJ
* speaker notes / presenter view
* MQTT mist details en voordelen; uitleg AJ is zeer behulpzaam
* Voordelen MQTT onderbelicht
    - low overhead, etc.
    - dit zit in een presentatie voor sensorthings, zegt AJ
* Meer voorbeelden Kafka nodig
* Duidelijk van tevoren aangeven dat het groot en complex is-->overzichtsslide, overzichtsafbeelding
    - Duidelijk zeggen dat de meeste vragen vanzelf worden behandeld
* Wildcards kunnen beter uitgelegd worden door quadtiles of het sensornetwerk (asciinema)
* Duidelijk aangeven dat de topicstructuur niet vastligt; men mag zelf een structuur verzinnen
* Definities toevoegen, zoals Edge Computing
* voorbeelden edge computing toevoegen
    - ECG verwerking (datapunten naar pieken naar bpm naar event detection)
    - temperatuur sensor (sensor jitter, artifact removal, diffs, event reporting)
* vraag stellen aan publiek over security werkt goed (AJ vroeg "")
* Overview slide nodig, mogelijk overview animatie
* Type of slide (hoofdlijn, wrap-up, diepte, sidenote) op de slide
    - overzichtsslide is mogelijk handig, met één complex plaatje, dat later per slide specifieke elementen highlight
* Voor de training
    - Basisinformatie op de slide (waar vind ik mijn API key? Waar typ ik dit commando?)
    - "Bij deze stap, steek je hand op, en wacht even"
* basisinformatie curl en mosquitto (laatste mogelijk met uitleg sensornetwerk)
* custom bridges: "Wij hebben dit [fancy displayport adapter] gebouwd, maar als jullie echt willen, mogen jullie natuurlijk iets anders bouwen [scart naar tulip-plugjes]"

## `Issues`
* Verwarring over quote van Amazon, en onze toevoeging. 
    - mogelijk onze quote organisch laten groeien
* afbeelding waterval|manneken Pis vervangen
* AJ interfereert met de training
    - rollen trainers duidelijk vastleggen van tevoren (tech support/teachter/dual teacher, etc)
* Afbeelding stuwmeer|kraan vervangen
    - chemische opstelling?
* te snel naar de pijltjes-->te snel naar de volgende slide-->slides worden leading, en niet meer supportive
* definitie data stream te laat?
* DSH komt niet altijd als beste naar voren
    - volgorde aanpassen?
    - expliciet?
* Formule is onduidelijk, en inconsistent met zichzelf
* MQTT bridge als (nep-)MQTT broker is niet duidelijk, de interface met Kafka is onderbelicht
* device management and the DSH is not helpful or complete. "The DSH does not manage devices, but does not prevent device management. It is up to the tenant to do this, or ignore it completely."

## Questions
* Where does the bridge live?
* where are MQTT tokens stored and validated?
    - can we access this?

## NOTES:
* Marathon is the docker ochestrator, but Kubernetes should work as well
* Calico isolates tenants
* DC/OS is the base OS

# part 2

## tips
- aparte start, AJ is weer meteen leidend, maar is wel iets minder prominent aanwezig
