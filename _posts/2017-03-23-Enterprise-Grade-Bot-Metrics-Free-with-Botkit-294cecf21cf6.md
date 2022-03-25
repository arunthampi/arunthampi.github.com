---
title: Enterprise Grade Bot Metrics Free with Botkit
description: >-
  Botkit has arguably been the best way to build bots on multiple platforms,
  ever since it’s launch. With over 125 contributors and tens of…
date: '2017-03-23T19:41:17.760Z'
categories: []
keywords: []
layout: post
---

[Botkit](https://github.com/howdyai/botkit) has arguably been the best way to build bots on multiple platforms, ever since it’s launch. With over 125 contributors and tens of 1000’s of bot-makers using Botkit to power their bots, it has become synonymous with the bot revolution.

As a bot maker, the next step after you’ve built your bot is find out how many users you’re getting each day, what they’re are saying to your bot, and to see how many of them are reaching the “conversion point” in your Bot’s flow.

![](https://cdn-images-1.medium.com/max/800/1*HKpL5siUSi9jj6jUvTv8-g.gif)

#### Enter Botmetrics

[Botmetrics](https://www.getbotmetrics.com) is a conversational intelligence platform that instantly gives you answers to these questions with minimal setup for bots built with Botkit.

If this sounds like something your bot can’t live with out — let’s get started!

#### Part 1: Adding Analytics Middleware to your Botkit bot

1.  Install the middleware using [npm](https://www.npmjs.com/package/botkit-middleware-botmetrics)
2.  Instantiate it in your code with two environment variables:

*   `BOTMETRICS_BOT_ID` that uniquely identifies this bot.
*   `BOTMETRICS_API_KEY` that ensures that only you can send metrics for your bot.

3\. Require `botkit-middleware-botmetrics` and use the middleware in your bot like so:

A more detailed example for Slack is [available here](https://github.com/botmetrics/botkit-middleware-botmetrics/blob/master/examples/slack.js). (Facebook Messenger [here!](https://github.com/botmetrics/botkit-middleware-botmetrics/blob/master/examples/facebook.js))

#### Part 2: Connect Your Bot Metrics account to your bot

1.  Sign Up for Botmetrics with [one click](https://heroku.com/deploy?template=https://github.com/botmetrics/botmetrics)!
2.  Setup you Facebook bot by adding your bot’s “Facebook Page Access Token” to Botmetrics.

3\. Now, finally, set the `BOTMETRICS_API_KEY`and `BOTMETRICS_BOT_ID`environment variables in your Bot’s environment based on the values in the settings page and restart your bot!

![](https://cdn-images-1.medium.com/max/800/1*9uNo9oz1oNcI9-r89-P6NQ.png)

Restart your bot and you can now instantly see detailed metrics about your customers such as **_new and active user growth_**, **_demographic_** and **_geographic distributions_**, and user action attributes.

![](https://cdn-images-1.medium.com/max/800/1*phMgFphMaM_mXw7Mfi5Www.png)

In addition, with no engineering effort you will also have the ability to segment users based on these characteristics and send them targeted smart time-zone aware **_notifications_**. Plus other great features such as [**_path analysis_**](https://blog.getbotmetrics.com/path-analysis-demystify-your-chatbot-customer-journey-to-drive-engagement-5f2332e76c12?source=collection_home---4------4----------), [**_link tracking_**](https://blog.getbotmetrics.com/improve-conversions-with-built-in-link-tracking-from-botmetrics-abdcf9dba68a?source=collection_home---4------5----------) and much more.

[**_Sign Up Today for Botmetrics_**](https://www.getbotmetrics.com) and get smart about your Botkit bot’s interactions!
