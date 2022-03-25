---
title: Botmetrics ❤️ Botframework️
description: >-
  If you’re like us, and we suspect you are, you’ve probably lovingly crafted a
  bot using Microsoft’s Bot Framework (the most popular way for…
date: '2016-10-11T20:31:16.730Z'
categories: []
keywords: []
slug: /@iamclovin/botframework-%EF%B8%8F-botmetrics-471fb77b6d69
---

If you’re like us, and we suspect you are, you’ve probably lovingly crafted a bot using Microsoft’s Bot Framework (the [**_most_** **_popular way_**](http://venturebeat.com/2016/09/26/microsofts-bot-platform-is-more-popular-than-facebooks-among-developers/) for developers to build bots.) Being data driven, you’re now curious to know how many users you’re getting each day, what they’re are saying to your bot, and to see how many of them are reaching the “conversion point” in your Bot’s flow.

[Botmetrics](https://www.getbotmetrics.com), is an open source analytics package that let’s you meet your customer privacy and security requirements while instantly getting answers to these questions with minimal setup for bots built with Bot Framework.

Integrating Botmetrics consists of two parts — the first is the Bot Framework [middleware module](https://github.com/botmetrics/botmetrics-botframework-middleware) that instruments your Bot with a few lines of code and the second is the Botmetrics service which analyzes, visualizes and lets you act on the metrics collected.

If this sounds like something your bot can’t live with out — let’s get started!

#### **Part 1: Adding Analytics Middleware to your Bot Framework bot**

1.  Install the middleware using [npm](https://www.npmjs.com/package/botmetrics-botframework-middleware)
2.  Instantiate it in your code with two environment variables:

*   _BOTMETRICS\_BOT\_ID_ that uniquely identifies this bot.
*   _BOTMETRICS\_API\_KEY_ that ensures that only you can send metrics for your bot.

3\. Use the middleware in your bot by adding it to your _bot.use()_ function.

A more detailed example is [available here](https://github.com/botmetrics/botmetrics-botframework-middleware/blob/master/examples/example.js).

Next let us setup the service and get the values we need for the two environment variables we created.

#### **Part 2: Connect to Your Private Bot Metrics Analytics Service**

1.  Deploy your own private instance of Botmetrics Service with [one click](https://heroku.com/deploy?template=https://github.com/botmetrics/botmetrics)!
2.  Log On onto your instance. Setup you Facebook bot by adding your bot’s “Facebook Page Access Token” to Botmetrics.

Note: We currently support Facebook Bots via the middleware — shoot us a note if you want to use this with a Slack or Kik bot.

![](https://cdn-images-1.medium.com/max/800/1*0dUppFHL4NLm_mkd0JXUfQ.png)

3\. Now, finally, set the BOTMETRICS\_API\_KEY and BOTMETRICS\_BOT\_ID environment variables in your Bot’s environment based on the values in the settings page and restart your bot!

![](https://cdn-images-1.medium.com/max/800/1*D0LhM_DKrkzrPER5md2o_w.png)

Restart your bot and you can now instantly see detailed metrics about your customers such as **_new and active user growth_**, **_demographic_** and **_geographic distributions_**, and user action attributes.

![](https://cdn-images-1.medium.com/max/800/1*iH2F5iChE1TtGJxnUlUr3g.png)

In addition, with no engineering effort you will also have the ability to segment users based on these characteristics and send them targeted smart time-zone aware **_notifications_**. All while maintaining the privacy and control over user communications.

#### Join the Community

Your questions, contributions and feedback about the middleware or the service are always welcome on [Github](http://github.com/botmetrics/botmetrics-botframework-middleware) and you can also join our community on [Slack](https://slack.getbotmetrics.com).

_☞ We read every response on Medium or reply on_ [_Twitter_](https://www.twitter.com/getbotmetrics)_, so don’t hesitate to let us know what you think._

_☞ Get a weekly newsletter of the best Bot & AI news:_ [_Sign up for botweekly_](http://www.botweekly.com)_._

_☞_ **_Please tap or click “︎_**❤” _to help to promote this piece to others._

![](https://cdn-images-1.medium.com/max/800/1*ByA6P-IpAM0Yxqf8hkuZKA.gif)