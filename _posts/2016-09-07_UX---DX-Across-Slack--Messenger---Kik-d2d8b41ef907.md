---
title: 'UX & DX Across Slack, Messenger & Kik'
description: >-
  At the September Edition of the Slack Developers Meetup, I gave a talk on the
  differences between the three big bot platforms out there…
date: '2016-09-07T23:22:02.498Z'
categories: []
keywords: []
slug: /@iamclovin/ux-dx-across-slack-messenger-kik-d2d8b41ef907
---

At the [September Edition](https://www.eventbrite.com/e/slack-devs-events-api-edition-tickets-27177604948#) of the Slack Developers Meetup, I gave a talk on the differences between the three big bot platforms out there: [Slack](https://slack.com/api), [Facebook](https://messengerplatform.fb.com) and [Kik](https://dev.kik.com).

Having successfully built bots on [Slack](https://www.asknestor.me), [Facebook](https://m.me/getCardIQ) and [Kik](https://github.com/zerobotlabs/moneybot), we’ve gone through the whole experience of crafting user experiences, building, launching and marketing bots and here’s what we learnt across all three platforms.

![](https://cdn-images-1.medium.com/max/800/1*Nif3pZrKLgYOvfMITHCWmA.jpeg)

### Registering Webhooks

![](https://cdn-images-1.medium.com/max/800/1*DmeLJoF3PWU4zRGB6rIC0w.jpeg)

All of the bot platforms rely on webhooks for communication between the end user and your bot application. Slack and Facebook have industry-standard webhook registration mechanisms (via a web UI) but Kik is pretty innovative in this regard — you can [register webhooks via an API](https://dev.kik.com/#/docs/messaging#configuration) which is great when you want to automate deploys of your bot.

### Bot Presence

![](https://cdn-images-1.medium.com/max/800/1*_gyhLRSpSK5KFBy_-P9DCg.jpeg)

Facebook and Kik bots are always “online” — Facebook even sets expectations for the user by providing them with average response times. On Slack, bots will appear offline if you use their new Events API, but if you want them to be online, you will have to use the RTM API to do so.

**_Exclusive:_** At the meetup, Slack announced that they were working on presence as part of the Events API.

### User Information

![](https://cdn-images-1.medium.com/max/800/1*hjQiGQNsnsUq25mzs59ltQ.jpeg)

Kik lags behind Facebook and Slack in this regard — they don’t provide gender and timezone information for example. Slack wins simply by also providing us with user emails. This is especially important for bot makers to run exit surveys after users have disabled their bots.

The more information you have, the better you can understand your user and craft personalized notifications and a superior user experience.

### Bot Onboarding

![](https://cdn-images-1.medium.com/max/800/1*pHhlWh3NRTysd2_z7Wn8JA.jpeg)

Bot Onboarding is pretty across all three platforms but Facebook wins because the “Send Message” UI is so frictionless (there’s no OAuth flows involved) and users can [start conversing with your bot instantaneously](https://m.me/getCardIQ).

### Bot Discovery

![](https://cdn-images-1.medium.com/max/800/1*vzbvjKONd7J7EZUNHBuBPQ.jpeg)

Slack and Kik enable bots to be discovered easily because they have amazing [bot](https://slack.com/apps) [stores](https://bots.kik.com). From personal experience, being featured on the Slack App Store definitely drives traffic and this is something that is [missing from Facebook](http://botweekly.com/issues/25#WrG2qxC).

### Bot Approval Process

![](https://cdn-images-1.medium.com/max/800/1*m6kaZ16nb_Zl3VftlJTwaQ.jpeg)

We haven’t yet submitted our Kik Bot to the Kik Bot Store, but for Slack approval took in the order of days whereas with Facebook it was a matter of hours. Slack however was more detailed in its feedback and made sure the quality and onboarding of your bot was up to snuff.

### Metrics

![](https://cdn-images-1.medium.com/max/800/1*RwFjPchEAvbJ1ssI_JF9lw.jpeg)

None of the platforms provide any real metrics and insights in to a.) how your bot is being used and b.) who is using them

This is where [Botmetrics](https://getbotmetrics.com) comes in ;)

The entire slide deck is [available here](http://www.slideshare.net/arunthampi/developer-user-experience-across-bot-platforms).

_Arun Thampi is a co-founder at bot native tool maker:_ [_botmetrics_](https://www.getbotmetrics.com)_. Botmetrics is the best way for bot makers to understand and engage with their users in meaningful conversation using data._

![](https://cdn-images-1.medium.com/max/800/1*xVXWVhL3QjUAZGByCnwf5A.gif)

[![](https://cdn-images-1.medium.com/max/400/1*rRjUc6JW61AP1UWsa-yItQ.png)](https://docs.google.com/forms/d/e/1FAIpQLSfJDqeR7zbRBfQvx6mouQAhjK4lrCy3z9Z6Ppxln7f1xi12dg/viewform?c=0&w=1)
[![](https://cdn-images-1.medium.com/max/400/1*OGAA3ICxv3ds-RK2Sq4oxA.png)](https://chatbotsmagazine.com/be-featured-in-front-of-thousands-of-people-interested-in-bots-e7040c4080df#.hswzhzpp9)
[![](https://cdn-images-1.medium.com/max/400/1*1XecGp_cGZ1wGLAldRHLWQ.png)](https://chatbotsmagazine.com/want-to-receive-the-best-chatbot-related-content-in-your-medium-feed-20a9c11f11b6#.1t1yhwcyz)