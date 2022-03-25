---
title: 'My Slack Bot Got Slow: How I Made It Fast Again'
description: >-
  Nestor is a programmable Slack Bot that supercharges your team. Nestor comes
  with a bunch of super powers that enable your team to get…
date: '2016-09-07T23:19:36.657Z'
categories: []
keywords: []
layout: post
section: writing
section_link: '/archives.html'
---

## {{ page.title }}

*Originally posted on [Medium](https://medium.com/@iamclovin)*

Nestor is a [programmable Slack Bot](https://www.asknestor.me) that supercharges your team. Nestor comes with a bunch of super powers that enable your team to get productive immediately (so Heroku, Mixpanel, CircleCI, Github, Papertrail, Librato and [more](https://www.asknestor.me/powers)) without any installing 20 different bots!

With close to 2,000 teams using Nestor, performance started to degrade and in this piece, we will go through how we tracked down the problem and fixed it.

### The Slow Down

The tell-tale signs were all too familiar: The dreaded [**_R14 “Memory Quota Exceeded Errors”_**](https://devcenter.heroku.com/articles/error-codes#r14-memory-quota-exceeded) from Heroku. The Heroku platform deals with “Memory Quota Exceeded” errors by using disk swap which severely slows down your application.

![](https://cdn-images-1.medium.com/max/800/1*8AbF-g5X6oWeXPeLcTBKUg.png)

**_Sidenote:_** Setup notifications for Platform Errors and pipe them to Slack (using [Papertrail](https://papertrailapp.com)), so that you’re always on top of things.

The Memory-Quota Exceeded notifications would occur every few hours (until I restarted the Nestor web app) and constantly restarting your application is not a good long-term strategy (whatever DHH might say).

### The Investigation Begins

There were a few simple ways to start the investigation:

#### **New Relic Is Your Friend**

In the “Transactions” section on New Relic, you can find out which are the most time-consuming transactions on your app and by a long-shot, the most time-consuming transaction on Nestor belong to _ImportUsersForTeamJob._

![](https://cdn-images-1.medium.com/max/800/1*cG47THOvS0Ji_OuZrg-f7g.png)

A few portions of Nestor’s code is [open-source](http://github.com/zerobotlabs/relax_on_rails) so luckily we have some context on what that is.

ImportUsersForTeamJob is called **_whenever a new team signs up_** to use your bot, and whenever a new member is added to the Slack team and your **_team’s directory needs to be refreshed_**.

ImportUsersForTeamJob calls [Team#import\_users!](https://github.com/zerobotlabs/relax_on_rails/blob/master/app/jobs/import_users_for_team_job.rb#L5-L6) which calls the _users.list_ Slack API to get the team directory, parses the JSON and makes/updates entries in the Nestor database.

#### **Run-Time Metrics on Heroku**

Great, so long execution times is one thing and since this was running asynchronously in a Sidekiq job, it wasn’t really affecting performance. The next step in the investigation was to figure out if this was affecting memory usage.

Luckily, Heroku has a way for you to monitor this with its “log-runtime-metrics” Labs feature that periodically outputs the memory used by your dyno (along with other information such as CPU, load average and so on).

![](https://cdn-images-1.medium.com/max/800/1*7gO6AQfZ_5iFwUg_o7JW9A.png)

What I found out was that there was definitely a memory leak happening whenever _ImportUsersForTeamJob_ completed execution (memory used by the dyno would steadily increase over time).

![](https://cdn-images-1.medium.com/max/800/1*oBeT4cYtOx3JzQjSe1FLfg.png)

#### **More Logging**

Upon adding more log statements in the _Team#import\_users!_ method I found out that there were very large teams (1000+ members) that were adding new members every few hours. Every time the method finished running, a memory leak was happening. The imports for the really large teams was also causing the large amount of the “slow transactions” on New Relic.

But why was this happening?

### Identifying The Problem

I had a few theories as to why importing large team directories might be causing a leak — our HTTP client was downloading a really large JSON payload from the Slack API and the client library might have a leak? Maybe the JSON library has a bug that causes a leak to happen when it’s parsing really large strings. Since we were holding references to the parsed hash for a long time, that was causing a leak to happen?

One major red problem was that we were **_synchronously downloading a large payload_** from an API and parsing it synchronously as well.

### Deploying The Solution

Instead of doing things synchronously, we can solve this problem by **_streaming the response from the Slack API_**, and use a **_streaming JSON parser_** to parse the HTTP response on the fly and make sure we assemble our team directory that way. The resulting code is here:

The first step was to modify our Slack Client to yield chunks of data to the caller rather than parse the entire response:

and Step 2 was to modify the _import\_users!_ method on _Team_ to make sure it parses streams of JSON rather than the entire response body:

### The Result

Once we deployed this solution, we found that from log-runtime-metrics plugin, that memory leaks weren’t happening any more even after very large teams were onboarded or updated and the platform error notifications stopped as well.

Performance went up, queues weren’t clogged any more and Nestor was back to doing what it does best — serving your Slack team in a jiffy!

### Want A Simpler Way To Run Your Slack Bot?

If you want to run your Slack Bot in peace without worrying about scaling and performance problems, check out [Botmetrics](https://www.getbotmetrics.com) — a way for you to run your Slack Bot and get rich metrics about your bot.

![](https://cdn-images-1.medium.com/max/800/1*xVXWVhL3QjUAZGByCnwf5A.gif)

[![](https://cdn-images-1.medium.com/max/400/1*rRjUc6JW61AP1UWsa-yItQ.png)](https://docs.google.com/forms/d/e/1FAIpQLSfJDqeR7zbRBfQvx6mouQAhjK4lrCy3z9Z6Ppxln7f1xi12dg/viewform?c=0&w=1)
[![](https://cdn-images-1.medium.com/max/400/1*OGAA3ICxv3ds-RK2Sq4oxA.png)](https://chatbotsmagazine.com/be-featured-in-front-of-thousands-of-people-interested-in-bots-e7040c4080df#.hswzhzpp9)
[![](https://cdn-images-1.medium.com/max/400/1*1XecGp_cGZ1wGLAldRHLWQ.png)](https://chatbotsmagazine.com/want-to-receive-the-best-chatbot-related-content-in-your-medium-feed-20a9c11f11b6#.1t1yhwcyz)