---
title: Kik ❤️ Botmetrics
description: >-
  The Kik Messenger platform is a pioneer in the messaging and conversational UI
  space. With more than 20,000 Kik bots and over a billion…
date: '2016-11-04T13:16:01.362Z'
categories: []
keywords: []
slug: /@iamclovin/kik-%EF%B8%8F-botmetrics-ffbd08a3c791
---

The Kik Messenger platform is a pioneer in the messaging and conversational UI space. With more than 20,000 Kik bots and over a billion messages being exchanged with bots, it becomes even more important to think about analytics and engagement for these bots.

![](https://cdn-images-1.medium.com/max/800/1*Wuf0Z-RA11XYj2MlIsCA5Q.png)

Integrating Botmetrics is an easy two step process — the first is the Kik [middleware module](https://github.com/botmetrics/botmetrics-kik-middleware) that instruments your Bot with a few lines of code and the second is the Botmetrics service which analyzes, visualizes and lets you act on the metrics collected.

Let’s get started!

#### Part 1: Adding Analytics Middleware to your Kik bot

1.  Install the middleware using [npm](https://www.npmjs.com/package/botmetrics-kik-middleware)
2.  Instantiate it in your code with three environment variables:

*   _BOTMETRICS\_BOT\_ID_ that uniquely identifies this bot.
*   _BOTMETRICS\_API\_KEY_ that ensures that only you can send metrics for your bot.
*   _KIK\_USERNAME_ is the username of your Kik bot.

3\. Use the middleware in your bot by adding it to your _bot.use()_ function.

A more detailed example is [available here](https://github.com/botmetrics/botmetrics-botframework-middleware/blob/master/examples/example.js).

Next let us setup the service and get the values we need for the two environment variables we created.

#### Part 2: Connect to Your Botmetrics Analytics Service

1.  Sign Up to [Botmetrics](https://www.getbotmetrics.com/users/sign_up).
2.  Log On onto your instance. Setup you Kik bot by adding your bot’s “Kik API Key” and “Bot username” to Botmetrics.

![](https://cdn-images-1.medium.com/max/800/1*qzLjmkZU2E-kin3StBzqwg.png)

3\. Now, finally, set the _BOTMETRICS\_API\_KEY_ and _BOTMETRICS\_BOT\_ID_ environment variables in your Bot’s environment based on the values in the settings page and restart your bot!

Restart your bot and you can now instantly see detailed metrics about your customers such as **_new and active user growth_**, **_demographic_** and **_geographic distributions_**, and user action attributes.

![](https://cdn-images-1.medium.com/max/800/1*P6uEb0oWQZNkLTkNjNa0jw.png)

In addition, with no engineering effort you will also have the ability to segment users based on these characteristics and send them targeted smart time-zone aware **_notifications_**. All while maintaining the privacy and control over user communications.

#### Join the Community

Your questions, contributions and feedback about the middleware or the service are always welcome on [Github](http://github.com/botmetrics/botmetrics-botframework-middleware) and you can also join our community on [Slack](https://slack.getbotmetrics.com).

_☞ We read every response on Medium or reply on_ [_Twitter_](https://www.twitter.com/getbotmetrics)_, so don’t hesitate to let us know what you think._

_☞ Get a weekly newsletter of the best Bot & AI news:_ [_Sign up for botweekly_](http://www.botweekly.com)_._

_☞_ **_Please tap or click “︎_**❤” _to help to promote this piece to others._

![](https://cdn-images-1.medium.com/max/800/1*kn4xNt5XDklXxzfhOtJI_w.gif)