# Cheatsheet

For usage during the training, by the trainer. This document allows for quick and easy demonstration with minimal typos.

## Environment variables

```bash
source env.sh
```

```bash
echo $PLATFORM
echo $TENANT
echo $API_KEY
```

## Rest & MQTT Tokens

```bash
curl -X POST \
"https://api.poc.kpn-dsh.com/auth/v0/token" \
-H "apikey: q0N1hMs8njaKT5W6xHrF" \
-d '{"tenant": "training"}' > rest-token.txt
```

```bash
cat rest-token.txt | \
sed "s/[^.]*\.\([^.]*\)\.[^.]*/\1===/;s/\(\(....\)*\).*/\1/" | \
base64 -d | \
jq .
```

```bash
export THING_ID_1=trainer_sub
```

```bash
curl -X POST \
"https://api.$PLATFORM.kpn-dsh.com/datastreams/v0/mqtt/token" \
-H "Authorization: Bearer `cat rest-token.txt`" \
-d '{"id":"'$THING_ID_1'"}' > mqtt-token_1.txt
```

```bash
cat mqtt-token_1.txt | \
sed "s/[^.]*\.\([^.]*\)\.[^.]*/\1===/;s/\(\(....\)*\).*/\1/" | \
base64 -d | \
jq .
```

## Subscribe

```bash
mosquitto_sub -h mqtt.$PLATFORM.kpn-dsh.com -p 8883 \
-t "/tt/training/#" \
--capath /etc/ssl/certs/ -d -P "`cat mqtt-token_1.txt`" \
-u $THING_ID_1 -v
```

## Publish

```bash
source env.sh
```

```bash
export ThiNG_ID_2=trainer_pub
```

```bash
curl -X POST \
"https://api.$PLATFORM.kpn-dsh.com/datastreams/v0/mqtt/token" \
-H "Authorization: Bearer `cat rest-token.txt`" \
-d '{"id":"'$THING_ID_2'"}' > mqtt-token_2.txt
```

```bash
cat mqtt-token_2.txt | \
sed "s/[^.]*\.\([^.]*\)\.[^.]*/\1===/;s/\(\(....\)*\).*/\1/" | \
base64 -d | \
jq .
```

```bash
mosquitto_pub -h mqtt.$PLATFORM.kpn-dsh.com \
-p 8883 \
- t "/tt/training/$THING_ID_2" \
--cafile /usr/local/etc/openssl/cert.pem \
-d -P "`cat mqtt-token_1.txt`" \
-u $THING_ID_2 -m "I'm also here. But should I be?"
```

## Clone & Modify & Deploy

```bash
git clone https://github.com/mtjon/tenant-example
```

```bash
cd tenant-example
```

```bash
vim Dockerfile
nano Dockerfile
```

`ENV id 1054`

```bash
vim pom.xml
nano pom.xml
```

```xml
<version>1.0.1-trainer</version>
<tenant>training</tenant>
```

```bash
mvn package
```

```bash
docker login dataserviceshub-docker-$TENANT.jfrog.io -p $jfrog_password -u $jfrog_login
```

```bash
docker push \
  dataserviceshub-docker-$TENANT.jfrog.io/tenant-example:1.0.1-trainer
 ```

## OR Simplified

```bash
docker login $jfrog_url -p $jfrog_password -u $jfrog_login
```

```bash
docker push \
  $jfrog_url/tenant-example:1.0.1-trainer
 ```

## UMP

```bash
echo $ump_api_endpoint
echo $API_KEY
```

## Tenant example

```json
{
  "image": "dataserviceshub-docker-training.jfrog.io/tenant-example:1.0.1-trainer",
  "cpus": 0.1,
  "mem": 128,
  "env": {
    "JAEGER_SAMPLER_TYPE": "const",
    "JAEGER_SAMPLER_PARAM": "1",
    "OUTPUT_STREAM": "stream.training",
    "JAEGER_REPORTER_FLUSH_INTERVAL": "1000",
    "JAEGER_REPORTER_LOG_SPANS": "false",
    "JAEGER_SERVICE_NAME": "tenant-example",
    "INPUT_STREAM": "stream.training",
    "JAEGER_REPORTER_MAX_QUEUE_SIZE": "10000"
  },
  "instances": 1,
  "singleInstance": false,
  "needsToken": true,
  "user": "1054:1054"
}
```

## Jupyter json

{
  "image": "dataserviceshub-docker-training.jfrog.io/lib/python3/jupyter-py3:2019.07.31",
  "cpus": 0.5,
  "mem": 512,
  "env": {},
  "instances": 1,
  "singleInstance": true,
  "needsToken": true,
  "user": "1054:1054",
  "exposedPorts": {
    "7878": {
      "vhost": "{ vhost('jupyter-training') }"
    }
  }
}

## nodered json

{
  "image": "dataserviceshub-docker-training.jfrog.io/lib/nodered-accelerators:2019.07.29",
  "cpus": 0.8,
  "mem": 1024,
  "instances": 1,
  "singleInstance": false,
  "needsToken": true,
  "user": "1031:1031",
  "exposedPorts": {
    "1880": {
      "vhost": "{ vhost('node-red-training') }"
    }
  }
}