<!-- -------------------------------------------------- -->

Na het doorlopen van de verschillende wijzen van het komen in de VM ben ik tot de conclusie gekomen dat we de volgorde van de meest gebruiksvriendelijke opties wellicht gewijzigd moet worden naar: 
-	Powershell as is 
-	Werkt powershell niet: wsl
-	Willen/kunnen mensen dat niet: putty

Het installeren van een andere powershell een ssh vind ik te complex en schiet bij mij niet op. In mijn versie van windows kan powershell gewoon verbinding maken met ssh dus zou ik zeggen dat optie 1 voor windows gebruikers is: 
-	Check of je powershell ssh ondersteunt door ‘ssh’ in te typen, zo ja: 
o	mkdir %username%/.ssh
o	cd %username%/.ssh
o	ssh-keygen -t rsa -C "your.name@example.com"
-	zet de working directory in de map waar je ssh keys in staan, en dan:
o	ssh -i .\[private key] ubuntu@[ip-adres]
-	YOU’RE IN

Werkt dit scenario niet, dan gewoon de 4 WSL slides volgen, die gingen bij mij zonder problemen. Let wel op in de pdf dat er woorden worden afgesneden tussen de 3de en 4de WSL slide. Ik zou er alleen nog de volgende commando aan toevoegen zodat mensen weten hoe ze kunnen verbinden: 
-	ssh -i [key] ubuntu@[ip-adres]

Willen mensen dan toch graag Putty gebruiken (die ook het minst aantrekkelijke CLI heeft), dan de Putty slides aanbieden. Ik zou wel een waarschuwing geven om de ‘save public key’ knop van Putty ABSOLUUT niet te gebruiken, want dan gaat het fout met verbinden. 

Indien jullie het eens zijn met deze suggesties, zou jij @Heck, Casper van de volgorde van de slides willen aanpassen naar Powershell, WSL, Putty, en de content van de Powershell slides willen aanpassen naar wat ik hierboven noem, dus niet meer de optie bieden om posh powershell en ssh te installeren?

<!-- -------------------------------------------------- -->

Ik had nog wat opmerkingen opgeschreven:

              # Comments

* Title is incorrect, it's not supposed to be an SSH guide. We need instructions for the prerequisites.
    * explains why the chapter on UMP is so… minimalist, though. :)
* Missing an 'introduction' section; explaining what the goal of the guide is and what will be covered.
* Not a fan of the writing style: "we'll"
* Instructions on 'Keyfile' are inaccurate:
    * The attendee generates a _keypair_
    * As is clear from the final bullets; the attendee does not send _"this keyfile"_, rather, the _public key_
    * A public key does not necessarily need to have a `.pub` extension; _should have_ is not the right wording.
    * Suggestion; review critically
* Terminology; move to appendix. Reference terms throughout the document with internal hrefs instead.
* UMP; just three links without any instructions? Not good enough.
* the PDF that's included within the repo doesn't make sense. No make-up, huge 'print out slides' on pages?
    * Suggestion; use a regular markdown style, not a 'reveal-md' style. We don't need to present this, it should be a text document.


En om op jouw punten te reageren:

Algemeen:
-	export API_KEY verwijderen (evt vervangen met echo $API_KEY)

en

Push slide:
-	Mensen worden gevraagd in te loggen in de docker omgeving maar weten niet wat de username en wachtwoord zijn, deze opnemen in de env
o	login: training
o	password: ZWQ1ZWEzNDY2

en

Connect/setup UMP slide:
-	Fill in the requested values wordt gevraagd, maar mensen weten wederom niet wat ze moeten invullen, noem dat: 
o	Environment naam is vrije keuze - tenant is goed
o	adres is https://api.poc.kpn-dsh.com

Eens. Instructie is wat achterhaald gezien deze variabelen intussen naar de VMs worden ge-exporteerd gedurende provisioning.

o	Indien mensen vastlopen in het aanpassen van de json in UMP
	Controleren dat de user id 1054:1054 is (of whatever op dat moment actueel is)
	tenant naam aanpassen naar "training"
	streams die eindigen in demoshared aanpassen naar “training”

Dit moeten we aanpassen in de ‘tenant-example’ repositoy. Nu kunnen wij dit niet direct, dus dan zouden we moeten forken en eventueel een pull request indienen. Mijn laatste pull-request is nooit op gereageerd, dus moeten we af zien te stemmen.


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

<!-- ----------------------------------- -->

Actions:
- ssh as markdown, not reveal-md, en dan opslaan als pdf
- git bash toevoegen
- putty guide aanpassen naar een opmerking 'indien putty, dan kopieer de key' in plaats van hele handleiding
- terminology naar eind
- nano as text editor; add link to guide [](https://wiki.gentoo.org/wiki/Nano/Basics_Guide)