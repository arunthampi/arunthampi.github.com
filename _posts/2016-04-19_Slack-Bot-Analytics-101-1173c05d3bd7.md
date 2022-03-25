---
title: Slack Bot Analytics 101
description: >-
  Bots are all the rage now and if you haven’t been living under a rock for the
  last couple of months, bots have been proclaimed to save us…
date: '2016-04-19T16:14:43.997Z'
layout: post
---

## Slack Bot Analytics 101

Bots are all the rage now and if you haven’t been living under a rock for the last couple of months, bots have been proclaimed to save us from the tyranny of apps; create new platforms for VCs to invest in and probably bring about world peace. But in all this excitement, the fundamentals of product development still remain intact:

> Build 👉 Measure 👉 Learn

In this article, I’ll talk about the “Measure” step of bot-building within the context of Slack and some important points you have to consider as you start analyzing how users are interacting with your bot.

### Why Measure?

As with any product you build, your analytics provide you with a guide to make important decisions about your product. It’s not about being data-driven but more data-informed. In the [words of Jim Barksdale](http://bryce.vc/post/26886353878/if-we-have-data-lets-look-at-data-if-all-we):

> If we have data, let’s look at data. If all we have are opinions, let’s go with mine.

Measuring how many requests your bot has handled, who is making them, what teams are the most active are important steps in figuring out product-market fit as well as maintaining quality. In a conversational UI paradigm, your bot not responding correctly to a query/statement from a user is analogous to the fail whale so it is your responsibility to make sure it happens as little as possible.

### What are you measuring with?

For this piece, I talk about how I use Mixpanel in Nestor, but the same principles apply to whatever analytics software you use: [Intercom](https://intercom.io), [Kissmetrics](https://kissmetrics.com), [Heap](https://heapanalytics.com), and so on.

Nestor itself is a Ruby On Rails app that is powered by [Relax](https://github.com/zerobotlabs/relax) as the message broker. The code samples in this piece are written in Ruby. You can find an example Slack Bot App in Rails [here](https://github.com/zerobotlabs/relax_on_rails).

### How do I measure (or: what are the gotchas)?

If you haven’t read my earlier post on setting Mixpanel up correctly, go ahead and [read that](https://medium.com/this-is-how-i-saas/ten-ways-to-get-mixpanel-right-the-first-time-717c87ca041#.8kg3mvokl). Once you’re done, here’s some interesting points to note as you build out analytics for Slack (or team-based products).

#### **Store the User ID of your Bot in your database**

With Slack’s new bot scopes, as part of the OAuth2 callback a User Id of your bot is returned. Make sure to save that in your database. This is an important piece of information to keep for a few reasons:

*   Keep track of whether commands are addressed to your bot or not
*   If users change the bot’s username, you still have the canonical ID which will used to be refer to your bot.

#### **Keep Team Directories Up To Date**

Picture this sequence of events:

1.  Alice signed up for [Nestor](https://www.asknestor.me), the bot then appears online in her team.
2.  Alice then invites Nestor to a channel on Slack…
3.  …which Bob then sees and he starts interacting with Nestor as well.

If you didn’t have Bob as a user on Mixpanel already, that event would be attributed to no one and you wouldn’t be able to capture that very valuable piece of information (i.e. how “viral” your bot is).

This is especially important in the case of Slack because:

> One user can introduce your bot to their team and everyone else on that team can use it \*\***without**\*\* signing up.

In Nestor, whenever a user signs up, the team directory (i.e. all the members of that team) is imported. More importantly, any time a new user is added to your team, the team directory is updated again to make sure that new users have been added. Here’s some code to show how this works. The method to look at is import\_users! in the Team class which uses the bot’s token

If you are using [Relax](https://github.com/zerobotlabs/relax) in your project, you will receive a very handy _team\_joined_ event which will be sent every time a new member is added to a team. When that event is received, I call _Team#import\_users!_ which in turn calls _IdentifyMixpanelUserJob_ and thus makes sure that user is identified on Mixpanel.

#### Keep Track of Whether User Is Signed In Via OAuth Or Not

Because of the inherently “viral” nature of Slack bots, it is important to keep track of users who have signed in to your bot service or not. This is important because if you have to send notifications/product announcements to users, it is important that you only send them to users who have explicitly signed up for your service. Spamming every one with DM’s or Mixpanel notifications is a sure-fire way for your bot to get disabled.

If you look at [Line 20 of the gist](https://gist.github.com/arunthampi/0775c941af484dc17a2ad4dde070220e#file-identify_mixpanel_user_job-rb-L20) embedded above, you can see how I track whether a user is signed in via OAuth2 both in my database as well as on Mixpanel.

#### Keep Track of When Your Bot Is Disabled For Exit Surveys

Your bot can be disabled within a team without users interacting with your website. This happens — your bot might not be for everybody, don’t take it personally and instead use it as an opportunity to conduct an exit survey. Why did you disable the bot? Where did we come short? are all questions you can ask.

To do this however, you need to be able to track when your bot has been disabled. Relax generates an event when that happens and you can go ahead and track that on Mixpanel. The gist below gives more information:

Once you’ve tracked it, you can use Mixpanel Notifications to send exit surveys and collect valuable feedback from your users. In this case, I use the _bot\_enabled_ property to decide which users to send the exit survey to.

#### Keep track of requests that are explicitly made to your bot

By default, if a bot gets added to a channel you get notified of all messages that appear in that channel. However, only a fraction of those will probably be addressed to your bot. It is up to you whether you should track all messages that are sent in a channel but if you do, it is important to make the distinction between messages that are addressed to your bot (and not). This will help you make important observations about the true engagement of your bot.

### In Summary

I learnt a lot of these lessons the hard way as I built [Nestor](https://www.asknestor.me). The important points to remember are:

*   Keep Slack Team Directories in sync at all times (and keep team members sync’ed up on your analytics platform as well)
*   Keep track of whether a user is signed up to your service or not (remember with Slack bots, users can use your service without actually signing up) — this is useful both for measuring bot virality as well as to make sure you don’t spam users unnecessarily with notifications.
*   Keep track of when bots are disabled so that you can perform effective exit surveys.

It’s important for product teams to get this right because the value from having a rock-solid analytics system in place is immense:

1.  You can keep track of the “One True Metric” that you need to grow.
2.  You can send notifications to users based on their behavior (obviously I don’t advocate that you spam your users but it is important to let them know how your product is changing and improving).
3.  When investors ask you how your product is doing, you have clear, to-the-point answers.

👉 If you would like an easier-to-use bot analytics platform, check out [https://getbotmetrics.com](https://getbotmetrics.com)

🙌 Many thanks to [Buster](https://twitter.com/buster), [Derrick](https://twitter.com/derrickko), [Sandeep](https://twitter.com/_sandeep) and [Sneha](https://twitter.com/snehamenon) for reading drafts of this.

👉 Arun has been building Slack Bots for over a year now and is working on [Nestor](https://www.asknestor.me) — a programmable Slack Bot Platform that lets you automate ALL THE THINGS in your team.

👉 **_Please tap or click “♥︎”_** to help promote this piece to others.
