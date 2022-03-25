---
title: 'Typos Be Gone: Nestor now has Aliases'
description: >-
  One of the common frustrations we’ve felt with Nestor (along with a few others
  who’ve voiced this feedback) is having to type out long…
date: '2016-04-05T14:30:19.839Z'
categories: []
keywords: []
layout: post
section: writing
section_link: '/archives.html'
---

## {{ page.title }}

*Originally posted on [Medium](https://medium.com/@iamclovin)*

One of the common frustrations we’ve felt with [Nestor](https://www.asknestor.me) (along with a few others who’ve voiced this feedback) is having to type out long commands and occasionally making typos and thus causing Nestor not to understand what you’re saying.

I’m happy to announce today that your typo woes are gone! Command Aliases are now live for everyone on Nestor and you have **_unlimited aliases that you can set for your team_**!

#### Inspired by UNIX

By taking cues from Unix, Nestor now has the concept of **_aliases_**. You can create an alias for a command that you type out frequently and thus eliminate errors and unnecessary typing.

For e.g. we frequently look at the “User Signed Up” event on [Mixpanel](https://www.asknestor.me/powers/mixpanel) to find out how many teams have signed up for Nestor at any given time. The command to do that is

> @nestorbot: mixpanel event User Signed Up

This is a long command and is prone to errors. With aliases, I can now create an alias for this command by saying:

> @nestorbot: set alias signups=mixpanel event User Signed Up

Now instead of typing out a long command to find out how many users signed up, I can just say:

> @nestorbot: signups

and voila, I have those stats available.

![](https://cdn-images-1.medium.com/max/800/1*X7nt73JTNk1d3Pbh84Di8A.png)

#### Available Today!

Command Aliases are live today and you can create an unlimited number of aliases for your team!

#### What Is Nestor?

Nestor is your team’s programmable Slack Bot. Nestor automates a lot of the mundane stuff that goes on in your organization and makes your team more efficient and powerful.