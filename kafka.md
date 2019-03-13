---
title: "Introduction to DSH: Kafka"
separator: <!--s-->
verticalSeparator: <!--v-->
theme: themes/kpn.css
revealOptions:
    transition: 'slide'
---
# Streaming over Kafka

<!--s-->
## Prerequisites
- _Installed:_ Curl
- _Installed:_ Mosquitto (MQTT-client)
- _Installed:_ Docker-CE
- _Installed:_ Git
- _Installed:_ java SDK 8
- _Installed:_ maven (mvn) 
- _Installed:_ DSH UMP-client
- _Available:_ tenant UID
- _Available:_ docker registry credentials
- _Available:_ API-Key

<!--s-->
## Goal 

<!-- .element: class="lefty" -->Learn to deploy an application on DSH that connects to DSH kafka.

<!--s-->
## Steps

1. Get tenant example
2. Build docker image
3. Push docker image to tenant's docker registry
4. Use UMP to deploy container on DSH
5. Use MQTT to contact container

<!--s-->
## Get tenant example
- Clone this repo from git: https://github.com/kpn-dsh/tenant-example
- It contains a fully working tenant example
  - in java
  - built with maven
  - builds docker image

<!--s-->
## Inspect
### Dockerfile => UID

- Change your pwd (present working directory) to `tenant-example`
- Open the `Dockerfile` in your favorite text-editor
- Modify the `ENV id 1024` line according to the comment above it and save the
  modification

<!--s-->
## Inspect
### pom.xml => tenant 
- Open the `pom.xml` in your favorite text-editor
- Modify the tenant to your tenant
```xml
<tenant>dshdemo2</tenant>
```
- Modify version to something that contains your name: e.g.
```xml
<version>1.0.1-bruno-SNAPSHOT</version> 
```

<!--s-->
## Build
```
mvn package
```
<!-- .element: class="lefty" -->This will build the java binary and the docker image _locally_. Look in the
output for the name of the docker image.

<!--s-->
## Push
<!-- .element: class="lefty" -->Since every tenant has its own docker registry this will be reflected in the
image tag name:
```bash
dataserviceshub-docker-$TENANT.jfrog.io/image:...
```
<!-- .element: class="lefty" -->You need to be logged in to use this registry:
```bash
docker login dataserviceshub-docker-$TENANT.jfrog.io
```
<!-- .element: class="lefty" -->Now you can push your image to the tenant's docker registry:

```bash
docker push \
  dataserviceshub-docker-$TENANT.jfrog.io/tenant-example:...
```

<!--s-->
## Deploying
<!-- .element: class="lefty" -->The docker image has now been built and safely stored in the docker
registry.   
Next step: deploying a container on the DSH.

<!--s-->
## UMP
- is an angular-/ electron-based application 
- connects to DSH over MQTT
- can be used to manage/ request resources (_CPUs_, _Memory_, _VHosts_ and _Volumes_)
- can deploy services/ applications to DSH
<!--s-->
## Download
- Linux:<br>https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/dsh-ump-1.2.0-x86_64.AppImage
- macOS:<br>https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/DSH-UMP-1.2.0.dmg
- Windows:<br>https://s3.eu-central-1.amazonaws.com/dsh-ump/auto-update/DSH-UMP+Setup+1.2.0.exe

<!--s-->
## Connect/Setup UMP

- Click `+` to add a new environment
- Fill in the requested values

<!--s-->
## Deploy application
- Click on the _Add new service_-button 
- and name it `tenant-example-<your_name>`
<!--v-->
![UMP add service: name](images/UMP-dshdemo-add-service1.png)
<!--v-->
## Deploy application
- create AMP definition (see `tenant-example.json`)
- modify the name of the image
- modify the user if needed
- and click _deploy_
<!--v-->
![UMP add service: amp definition](images/UMP-dshdemo-add-service2.png)
<!--s-->
## Test application
<!-- .element: class="lefty" -->The kpn-tenant-example listens to the `dshdemoshared` topics on the `command` key.  
Two commands are supported:
- whoami
- restart

<!-- .element: class="lefty" -->Responses to those commands are written on the `response` key.
<!--s-->
## Verify
<!-- .element: class="lefty" -->You can set up an mqtt connection to verify:
```bash
mosquitto_sub -h mqtt.$PLATFORM.kpn-dsh.com -p 8883 \
-t "/tt/dshdemoshared/response/#" \
--capath /etc/ssl/certs/ -d -P "`cat mqtt-token.txt`" \
-u $THING_ID -v
```
<!-- .element: class="lefty" -->On macOS use
```bash
mosquitto_sub -h mqtt.$PLATFORM.kpn-dsh.com -p 8883 \
-t "/tt/dshdemoshared/response/#"  \
--cafile /usr/local/etc/openssl/cert.pem -d \ 
-P "`cat mqtt-token.txt`" -u $THING_ID -v
```

<!--s-->
## Verify
```bash
mosquitto_pub -h mqtt.$PLATFORM.kpn-dsh.com -p 8883 \
-t "/tt/dshdemoshared/command/" \
--capath /etc/ssl/certs/ -d -P "`cat mqtt-token.txt`" \
-u $THING_ID -l
```
<!-- .element: class="lefty" -->On macOS use
```bash
mosquitto_pub -h mqtt.$PLATFORM.kpn-dsh.com -p 8883 \
-t "/tt/dshdemoshared/command/" \
--cafile /usr/local/etc/openssl/cert.pem -d \
-P "`cat mqtt-token.txt`" -u $THING_ID -l
```
<!-- .element: class="lefty" -->Type:
```
whoami 
```
<!-- .element: class="lefty" -->and see what's returned in the subscription.
<!--s-->
## Clean-up
- Remove your service after testing
- Select your service
- Select _configuration_
- Choose _destroy_ and confirm
<!--s-->
<!-- .slide: data-background="./images/byebyebye.gif" -->
