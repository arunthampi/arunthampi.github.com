---
title: A Scalable Slack Bot App In 5 Minutes
description: >-
  2016 has been declared as the “year of the bots” and with bots declared as the
  next frontier in software distribution, creating scalable…
date: '2016-01-21T18:11:17.973Z'
categories: []
keywords: []
layout: post
---

## A Scalable Slack Bot App in 5 Minutes

2016 has been declared as the “[year of the bots](https://www.theinformation.com/on-bots-conversational-apps-and-fin)” and with bots declared as the [next frontier in software distribution](http://www.usatoday.com/story/tech/news/2015/12/28/future-messaging-app-spells-end-google-we-know/77847504/), creating scalable bot apps has become an increasingly important skill to have in the developer’s toolkit. This post goes through how you can write a massively scalable Slack Bot App in 5 minutes.

![](https://cdn-images-1.medium.com/max/800/1*QJvYBHNfExHuLH6HB2sFTA.jpeg)

#### But what exactly is a Bot App?

Very simply, a Slack Bot App is a web application that is installed in **multiple teams** and thus is a multi-tenant bot application. Traditionally there have been open-source projects such as [Hubot](https://github.com/github/hubot) — the key difference being that a Hubot install works for only one team and not many teams.

![](https://cdn-images-1.medium.com/max/800/1*wMHdqxKIyjtzREWPygVHmA.png)

#### Ok great! Are there any existing tools I can use?

There are lots of great libraries in a variety of languages that let you create simple bot applications. There are two main problems with these approaches:

*   They are not intended for multi-tenant or bot-as-a-service apps; but rather for single-tenant bot applications (a bot you write for your team, for example)
*   With multi-tenancy being a requirement; you have to be able to serve hundreds if not thousands of teams and a lot of these libraries won’t be able to serve them in a memory-efficient manner. The benchmark of memory efficiency is: can a 512MB Heroku dyno be able to serve 1000’s of teams.

#### Enter Stage Left — Relax

When I first started engineering work for [Nestor](https://www.asknestor.me) (a programmable Slack bot platform), I looked for existing solutions that would help me write a Bot-As-A-Service but there weren’t that many forthcoming. What I wanted was a “message broker” — it would listen for Slack events for multiple teams, send them via a channel that my trusty ol’ Rails app can listen to and take action. My design goals for this broker were:

*   **_De-Coupled from the Web App:_** The broker should be de-coupled from the web app; thus enabling admins to scale the broker independently from the main web app.
*   **_Multiplexed Single Stream of Events:_** The web app would only have to listen to a single stream of events that will be multiplexed on to the channel by the broker.
*   **_Low Memory Footprint:_** The broker should be able to serve many thousands of connections from a single Heroku dyno.
*   **_Highly Available:_** Spawning multiple processes of this process should mean that it would tolerate failures **_\*but\*_** more importantly, also guarantee that events and messages sent on the stream are not duplicated.

With these goals in mind, [Relax](https://github.com/zerobotlabs/relax) was created and today powers many thousands of teams on Nestor.

![](https://cdn-images-1.medium.com/max/800/1*lBURyBcgcZHzZf6B65LS8A.png)

#### Ok great — show me the app

The entire source for the Rails App including installation instructions can be found at [github.com/zerobotlabs/relax\_on\_rails](https://github.com/zerobotlabs/relax_on_rails). Here’s a summary of the most interesting concepts:

**_Data Models_**

![](https://cdn-images-1.medium.com/max/800/1*RjeijQx81IkStQavgImiwQ.png)

The app uses Devise and Omniauth to authenticate via OAuth2 on Slack. User represents the currently logged in user, who can belong to multiple Teams via TeamMemberships. A user can also have “Identitites” which contain OAuth2 information such as the token, secret and metadata returned by the OAuth2 callback. A Team also has a single Bot which stores the _bot\_access\_token_ returned by the OAuth2 callback.

**_OAuth Scopes for Slack_**

A couple of things to note while setting up OAuth2 scopes for your Rails app.

*   Set up a “Bot User” while creating your [Slack Application](https://api.slack.com/applications/new) and set a default username for that bot.

![](https://cdn-images-1.medium.com/max/800/1*Kar9Hdei7zIj6GdGe0Ji9Q.png)

*   Remember to set the “bot” scope in your [requested scopes](https://github.com/zerobotlabs/relax_on_rails/blob/master/config/initializers/devise.rb#L236). In this sample application, the scopes requested are _team:read_, _users:read_ and _bot_.

**_Responding to Messages_**

The core of the bot logic is in [_config/initializers/relax.rb_](https://github.com/zerobotlabs/relax_on_rails/blob/master/config/initializers/relax.rb)_._ The example provided in this application is very simple and only responds if the message text contains the word “hello” but it can be extended to perform more complicated tasks.

#### What’s Next?

The eventual goal would be to take this Rails app and create a Rails engine, making it super simple to create bot apps in Rails — watch this space!

In the meantime, if you find bugs/feature requests, please [raise an issue](https://github.com/zerobotlabs/relax_on_rails/issues).

#### Don’t want to run your own Bot App?

If all this sounds complicated and you want to start programming your bot in a couple of seconds, take a look at [Nestor](https://v2.asknestor.me), a programmable Slack Bot Platform.
