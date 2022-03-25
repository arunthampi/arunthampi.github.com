---
title: Ten Ways to Get Mixpanel Right the First Time
description: >-
  Measuring what your users are doing on your site is an important part of the
  product building process. While almost all of us use Google…
date: '2015-07-20T05:00:36.363Z'
categories: []
keywords: []
layout: post
section: writing
section_link: '/archives.html'
---

## {{ page.title }}

*Originally posted on [Medium](https://medium.com/@iamclovin)*

Measuring what your users are doing on your site is an important part of the product building process. While almost all of us use Google Analytics as the de-facto analytics solution for our apps — it has a few limitations that some newer players address. [Mixpanel](https://mixpanel.com) is one such analytics solution that focuses on the actions that a user takes (events) as opposed to the ‘page-view’ centric approach that Google Analytics takes.

With a detailed insight into user actions, you can tailor your messaging, figure out what features are working and which ones need tweaking and, come up with a better on-boarding process for your users. Mixpanel also offers ways for you to communicate with your users (both via e-mail as well as in-app notifications) based on the actions that a user has or has not taken.

Being a Mixpanel customer for the last few years, I can say that it has been great but it can be tricky to setup the first time. Having made these Mixpanel integration mistakes at [Nitrous](https://nitrous.io) here are the best practices that I’m applying to [Nestor](https://asknestor.me).

#### 1\. Use Easy-to-Grok Event Names

Our first iteration of integrating Mixpanel involved event tracking with names such as “signed\_up”. While there isn’t anything holding you back technically from doing so — skimming through metrics or settings up funnels becomes a whole lot easier when you choose easy-to-read and meaningful names such as ‘Visited Home Page’, ‘User Signed Up’ and so on.

#### 2\. Choose a Single Place to Track Metrics

It’s best to pick one place to track your metrics — either the frontend (Javascript, iOS, Android app) or the backend. In my opinion it’s best to track \*key events\* (such as ‘User Signed Up’, ‘Invited Friend’ and so on) in the backend, because for a multi-platform app, you don’t have to add event-tracking code in all of your clients.

In Rails, it’s also a good practice to have all of your event tracking happen in [delayed jobs](https://github.com/collectiveidea/delayed_job) outside the request cycle so that you don’t tie up your Rails action with HTTP calls to external services.

#### 3\. Use Proper Distinct IDs for Event Tracking

Mixpanel has the concept of [distinct IDs](https://mixpanel.com/help/questions/articles/what-is-distinctid) which identify customers throughout their time on your app or site. A distinct ID \*must\* be unique and every event that you send to Mixpanel has to have the distinct\_id set correctly if you want funnels, segmentation, formulas and retention to work correctly. At Nitrous I made the mistake of using “email” as the distinct ID to be used for Mixpanel events. While it seemed like an OK choice at the time, things started to get hairy when users changed email addresses.

It is much better to use the ID of the user record in your database as the distinct ID. Database IDs have the advantage of being impervious to username/email changes.

#### 4\. Keep Track of Initial Mixpanel Data for Better Segmentation

When a user first lands on your site, Mixpanel cookies a bunch of useful information about the user such as ‘referer’, ‘referring domain’, UTM tags, etc. Make sure you save this information in the database so that they can be used as parameters for all subsequent events that are tracked by the user. This will allow you to run segmentation for all events. For example, this will enable you to query Mixpanel to get the number of people who _created a post that were referred from Facebook_ or the number of people _who came from my latest blog post who upgraded to the Pro Plan._

This is how I do it in Rails with concerns and Devise:

In the **_registrations\_controller_**, you then include **_Mixpanelable_** and save [**_@mp\_properties_**](http://twitter.com/mp_properties "Twitter profile for @mp_properties") as part of the **_User_** model:

#### 5\. Track Important Events in the User Profile using the People API

Say you are tracking when a user creates a new post for your blogging app as the ‘User Created Post’ event. It is a good practice to also set the **_last\_created\_post\_at_** attribute on the user profile using the People API. The reason for doing this is that Mixpanel notifications are tied to their **People** product and not their **Events** product. So if you want to send an email/notification to a user depending on whether she has created a post, you would need to set that attribute on the user profile.

#### **6\. Identify your Users Correctly**

Another issue that came up at Nitrous was that events were not being attributed to the right person. This manifested itself in funnels not showing data correctly and the problem was that we were not “alias”-ing users correctly.

As mentioned before, Mixpanel uses Distinct IDs to track users. When a user first visits your app/site and is unauthenticated, she is allotted a random distinct ID that is cookied. The user might decide not to sign up immediately and come back at a later time to sign up. At the time of sign up, it is important that you alias the user to use the ID of the user and then start using the user’s database ID as the distinct ID for all events going forward.

In iteration#1, we weren’t doing any [alias-ing](https://mixpanel.com/docs/integration-libraries/using-mixpanel-alias) at all, which meant that we weren’t able to track ‘Viewed Home Page’ -> ‘User Signed Up’ conversions.

In iteration#2, after talking to the excellent Mixpanel support crew, we started doing alias’ing but weren’t picking up the right distinct ID that Mixpanel was generating and so we were alias’ing the wrong user accounts.

It is also important to note that the \*aliasing for a user must happen before any other events for that user are tracked\*.

We finally got it right, and here’s a snippet demonstrating how it’s done (**_attributes_** is the **_mp\_properties_** field from the previous Gist):

As always, test thoroughly during development to make sure that everything works as intended (See #10 for more).

#### 7\. Delete/De-Activate Users from Mixpanel when users cancel accounts

When users are removed from your system make sure you remove (or set a de-activated flag) the corresponding user profile from Mixpanel. This will ensure that when you send automated notifications to all of your Mixpanel users, you don’t continue to send them emails.

#### 8\. Track time instead of boolean for People API attributes

Whenever you are tempted to set a boolean attribute on a User profile (using the People API), use a datetime instead. This will enable you to send better notifications via Mixpanel since you know when the last time was that the user performed a certain action (as opposed to a boolean).

#### **9\. Use $ignore\_time When Back-Filling your Mixpanel User Profiles with data**

It is inevitable that you have to back-fill your Mixpanel user profiles with additional data that you may have started collecting. For example, we started using LinkedIn as an OAuth endpoint for Nitrous and collected users’ current place of work, the size of their company , etc. This is important information that can be used to segment users (to send targeted emails, etc.) and so we needed to backfill a big portion of our existing users with this data.

What we didn’t realize is that by calling the Mixpanel API for a given distinct ID — even if it is to use the People API to populate data for the user; Mixpanel assumes that the event was triggered by the user and thus will set the “Last Seen At” attribute of the user to the current time.

So don’t be surprised when you use the People Explorer to find out that almost your entire userbase was on your site in the last few minutes!

To avoid this, set the **_$ignore\_time_** flag to true when setting attributes on User Profiles. This will ensure that the “Last Seen” attribute will not get updated and so you can back-fill as much as you please.

#### 10\. Test in Development Thoroughly

Use a “development” project to test that all your metrics are being tracked correctly and all your funnels are working as intended. Mixpanel has a handy “Reset Project Data” feature that lets you wipe your Mixpanel data and start over once you’ve fixed bugs.

After a few painful episodes of not doing things correctly, I’ve learnt that it’s best to test and make sure your event tracking works as intended — otherwise when it’s time to make your pitch deck or present to your board, you’ll end up banging your head against the wall with numbers that don’t make any sense.

#### Nestor

If you’ve been wondering what Nestor is all about — it’s a platform that I’m building which aims to be your team’s intelligent assistant on [Slack](https://slack.com). You can try it for free with your team here: [https://asknestor.me](https://twitter.com/_sandeep)

#### PostScript

Thanks to [Orien Wu](https://twitter.com/orienwu) & [Sandeep Chivukula](https://twitter.com/_sandeep) for reading drafts of this post
