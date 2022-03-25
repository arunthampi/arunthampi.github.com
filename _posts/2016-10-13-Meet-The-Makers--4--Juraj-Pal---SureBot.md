---
title: 'Meet The Makers #4: Juraj Pal & SureBot'
description: >-
  In this week’s edition of Botmetrics Meet The Makers, we speak to Juraj Pal,
  who is working on SureBot, a bot that lets you find the best…
date: '2016-10-13T15:23:45.448Z'
categories: []
keywords: []
layout: post
section: writing
section_link: '/archives.html'
---

## {{ page.title }}

*Originally posted on [Medium](https://medium.com/@iamclovin)*

In this week’s edition of [Botmetrics](https://www.getbotmetrics.com) Meet The Makers, we speak to [Juraj Pal](https://twitter.com/jurajpal), who is working on [SureBot](https://syre), a bot that lets you find the best places to eat and drink.

**Arun**: Hey everyone. Welcome to another edition of Botmetrics, Meet the Makers. We are here today with Juraj, who’s one of the founders of [BeSure.io](http://surebot.io), or Sure is the name of the bot. Hey Juraj.

**Juraj:** Yup. Hey, hi everyone.

**Arun:** Cool, so before we get into the bot itself, maybe you can give a little introduction about yourself and the team, and how you got into bots in the first place?

**Juraj:** Sure. Yeah, thanks for having me. My name is Juraj, I’m on of the cofounders of Sure. We’re 3 cofounders. It’s myself, Alex, and Sebastian. We’re kind of a bit of a distributed small team. 2 of us are based in between Copenhagen and London, so in Europe, and then we have our technical founder in Vancouver. Also mixed nationalities, I’m originally from Slovakia.

We got together quite randomly I would say at a startup event here in Copenhagen and since then, we’ve been really interested in the early stages of conversational interfaces and had this idea, an almost bit of a pain that we wanted to solve for ourselves, and that’s how Sure was kind of born. My background is more in business, but very interested in tech, so kind of business moving into tech, that sort of thing.

**Arun:** Got it, yeah. It’s very interesting to hear always, start ups that come about because of personal problems that you faced and you want to solve them, so it’s always great to hear that.

**Juraj:** Exactly, yeah.

**Arun:** Cool. What does Sure do?

**Juraj:** The problem that I was talking about that we had, was that were unsatisfied with the current tools that you have right now for finding place to go out and eat or drink, or something like that. We have Google, we have Yelp, we have whatever else is out there, but we just felt that for us, those services weren’t good enough, they weren’t personalized enough, so we would still end up asking our friends and we figured out many people are doing that.

Then we thought, well maybe we can deliver that service even better in a platform people are using already, which is messaging, kind of become that trusted friend that people can go to and ask about a recommendation. Sure is essentially a bot for finding the best curated food and drink places out there. It’s not available globally yet, we started with San Francisco, Copenhagen, as kind of a beta to test the value proposition. Now we added London, out of beta going to London, so really tried to prove the concept there. Then hopefully we can expand to globally and to other big cities as well.

**Arun:** Cool, and what platforms is it on right now?

**Juraj:** Right now, only on messenger. We kind of chose messenger because, also from different markets we were in, people were already on messenger and using it quite heavily, so we thought that’s the platform that makes sense. Ideally we want to stay as \[tech 00:03:22\] agnostic as you, or platform agnostic that we can be to just be present whenever the user is.

**Arun:** Got it, yup. I think that makes a lot of sense. Do you have any kind of machine learning and natural language processing going on with your bot?

**Juraj:** We’re not building that ourselves because we figure that’s not going to be scalable and we wanted to get to the market as soon as possible and prove the fit. We’re using \[API.AI 00:03:51\], as many other bot makers are I guess. We started by \[IBM Watson 00:03:58\] actually, which is a fun experiment, back then before Facebook opened up their messenger platform. Those are some really great learnings, kind of how we can build a conversation experience like that. Now we moved to API.AI.

**Arun:** Got it, cool. What sort of interesting secrets or tips can you share as you built this bot? You said you experimented with Watson and moved on to API.AI. Any tips that you can share with other bot makers?

**Juraj:** Yeah sure, you learn a lot, especially since the really new way of interacting with technology. Well, not new when we look at the whole thing, but currently. I was telling the cofounder here, actually wrote out all these learnings and published in \[Adventure Beat 00:04:49\], and my favorite one out of there was actually, to always suggest a second best action or step. Almost like you see in some other products, but that’s what we also found, that the interactions were really really short, which we thought also that could be fine because then maybe the problem that the user was solving with our product was just solved and then the user moved on.

For example, if you’re asking for a restaurant, then why doesn’t the bot ask you, “Here’s you restaurant, but would you like to book a table? Once you book a table, why don’t you order an Uber through the same interface?” Kind of always thinking the next best action and providing that to the user, I think that’s a great value provider. Yeah and maybe kind of one more general learning for me was that, with chat bot that’s out there now, you really have to start with a very focused one.

Build a really nicer design experience as well. Even with our use, you could say that it’s not really that kind of small way thing, because even for a restaurant, you can ask in so many ways. That proved to be kind of the chat bots that I see that are big potential, where they start with a really focused use case then maybe expand.

**Arun:** Right, and where are you getting your data sets from, to do all of this restaurant search?

**Juraj:** At the beginning, we actually did all of this manually. At the very very beginning, we even replied manually just to really validate the idea. Then we started building our own data base by … We live in Copenhagen, so we knew some of the places, we had some knowledge of London or San Francisco. Could always contact some people who know the neighborhoods and can give us the local knowledge.

Now, since we wanted to scale and provide a large data base in London, we tapped into some existing data bases and APIs, but still kind of curated a layer on top of it. Because if we say that, “Hey we want to be better than all these services like Yelp or Foursquare, or what else is out there,” then we can’t just hook our share bot to that and assume that the problem is solved. We really needed to keep that different curation when we list those places.

**Arun:** Yup, that’s cool. What are some of the challenges that you face as you were building the bot? I’m sure it probably wasn’t smooth sailing throughout. Yeah, maybe you can talk through some of the challenges that you faced.

**Juraj:** Yeah, it’s still not smooth sailing I would say. We’re learning a lot from usage, but I think one thing that I realized was that we say a lot that we need to advocate, our bot needs to be really easy to speak to and really good at understanding, but I learned that also the users need a bit of education on how to talk to bots actually. I think it’s same with apps, when apps came early on, that was a new thing for people as well, for consumers. That’s one thing to kind of educate the user’s quite challenging on how to not end up in a dead end after the second message or something like that.

That’s bit of a challenge, to always, as I said, always have the second best, next best action or always have the right button, always lead the user the right way, that’s quite challenging. Natural language processing in general is still a bit of a challenge, but at least by usage we can improve that.

**Arun:** Right, yeah the first thing that you mentioned about training the user is definitely something that I faced as well as a bot maker. If you kind of keep the whole thing open and dead, people always say random things to your bot and you want to guide them to that path.

**Juraj:** Exactly.

**Arun:** Do you make use of buttons and user interface elements, or quick replies and so on to guide the user down the path that you want them to go down?

**Juraj:** Yeah, we do now. We had a big discussion on this early on, because when we started and when we had the first bot on IBM Watson, it was very conversational, so no buttons. This was pretty message platform. There were no buttons, it was really, it really felt like you were talking to a friend, once the national language acquired as well. With the platform we added these buttons and we added quick replies and some of the elements, but always kept in mind, just build something where you’re just tapping buttons and that’s it.

If it’s a chat button it about chatting, and that’s kind of the whole value proposition of doing something. Conversation interface is about having a conversation, and that goes with our vision that if we want to better connect customers and also businesses, in our case in restaurants, then the conversation element needs to still be present. I think buttons and other elements such as these can enable this to some extent.

**Arun:** You mentioned that you were still in beta, so how is the launch gone so far in the 3 cities that you’ve launched, and what are some of the lessons and iterations that you’ve made once your bot has been in the hands of real people?

**Juraj:** We’re not auto beta in London and Copenhagen as well, but yeah, you never know what’s happening. The launch was kind of funny. I remember I was traveling somewhere and then it was during the EPICS conference time, so \[inaudible 00:10:58\], whole team waiting for that and what’s going to be announced and all that stuff. We were awake, it was early at night in Europe, but then I remember it was I think [Marson from conversational journalism](https://twitter.com/convjournalism), a more famous Twitter account around chat bots and everything conversational. I think he made a really early Google spreadsheet with some of the early bots that launched at the conference, and then somehow include some other bots that he found, included us which was great but we weren’t expecting it.

By that time, our bot wasn’t really officially approved by Facebook or it wasn’t part of the partners, the launch on the stage of that phase, so definitely not expecting. Suddenly we went from casual 3 messages per day to more than 3,000 per day, so obviously quite difficult to handle that and loads of not great ends of conversations, lots of dead ends, lots of swearing from users and all that stuff, as you probably experienced as well, but great for learning. All the users we got in that week and the weeks after, it was just growing and we were exciting about it, so working really hard to make this work.

We have the Europe team and then we have our technical founder in Vancouver, which is on a different time zone. We were kind of using that to almost \[turn 00:12:32\] 24 hours, so we would always be monitoring the conversation and he would making changes and releasing that as fast as we could. That was again great value of building chat bot, I realized that we can really push us out there really fast and really efficiently. That was kind of the unintentional launch, but I’m really grateful that it happened now because now we could leverage that and grew.

Since then, we haven’t done any more bigger launches, but we were … The community behind bots and whatever \[Matt 00:13:10\] started on Facebook with the group which is great resource for us, both in terms of sharing the knowledge but also getting it in front of really early adopters. That was really helpful and stress testing the bot, but now also figuring out the challenge, how we can reach the actually right target user of ours and how we can educate the consumers who might have no idea of what chat bot is, how to interact with it. Those are kind of the activities in terms of launching to that user group now.

**Arun:** Right, and is there some sort of viral element built into the bot? How are new people discovering the bot today?

**Juraj:** Yeah we’re trying to build this element there. We recently added kind of an opportunity to share a place, once you find it. If you find a restaurant and you really want to go there, or for example you are going for a coffee with a friend or even a business meeting, you can share that place out that friends or to a group of friends that you’re going with. That one, we’re still kind of evaluating how that’s working, but so far that’s proven to be really great element how to bring other people, because those people share it out to their friends. Our bot appears in that other conversation and there’s a button to actually try our bot, so once it’s happened, that they can start using Sure as well. That’s kind of the first experiment that we’re doing around building virality into the product.

**Arun:** Got it, cool. What are kind of next steps for you in terms of both the product and the company? Are you guys funded? Are you thinking of taking on funding? Generally in terms of the product as well, what are next steps for you?

**Juraj:** In terms of the company, we are currently looking to how we can scale up to other cities fairly quickly. We are fundraising right now and thinking what can be the boost for us to be there where we need to be quite quickly. Right now, our big focus is in London and kind of proving that stickiness with the right users instead of just a group of early adopters. That’s definitely one challenge that we are solving. Also, how we can get retention into this as well. Especially with the early adopters I would say, you get people trying out bots just because it’s fun and they just do that, but what does it actually take to bring people back to use it on a normal basis.

In terms of product, we’re always kind of improving the experience. Whether it’s geo location, allowing users to send pin and get recommendations close to there. Proximity, that’s one of the next steps. Always improving the data base and the quality of places that we have and list and recommend. An important one is also to become that really personalized service. We can’t just say that we’re personalized, we need to also deliver on that. We want to be learning from the usage and if you’re using Sure, we want to only recommend you to stuff that you are actually interested in and that you want and that fits your preferences. I think those 2 things are really the biggest goals right now.

**Arun:** Got it, cool. If you had any feedback to give the folks building messenger, what do you want from messenger as a platform? They just made a bunch of new announcements last week with payments and so on, but what would you like to see as part of the messenger platform?

**Juraj:** Many things.

**Arun:** It’s still early days, yeah.

**Juraj:** To be honest, really great work what they are doing, and the recent update was really exciting for us. Payments are really exciting and many things that were released go within hands with the things that we have in our roadmap and that we want to test with the users. Messenger is also figuring out a lot of things with bots, and so our we, so we just want to have the right tools too that enable us to go out to a user, to a customer, to business, and validate what we think might be the value for them on messenger.

If we’re talking about connecting restaurants with their customers, what is the best way of doing that, or if it is the user experience when you’re looking for a restaurant does it need to end with discovery or can we provide other transactional elements on top of that? As we get more of these tools, it’s going to be really really interesting to start testing them I think, but yeah I don’t think I can say just one thing. It’s going good so far.

**Arun:** Where can people find the bot? I don’t think we mentioned the url to your web page, so where can people start a conversation with Sure?

**Juraj:** Our website is BeSure.io. You can also start chatting with it at [m.me/surebot](https://m.me/surebot). That’s where we are.

**Arun:** Cool, awesome, and where can people find you on the internet? Are you on Twitter and-

**Juraj:** I’m on Twitter and all social media with [JurajPal](https://twitter.com/jurajpal). Sure on Twitter is [BeSure](https://twitter.com/besure).

**Arun:** Cool, awesome. I’m definitely looking forward to seeing more from the Sure bot and good luck with everything and the fundraising and so on. Hope to hear more from you.

**Juraj:** That was great. Thanks so much everyone.

**Arun:** Cool, all right. Thanks so much, bye.

**Juraj:** Cool, bye.

_☞ We read every response on Medium or reply on_ [_Twitter_](https://www.twitter.com/getbotmetrics)_, so don’t hesitate to let us know what you think._

_☞ Get a weekly newsletter of the best Bot & AI news:_ [_Sign up for botweekly_](http://www.botweekly.com)_._

_☞_ **_Please tap or click “︎_**❤” _to help to promote this piece to others._

![](https://cdn-images-1.medium.com/max/800/1*ByA6P-IpAM0Yxqf8hkuZKA.gif)