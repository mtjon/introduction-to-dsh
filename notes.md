
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

# Mail Erdal, over SRE
Harish:platform that does awesome things with streaming data

left<->right ~ north bound<->south bound

lot of tech talk-> differences with other kafka providers?

limitations of tenant resources, restrictions, monitoring.
replicas/partioning/consumer groups

stream contract--> resource/pricing implications?

inter tenant stream sharing?  share butten? 
incident,problem,change:RFC, feature request-->PO:Laura,AJ
kpn: forum,user experience

Action: 
  collecting requirements, internal and external teams. --> PO

aj: endgoal every feature is self managed,
   list of requested features -> decision making?
   value: manual or automated

# Feedback Marko
MQTT
 
Algemeen:
•	Trainees erop attenderen dat alle benodigde variabelen die zij moeten invoeren in het env.sh bestand staan in hun home directory in de VM
•	(de eerste die ze nodig hebben is de API key voor het stuk export=API_KEY)
 
KAFKA
 
Get tenant example slide:
•	git clone [link] (toevoegen aan instructie bij het stukje clone this repo)
 
Connect/setup UMP slide:
•	Fill in the requested values wordt gevraagd, maar mensen weten wederom niet wat ze moeten invullen, noem dat: 
o	Environment naam is vrije keuze - tenant is goed
o	Adres kunnen ze vinden in env.sh (https://api.poc.kpn-dsh.com)

# TioD training OLAB
- instant "Why the DSH?"
- speaker notes overview fontsize too high
- M: kijk vooruit!
- inschatting niveau en snelheid voor harde start MQTT gedeelte, om ingrijpmoment te bepalen
- Video op de DSH blijft een vraag
- Vraag over documentatie en voorbeelden
- add how to send a single message to the MQTT part (before the stupid while loop).
- USE SYNCPOINTS; motivation drops sharply for the non-gifted
- remove mqtt wildcard part from intro
- which other streams are there in kafka?
- kafka streams in intro; likely needs simplification
- verify knowledge level before MQTT part
- pre-training checklist
- change `dshdemoshared` and crap to `training`
- Remove the THING_ID aspect of the stream, making it easier to understand, and allowing people to chat over the DSH (why didn't we do this in the first place!?)

# feedback during retro-thing
- Level of complexity is too high for non-technical people. Solutions:
  - Require participants to tell us in advance what they are and expect
  - Explicity state that a certain level of technical prowess is required
  - Allow non-technical people to participate in the first part, and then leave.
  - Lower the complexity of the first (non-practical part)
  - Add more examples and 'why' questions for the non-technical people
- "At the end, everything clicks": emphasize the larger whole, focus on element relation to the _function_
- Provide overview (and schedule) of the day
- "In the past, you'd plop data in a static database. Then we got datalakes, which turned into swamps. Now, it's events."
- https://www.ververica.com/what-is-stream-processing
- Verbal feedback (after the training) shouldn't be cut off, because there's a form coming.


# feeedback from form

# Approach/schedule
## Before
- 

## During
- Intro teacher
- Intro others, ask for goal, and reason for being here, estimate level of technical expertise
- Explanation of schedule
- Explanation of course structure
- Introduction of basic terminology, with estimation of level of technical expertise
- 