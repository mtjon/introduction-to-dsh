# Notes regarding the training

## questions and details

- Where does the bridge live? Not in a docker container
- where are MQTT tokens stored and validated?
- can we access stored MQTT tokens? Nope.
- Marathon is the docker ochestrator, but Kubernetes should work as well
- Video on the DSH should be possible, but not ideal
- which other stream types exist?
- differences with other kafka providers?
- limitations of tenant resources, restrictions, monitoring.
- replicas/partioning/consumer groups
- stream contract--> resource/pricing implications?
- how does intertenant stream-sharing work? share butten?

## practical part

### MQTT

- Trainees erop attenderen dat alle benodigde variabelen die zij moeten invoeren in het env.sh bestand staan in hun home directory in de VM
- (de eerste die ze nodig hebben is de API key voor het stuk export=API_KEY)
- add how to send a single message to the MQTT part (before the stupid while loop).
- remove mqtt wildcard part from intro
 
### KAFKA

-	git clone [link] (toevoegen aan instructie bij het stukje clone this repo)

### UMP

- Fill in the requested values wordt gevraagd, maar mensen weten wederom niet wat ze moeten invullen, noem dat:
- Environment naam is vrije keuze - tenant is goed
- Adres kunnen ze vinden in env.sh ([link](https://api.poc.kpn-dsh.com))

- change `dshdemoshared` and crap to `training`
- Remove the THING_ID aspect of the stream
- make people chat over the DSH (why didn't we do this in the first place!?)

## Approach/schedule

### Before

- Require participants to tell us in advance what they are and expect
- Allow non-technical people to participate in the first part, and then leave.
- Explicity state that a certain level of technical prowess is required
- Provide overview (and schedule) of the day

### planning

- Don't plan trainings in the morning, so we can give Klarrio or whatever the time to fix whatever needs fixing.

### Preparation of the day

- Check bloody everything


### During

- Intro teacher
- Intro others, ask for goal, and reason for being here, estimate level of technical expertise
- Explanation of schedule
- Explanation of course structure
- "At the end, everything clicks": emphasize the larger whole, focus on element relation to the _function_
- Introduction of basic terminology, with estimation of level of technical expertise

## TODO

- Add more examples and 'why' questions for the non-technical people
- "In the past, you'd plop data in a static database. Then we got datalakes, which turned into swamps. Now, it's events."
- [what is stream processing](https://www.ververica.com/what-is-stream-processing)
