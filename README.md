# An introduction to the Data Services Hub

## Contents

This repo contains presentations that can be used to introduce DSH to new users. The are meant to be presented using [reveal-md](https://github.com/webpro/reveal-md).The raw markdown files serve as handouts and can be used to follow along with the tutorials.

## Chapters

* [an introduction to the data services hub](./intro.md) explains the dsh concept and some of the design decisions that led to the dsh architecture.
* [streaming over mqtt](./mqtt.md) is a basic tutorial on connecting to the dsh over mqtt.
* [deploying a service](./deploying.md) shows how to deploy a service on the dSH and interact.

## Docker

A dockerfile is included, which can be ran with:

`docker build -t reveal . && docker run -it -p 1948:1948 reveal`
