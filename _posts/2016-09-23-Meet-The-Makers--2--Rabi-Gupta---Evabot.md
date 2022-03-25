---
title: 'Meet The Makers #2: Rabi Gupta & Evabot'
description: >-
  Arun Thampi: Hi, everyone. Welcome to another edition of BotMetrics: Meet the
  Makers. My name is Arun. I’m one of the co-founders of…
date: '2016-09-23T22:22:20.324Z'
categories: []
keywords: []
layout: post
---

## Meet The Makers #2: Rabi Gupta & Evabot

**Arun Thampi:** Hi, everyone. Welcome to another edition of [BotMetrics](https://www.getbotmetrics.com): Meet the Makers. My name is Arun. I’m one of the co-founders of BotMetrics. Today we’ll be speaking to Rabi Gupta, who is one of the co-founders of Eva bot, which is a gifting bot based out of San Francisco. Hi, Rabi.

**Rabi Gupta:** Hey. Hi, Arun. Thanks for having me here.

**Arun Thampi:** Before we go into Eva bot itself, maybe you can take some time to introduce yourself and your company and what you’re working on.

**Rabi Gupta:** I’m Rabi. I’m one of the co-founders of [Evabot](https://www.evabot.ai). Eva is essentially a chatbot enabled gifting fulfilled through human happiness agents. What we basically do is we remove human efforts from the senders, and we put human experience on the receiver’s end. We are actually doing gifting in the right way. That’s what we are doing right now.

Before this I built another company in India. It was called iCouch, icouchapp.com, for TV channels. We sold it off early this year, and then we came here to basically build this consumer professional product from Valley.

**Arun Thampi:** Got it, cool. You say it was a gifting bot. What platform is it on now because if I remember correctly Eva didn’t start off as a traditional bot that you could think of on Messenger and stuff?

**Rabi Gupta:** We started with a e-mail bot, so e-mail and web-based bot. E-mail is you cc our bot, which is [eva@evabot.ai](mailto:eva@evabot.ai). You cc our bot, and you mention anything in the e-mail, something like, “Hey, I’m gifting you a coffee as a nice gesture,” and Eva will help you out. After that what happens is Eva sends another e-mail in the same thread with a unique link where the user can click and chat with Eva and get their coffee gift. That’s how we started this. Last week itself we launched a Slack part. How Slack part will work is basically teams can appreciate each other for small work, like, “You solved a major bug. Here is a coffee from us as a team.” It’s as simple as saying something like, “send @username a:coffee” and then within Slack the user can actually talk or chat with the bot and get their coffee accepted. Once the coffee is delivered, the happiness agent also takes a picture. That picture comes within the Slack itself, so everyone in the team member can see, “Hey, this guy actually got a coffee for doing something nice.” Right now, we are available on Slack and web-based bot.

**Arun Thampi:** Got it. Any plans to expand to other platforms as well? Messenger and Kick and Telegram and so on.

**Rabi Gupta:** Right now we are focusing more on professional use case, companies and professionals. That’s why Slack made more sense for us. Messenger is a problem. Unless Messenger opens up the Graph API, we cannot actually send gifts because we cannot tag things. You can chat with bot one-to-one and then the bot can send a link probably to your friend, but that will essentially means you copy and pasting that link to your friend. We’ll probably do Messenger only when they allow you tag your friend or they allow us specifically to tag, and that means we need to grow to a much bigger audience before they take notice of that.

**Arun Thampi:** Right, yeah. The absence of group chat is I think one of the weaknesses of Facebook Messenger.

**Rabi Gupta:** They opened Graph API before when and all these companies came up, so I’m pretty sure they are thinking twice about it because it’s not an easy decision for them because brands can easily start abusing people or friends and friends of friends. That would again put Facebook in trouble, so I think even if they do, they will do very specifically partnering with companies they like rather than doing it with everyone.

**Arun Thampi:** Right. As a bot builder that has built on multiple platforms, are there any interesting secrets or tips that you can share with other bot makers?

**Rabi Gupta:** Looking it from the technology point of view, you can find lot of platforms for everything. It’s not difficult to build a conversational bot, and specifically even if you want to use NLPs and stuff, the basic NLP should be easy. I would talk more in terms of why bot makes more sense from a user perspective, from a product perspective.

What we realized was, for example, when people were accepting gifts from us … For example, you as a receiver will receive a coffee today, and then you give micro preferences to the bot saying, “I like Phil’s Coffee, and I like this specific blend. I like it black,” and all of that. All this information is remembered by the bot, so next time when you get a gift, the chat is even shorter because we know what you like. We know where you want your gift.

Interestingly what happened when we were doing this … In traditional-use case if you do this, the user will know I registered for this service, so this service will remember me, but while you are chatting, you are giving all this information without even realizing that you’re registering your service, which was very surprising to me because people used to ask me, “How are you going to do that? How do you remember my preferences?” I was like, “Hey, you gave all your information to the chatbot,” which is as good as registering to a service.

That’s the best part because when you are chatting you are giving information. You don’t realize that you’re registering your service. That is a very psychological advantage which you can have when you are building bots. I don’t know how long it will work. If there are bots for everything, then of course people will realize they are chatting to a bot and registering your service, but for now it works. People should take advantage of that.

**Arun Thampi:** Right. On the flip side, what were some of the challenges that you faced while building Eva?

**Rabi Gupta:** The challenge is expectations. When you start doing something over chat, the thing is people expect a lot from you, and then they are like, “Hey, can you do this? Can you do that? For you, it’s as simple as adding few things or adding an LP,” or “Why are you not asking people what they like as a gift?” Because, again, the thing which is a good thing for you while you’re using bot is also a bad thing because then people expect that this is very flexible and then you can do tons of things with this.

Trying to find the balance because even if right now we have 4 or 5 flows, 4 or 5 gifting categories, it becomes challenging as you add more and more categories, for example, or use cases within the same category. If you realize that whenever a user gets a coffee gift again we should remember it and we should change the flow, but that change should also does not feel like a form. It should again feel like a chat.

All these things are a challenge, and scaling down in terms of use cases is not easy because every flow needs to be tested a lot, and you don’t know … For example, a very simple thing like we used to say something like, “What do you prefer in coffee? Say ‘hot’ or ‘cold.’” Some people didn’t get what does hot or cold means, so we had to say something like, “Do you like your beverage hot or cold?” and then people used to get, “Okay, so hot coffee or cold coffee.”

So, very small things. Some people get it; some people will not get it. Then you have to, because you cannot have a bot saying multiple things, it has to say just one thing, but then 10 people say, “No, people should get it, what the bot means to say.” These are the challenges which you will face, and even if you expand to, say, different countries where there is a different way in which people want to talk, then again it becomes challenging. For example, people will understand texting as something when you want to message someone, but in India people will not understand text, things like that. You cannot have one bot which solves all the purpose for you. Right now we are very specific to Silicon Valley in San Francisco, and that’s why it’s still manageable, but I can assume that as we plan to grow, it will become a challenge to have that lingo right.

**Arun Thampi:** Right. That’s very interesting. We talk about this a lot at BotMetrics too. One of the challenges of bots is that it’s open-ended, and you have this almost random user interface as opposed to a sequential user interface that happens in mobile or web. It is very powerful but at the same time it’s more difficult, like you said, to set expectations on behalf of the user.

**Rabi Gupta:** Yes, true, exactly.

**Arun Thampi:** Tell us about the launch of Eva bot. Did you guys submit to the Slack app store? What were some strategies or tactics that you used to both market the product as well as how did you handle the launch?

**Rabi Gupta:** Slack bot is very new. Slack bot is just a week old. We haven’t yet got it on Product Hunt. It should go on Product Hunt this week maybe. Before that, with the e-mail bot, what we did was we met all these cool people, and we started sending them gifts. Because this e-mail was unique, this e-mail was like, “Hey, I’m sending you a coffee gift because you helped me out,” and then Eva would use to reply on that e-mail. It caught attention of people. That’s how we were able to get initial early adopters and influencers like Chris Messina, Amir from Slack. All these guys used the bot and then talked about us on Twitter. Some of this got us some traffic and credibility especially. Most of the guys we met, they heard about the idea, and they liked it and then they wanted to use it. Till now we have done more than 500 gifts in 3 months, and all organic through word of mouth.

The other advantage is once you send a gift, it is vital because the other person knows about your service now. We are trying few tactics like if a person receives a gift, if within 30 second he or she wants to send a gift, that gift can be discounted. Then we are trying all these experiments, like can we give one coffee free so that they get more users? Can we get 50% discount so that they are more prone to use it? All these things we are trying with the e-mail bot. For Slack, the strategy we are using is actually very cool, which is whoever installs Slack bot in their team, the Eva bot for Slack in their team, they get a free coffee because as soon as you install it, the bot will send you a chat saying, “Here is your free coffee. Chat with me.” Then you chat; you get get your free coffee.

From there, the flow starts. The next flow is you can give 2 more coffees to your teammates. After that 2 more coffees, we tell you that you can get 2 more coffees at a discount. Then we say you can buy a package for your team so that anyone in your team can actually start sending gifts. We’re trying to do that. We’ve got around 15 teams signed up in a week. Again, we try talking to people and telling them about the service. Most of the guys, they just installed it for free coffee, maybe, I don’t know.

The idea is we have this advantage of making people use the product and get a free gift, so that becomes our user equation cost of the gift but then there is no wastage. Every time a gift is received or a free gift is given, those guys also bring us more users. We are using the inherent virality of the product to push it. Sometimes we also get another chance of getting more user when we give the gift. The happiness agent takes the pictures and then we have a chance to tweet it. All these things are there. There are various touch points, so at every touch point we are trying to see what can we do to make it more viral, make it more visible, and make the brand more visible and all of that.

**Arun Thampi:** Right. I think it’s a very interesting strategy that you’re using both messaging and social media and harnessing the built-in virality of both to promote your product.

**Rabi Gupta:** Yeah, exactly

**Arun Thampi:** Cool. What are next steps for you? You mentioned you have a team of 7 people. Are you guys fundraising? What are the future plans for Eva bot?

**Rabi Gupta:** It is just small funding round including the [BoostVC](http://www.boost.vc/) accelerator program. The idea is this month we have a big milestone. We want to hit $10,000 in revenues this month. We have been growing 100% month on month, but this percent we want to grow even faster and see if we are able to show this growth and get all these companies join the Slack bot. After that, the plan is of course go and raise a seed round, maybe October.

**Arun Thampi:** Where can people find Eva bot? Is it evabot.ai, and that’s how you install the Slack bot?

**Rabi Gupta:** Yeah, [evabot.ai](http://evabot.ai) will get all the information. You can also go to [slack.evabot.ai](http://slack.evabot.ai) to directly go to the Slack thing and you can go to [gift.evabot.ai](http://gift.evabot.ai) to directly start chatting with the bot and to send gifts.

**Arun Thampi:** Got it. Where can people find you? Are you on Twitter or Facebook?

**Rabi Gupta:** Yeah, I’m everywhere. Twitter, Facebook, they are easy places to find me.

My Twitter handle is [rgupta29](https://twitter.com/rgupta29) on Twitter. On Facebook, it’s Rabi Gupta.

**Arun Thampi:** Cool. Awesome. It was great to learn about Eva bot, and I’m excited to see it grow. I definitely want to try it out too and both send gifts as well as hopefully receive gifts.

**Rabi Gupta:** Yeah, definitely. It will be great.

Thank you. Thanks for having me here.