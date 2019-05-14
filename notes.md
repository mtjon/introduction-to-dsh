
# questions and details
- Where does the bridge live? Not in a docker file
- where are MQTT tokens stored and validated?
    - can we access this? Nope.
- Marathon is the docker ochestrator, but Kubernetes should work as well
- is the heartbeat integrated into the training now?
- Which options make a .ssh folder when it doesn't exist?

## tips
- syncpoints are recommended, as some users are struggling or trailing
- Going through ALL THE STEPS before the training is imperative. Incidentally, don't plan trainings in the morning, so we can give Klarrio or whatever the time to fix whatever needs fixing.

<!-- -------------------------------------------------- -->

Hierbij nog een paar comments tav van de mqtt en kafka slides als we ze korter willen maken voor de 2.5u training. 

Tav MQTT
-	MQTT bridge is de belangrijkste plaat voorafgaand aan de daadwerkelijke training. Daarin kunnen we uitleggen wat we vandaag gaan doen. De topic tree moeten we snel doorheen gaan omdat het tijd kost. Het filmpje zou ik niet laten zien. 
-	Authentication relations uiteraard ook een hele belangrijke intro. Dus de bridge + relations minimale twee inleidende platen. 

Tav KAFKA
-	Het hele stuk dat onder de stream types tekening zou ik overslaan. Is een lang verhaal, voegt complexiteit toe, en we doen er niks mee in de training. Dus qua intro alleen drie slides: Kafka DSH plaat, Kafka stream types, DSH met Kafka stream types gevisualiseerd.
-	Beter nog in de plaat tekenen dat we een docker image van buiten het platform in het platform gaan deployen en dat we daarmee gaan interacteren via streams over mqtt.

Aangenomen hierin is dat AJ voorafgaand aan onze training een presentatie geeft waarin de core-componenten worden uitgelegd. Zo hoeven wij daar verder niet bij stil te staan. CRUCIAAL om dit met AJ af te stemmen en de deelnemers te verplichten de presentatie gezien te hebben voorafgaand aan de training, anders heeft het geen zin…

2.5 betekent dat we een uur hebben voor mqtt, uur voor kafka, en half uur voor een koffiepauze en murphy’s law.

Ook vraag ik me af of we dit stuk uberhaupt Kafka moeten noemen, we interacteren primair met data over MQTT. 