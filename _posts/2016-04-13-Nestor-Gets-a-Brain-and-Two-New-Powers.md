---
title: Nestor Gets a Brain and Two New Powers!
description: >-
  Nestor so far has been like Leonard Shelby from Memento — great in the moment
  but not so great at remembering things. Not any more!
date: '2016-04-13T14:46:54.528Z'
categories: []
keywords: []
layout: post
---

## Nestor Gets a Brain and Two New Powers!

Nestor so far has been like Leonard Shelby from Memento — great in the moment but not so great at remembering things. Not any more!

#### robot.brain

At the heart of Nestor’s brain the is the _robot.brain_ API introduced in version [0.36.0 of Nestorbot](https://github.com/zerobotlabs/nestorbot/releases/tag/v0.36.1). Developers now can now _set_ and _get_ data that they want Nestor to remember and use that to build way more robust and useful powers for their bot.

An example of a Nestor power that uses the Brain can be seen below:

In the example power above, we can keep track of how many sodas Nestor’s been having by _getting_ & _setting_ the _totalSodas_ variable from the brain, but when the user says _“sleep it off”_, it resets the _totalSodas_ variable in the brain to zero.

#### Finding Users with the Brain

Nestor’s brain also has the capability to retrieve members from your team, making it useful to keep track of users’ attributes inside the brain. robot.brain exposes the _userForId_, _userForName_ and _usersForFuzzyName_ which allow you to retrieve users by ID, by name or by searching fuzzily by name.

### Two New Powers

To demonstrate the capability of Nestor’s new brain, we’re announcing two new powers that will let you keep track of resources within the team as well as keep track of kudos that you give to your team-mates.

#### Checkout

Checkout is a nifty little power that you can use to keep track of resources that are being shared within your team. Someone borrowed the book “The Hard Thing about Hard Things”? You can just say @_nestorbot: checkout The Hard Thing about Hard Things_ and Nestor will now remember that the resource has been checked out and by whom.

![](https://cdn-images-1.medium.com/max/800/1*330WS5u2m5CjLcOhtmDbMA.png)

Read more about the [Checkout power here](https://www.asknestor.me/powers/checkout).

#### PlusPlus

The plusplus power lets you keep track of kudos, recognition and appreciation to your team-mates. Simply say _random thing i’m thankful for++_ and Nestor will keep track of all the kudos that is being shared across the team.

![](https://cdn-images-1.medium.com/max/800/1*1ICxBooikOBg8UTjZIBynQ.png)

Read more about the [PlusPlus power here](https://www.asknestor.me/powers/plusplus).

### Great New Things Coming

There’s more great features and powers coming to Nestor which will make it your indispensable little worker within your team.

If you haven’t signed up for Nestor already, [sign up today, it’s free!](https://www.asknestor.me)