---
title: 'Relax: Scale Slack Bots with Ease'
description: >-
  Scaling websockets for your Slack bot is a pain. With Relax, you can stop
  worrying about scaling and start building features.
date: '2017-01-24T17:29:17.254Z'
categories: []
keywords: []
slug: /@iamclovin/relax-scale-slack-bots-with-ease-55e73018e316
---

Even though Slack is making great progress on the [Events API](https://api.slack.com/events-api), there are reasons why you would want to use Slack’s [Real-Time API](https://api.slack.com/rtm) to build your Slack bot: low latency being one of them.

As your Slack bot becomes more popular, the question inevitably arises: How do I scale my Slack bot’s websocket connections without running up enormous server bills? [Relax is an open source project](https://github.com/zerobotlabs/relax) that will help with scaling your Slack bot and allow you to focus on building functionality and features.

#### Instantiating a Websocket Connection for your Bot

When a new Slack team installs a bot, it goes through three steps:

1.  **_OAuth2 Authorization:_** Returns a token that will be used by your bot
2.  **_HTTP Call to_** [**_rtm.start_**](https://api.slack.com/methods/rtm.start): This will return a URL that you should start a websocket connection
3.  **_Open Websocket connection:_** Start receiving [events](https://api.slack.com/events) from Slack’s real-time servers.

![](https://cdn-images-1.medium.com/max/800/1*eoDhMNj9Sas2eiZUI6fcPg.png)

#### Rinse and Repeat for Every Team that Installs Your Bot

For every subsequent team that signups to your bot, you have to repeat the previous three steps and maintain persistent websocket connections for all of those teams. For a popular bot, that means **_hundreds of thousands of persistent, stateful websockect connections_**!

![](https://cdn-images-1.medium.com/max/800/1*_ikmD4kRuibLrVeeKqAOlQ.png)

#### Problem with Persistent Websocket Connections and Ruby et al

![](https://cdn-images-1.medium.com/max/800/1*_gu5gTQsGsR_6uz7oeUzTA.png)

The problem with doing this in languages such as Ruby, Python, Node and so on is that you have typically have to spawn off separate processes or threads to handle each team and that can get both unwieldy and expensive very quickly.

#### Enter Go and Relax: Design Goals

Turns out, this is a problem that is solved by [Go](https://golang.org). The Go language has the powerful concept of Go routines which are lightweight threads managed by the Go runtime. A Go program can spawn thousands of Go routines with very little cost and take advantage of multi-core server architectures.

With Relax and Go, we achieve the following design goals of running a scalable Slack Bot:

*   **Handling Messages from 1000’s of teams:** Being able to spawn 1000’s of Go Routines (one for each team that connects to your Slack Bot) enables us to scale cost efficiently.
*   **De-Coupled from the Web App:** By having Relax manage receiving and delivery of messages, we can decouple business logic from the process of managing and scaling your websockets.
*   **Multiplexed Single Stream of Events:** With Relax, your web app will get a single stream of events multiplexed on a single channel as opposed to dealing with 1000’s of channels.
*   **Ability to run in “high-availability” mode:** You can run multiple instances of Relax across multiple data centers, enabling high availability without getting duplicate messages and events.

#### Relax-Based Bot Architecture

*   Relax maintains one goroutine per team and maintains a persistent websocket connection with Slack. Go routines handle keeping connection alive, health checks and so on.
*   Relax uses Redis to maintain state and allow Relax to be deployed in a highly available configuration
*   Events from Slack are converted into JSON blobs and are pushed to a Redis queue which can be consumed by any web application.
*   Events are not duplicated as they are sent to the web app no matter how many Relax instances are deployed.

![](https://cdn-images-1.medium.com/max/800/1*uIn1QQunFNPeDvpRF6btRw.png)

#### How does High Availability Work?

*   When a bot is started on Relax, it starts **websocket connections on every Relax instance.** Redis’ **PUBSUB** feature is used for this.
*   Running multiple instances of Relax does not mean that you get duplicate events for every message that comes in through the websocket connection.
*   When an event comes in, Relax uses combination of **channel\_id + timestamp** (which Slack guarantees to be unique) and uses [HSETNX](http://redis.io/commands/hsetnx) with the channel\_id+timestamp to figure out whether to send the event back over Redis.

#### Get Started

Relax is a binary that can be [installed on Linux or OS X](https://github.com/botmetrics/relax#installation) and can also be installed with one click on Heroku. A sample Ruby on Rails application that uses Relax is [also available](https://github.com/botmetrics/relax_on_rails).

#### Results

Relax has been used by Botmetrics to track metrics for Slack bots on [Botmetrics](https://www.getbotmetrics.com) and it has been rock-solid over the last 12 months.

*   Able to maintain connections from 2000+ teams on a **single Heroku dyno** (512MB). Average Memory Usage: ~200MB
*   Handle tens of thousands of events on a daily basis without skipping a beat
*   Allows developers to focus on building great value in the bot itself and not worry about scalability