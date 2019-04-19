---
title: "Introduction to DSH"
---
<!-- .slide: data-background="./images/kpn-intro-bg-md.jpg" -->
# An introduction to the Data Services Hub

<!--s-->
# What is the DSH?
<!-- .slide: class="nobullets" -->
- Streaming Data Platform <!-- .element: class="fragment" data-fragment-index="1" -->
- Stream Processing Platform <!-- .element: class="fragment" data-fragment-index="2" -->
- Data Stream Platform <!-- .element: class="fragment" data-fragment-index="3" -->

<!--s-->
# Overview
* Totaal overzicht van de DSH (inclusief control plane, etc etc)
    * Cloud agnostisch, yade yade
    * USP vaker terug laten komen en aansluiten op BizDev verhaal
* Wat is een Tenant

<!--s-->
# Platform 

- A (software) platform is anything you can build (applications) on
- Provides reusable infrastructure
- Takes care of recurring and tedious tasks
- Should not hamper creativity

<!--s-->
# Streaming Data Platform 

A platform that does something with <!-- .element: class="fragment" data-fragment-index="1" --> _streaming data_ <!-- .element: class="fragment" data-fragment-index="1" -->

<!--v-->
## Streaming Data

> &hellip;data that is generated continuously by thousands of data
> sources, which typically send in the data records simultaneously, and in
> small sizes (order of Kilobytes). 

https://aws.amazon.com/streaming-data

Note: speaker notes toevoegen


<!--v-->
## And out?

> A streaming data platform should also be able to continuously send selected
> data records to thousands of data sinks.

&ndash;according to us

<!--s-->
# Types of streaming data

Not all datastreams are created equal
![Huge](./images/huge2.png) <!-- .element: class="thinner fragment" data-fragment-index="1" -->
![Manneke](./images/manneke.jpg) <!-- .element: class="thinner fragment" data-fragment-index="1" -->

Digitale waterval?

<!--v-->
## Streaming data on DSH 

Focus on two types of streams:
- MQTT (manneke pis)
- Kafka (waterval)

Note: Kafka == waterval Mqtt == manneke
<!--v-->
## MQTT

- Lightweight messaging protocol
- Suitable for many simultaneous connections
- Widespread use in *Internet of Things*

Note: toevoegen; MQTT voordelen zoals bij SensorThings

<!--v-->
## Kafka

- Highly scalable in volume of data
- Messaging backbone for LinkedIn, Netflix, Yahoo, Twiter, Goldman Sachs

<!--v-->
## MQTT vs Kafka

- MQTT
  - _usually_ low volume _(default 10 msgs/sec)_
  - can have many sources/sinks (millions)
  - sources/sinks can reside outside of DSH
- Kafka
  - can have high volume (millions of msgs/sec)
  - _must_ have few sources/sinks
  - sources/sinks reside inside DSH

$$ \text{MQTT} \cdot \frac{sources}{sinks} \approx \text{Kafka} \cdot \frac{sources}{sinks} $$ <!-- .element: class="fragment" data-fragment-index="1" -->
$$ \frac{sources_{mqtt}}{sinks_{mqtt}}} \approx \text{Kafka} \cdot \frac{sources}{sinks} $$ <!-- .element: class="fragment" data-fragment-index="1" -->

Note: kafka sources/ sinks can also reside outside of DSH

<!--s-->
<!-- .slide: data-transition="fade" -->
## Overview

![dsh-overview-1](images/dsh-overview-1-dsh-overview.svg)<!-- .element: class="plain" -->

<!--v-->
<!-- .slide: data-transition="fade" -->
## Overview

![dsh-overview-2](images/dsh-overview-2-dsh-overview.svg)<!-- .element: class="plain" -->

<!--v-->
<!-- .slide: data-transition="fade" -->
## Overview

![dsh-overview-3](images/dsh-overview-3-dsh-overview.svg)<!-- .element: class="plain" -->

<!--v-->
<!-- .slide: data-transition="fade" -->
## Overview

![dsh-overview-4](images/dsh-overview-4-dsh-overview.svg)<!-- .element: class="plain" -->

<!--s-->
# Bridge

- MQTT protocol adapter
	- acts _as if_ it is MQTT broker
	- actually interfaces with Kafka
- like MQTT
	- allows wildcard subscriptions:

    ```/platform/stream/topic/#```

Note: @Casper go fix! Verhaal verbeteren

<!--v-->
## Bridge

$$\begin{align}
\text{MQTT topic prefix} &= \text{Kafka cluster name} \\\\\\  
\text{MQTT topic infix}  &= \text{Kafka topic name} \\\\\\
\text{keys in Kafka}     &= \text{MQTT topic suffix} \\\\\\ 
\end{align}$$

```scala
MQTT(topic="/tt/cam/id", data="...")
```
<!-- .element: class="fragment" data-fragment-index="2" -->
$=$
<!-- .element: class="fragment" data-fragment-index="2" -->
```scala
Kafka(cluster="tt", topic="stream.cam.*", key="id", data="...")
```
<!-- .element: class="fragment" data-fragment-index="2" -->

Note: clearly explain that Kafka only has a single topic, whereas MQTT has multiple levels

<!--v-->
## Rarely updated data sources

- Latest value store indexing service
- tracks keys in a stream
- distributed in-memory key-value store

<!--v-->
## External data sources 

- are not always MQTT
- do not always stream
- will require custom adapters
    - allow tenants to write their own

<!--s-->
<!-- .slide: data-transition="fade" -->
## Overview

![dsh-overview-4](images/dsh-overview-4-dsh-overview.svg)<!-- .element: class="plain" -->

<!--v-->
<!-- .slide: data-transition="fade" -->
## Overview

![dsh-overview-5](images/dsh-overview-5-dsh-overview.svg)<!-- .element: class="plain" -->

<!--s-->
# Wrap-up

- MQTT for low volume, many sources/sinks
- Kafka for high volume, few sources/sinks
- bridge (protocol adaptor) to tie them together 
- custom data source adapters for external data 
- latest value store for instant syncing with rarely changing data source

<!--s-->
# Stream Processing Platform
A platform that does  <!-- .element: class="fragment" data-fragment-index="1" --> _stream processing_  <!-- .element: class="fragment" data-fragment-index="1" -->

<!--v-->
## Stream Processing

> &hellip; is the processing of data in motion, or in other words,
> computing on data directly as it is produced or received.

https://data-artisans.com/what-is-stream-processing

Note: key point; process the data while in motion.

<!--v-->
## Where to process

- At the edge where possible and necessary
- Close to the data (on the DSH) if you need a lot of data from multiple sources

Note: emphasize necessaty of data&mdash;ECG sensors. 

<!--v-->
## Many ways to process the data

- Many frameworks for stream processing
- No framework fits all use-cases
- DSH does not dictate a framework

No _One framework to rule them all_, but the DSH to _bind them_.

Note: analogy: you can bring your project to Black&Decker, and then you'll have a workshop with Black&Decker tools. We provide an empty toolshed; you want to use a Gamma drill? You use a Gamma drill. Alternatively: if you have a BMW, you'll to bring it to a garage that is familiar with BMW. However, we provide an empty shed, you bring your own tools. We don't care if you're going to come in with a BMW, Audi, or a horse.

<!--s-->
# Wrap-up

- DSH can process streams: 
    - but is not always the right place to do it
    - and does not dictate how to process them

<!--s-->
# Security nightmare

- Need to allow other people on your platform for proximity
- And they can use whatever software they want on the platform

<!--v-->
## DC/OS

- Started with DC/OS as base platform 
- Supported by most stream processing frameworks
- Tenants run docker containers on top

<!--v-->
## Securing

- Custom container manager to force correct use of Docker
- Custom resource manager to control resource requests
- Calico for network isolation

<!--v-->
<!-- .slide: data-transition="fade" -->
## DC/OS

![DC/OS](images/dsh-overview-4-dsh-overview.svg)<!-- .element: class="plain" -->

<!--v-->
<!-- .slide: data-transition="fade" -->
## DC/OS

![DC/OS](images/dsh-overview-6-dsh-overview.svg)<!-- .element: class="plain" -->
<!--s-->

# Wrap-up

- DC/OS as base
- Docker + extra security
- Tenant network isolation

Note: question to audience "how do tenants communicate?" KAFKAAAAA

<!--s-->
# Data Stream Platform

a platform that holds many different <!-- .element: class="fragment" data-fragment-index="1" -->_data streams_<!-- .element: class="fragment" data-fragment-index="1" -->

<!--v-->
## Data Stream

> A sequence of digitally encoded signals used to represent information in transmission.

[Federal Standard 1037C](https://www.its.bldrdoc.gov/fs-1037/fs-1037c.htm)

<!--v-->
## Many data streams

- Streams need organizing
- DSH topics $ \approx $ Kafka topics
- Need to control access to topics
	- Manage at topic level using custom tooling
    - Based on Access Control Lists (ACLs)

<!--v-->
## Authenticate

- Certificates for tenant (container) authentication towards Kafka
- API key to authenticate tenants that want to let devices/things/users connect to the platform
- REST token for authentication of MQTT token requests
- Tokens for MQTT authentication of devices/things/users

<!--v-->
<!-- .slide: data-transition="fade" -->
## Authentication relations

![Authentication Relations](images/authentication-relations-1-auth.svg)<!-- .element: class="plain" -->

<!--v-->
<!-- .slide: data-transition="fade" -->
## Authentication relations

![Authentication Relations](images/authentication-relations-2-auth.svg)<!-- .element: class="plain" -->

<!--v-->
<!-- .slide: data-transition="fade" -->
## Authentication relations

![Authentication Relations](images/authentication-relations-3-auth.svg)<!-- .element: class="plain" -->

Note: emphasize why the REST token is required -> multiple protocols in future

<!--v-->
<!-- .slide: data-transition="fade" -->
## Authentication relations

![Authentication Relations](images/authentication-relations-4-auth.svg)<!-- .element: class="plain" -->

<!--v-->
## Device management

- Provides the necessary building blocks
- DSH does not manage devices
- Up to the tenant to implement

Note: improve!

<!--v-->
## Access control

- Fine-grained on MQTT
  - read `/tt/topic/fixed/tenant/+/#`
  - write `/tt/topic/other/tenant/`
- Coarse-grained on Kafka
  - read/write on topic-level

<!--v-->
## Kafka
Three Kafka stream-types
-  _stream._ topic
-  _internal._ topic 
-  _scratch._ topic

<!--s-->
# Wrap-up

- API keys, REST token & MQTT tokens 
- Kafka certificates
- ACLs on all streams/topics
- Kafka topics scheme

<!--s-->
<!-- .slide: data-background="./images/kpn-end-bg-md.jpg" -->
