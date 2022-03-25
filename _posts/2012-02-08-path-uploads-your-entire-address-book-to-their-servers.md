---
layout: post
title: Path uploads your entire iPhone address book to its servers
section: writing
section_link: '/archives.html'
---

## {{ page.title }}

8 Feb 2012 - Singapore

### Update #2
Path has released a [new version](http://itunes.apple.com/us/app/path/id403639508?mt=8) of the app which asks for permission before it sends your address book to its servers and has [blogged](http://blog.path.com/post/17274932484/we-are-sorry) about the episode.

### Update #1

Dave Morin, the CEO of Path has responded in the comments and I've pasted it below. As an aside &ndash; never in my wildest dreams did I imagine this to blow up like this. I hope we can keep calm and continue to discuss this sensibly.

> Arun, thanks for pointing this out. We actually think this is an important conversation and take this very seriously. We upload the address book to our servers in order to help the user find and connect to their friends and family on Path quickly and effeciently as well as to notify them when friends and family join Path. Nothing more.
> 
> We believe that this type of friend finding & matching is important to the industry and that it is important that users clearly understand it, so we proactively rolled out an opt-in for this on our Android client a few weeks ago and are rolling out the opt-in for this in 2.0.6 of our iOS Client, pending App Store approval.
> 
> Dave Morin
> Co-Founder and CEO of Path

### Original Post

It all started innocently enough. I was thinking of implementing a Path Mac OS X app as part of our regularly scheduled [hackathon](http://dev.anideo.com/2012/01/14/the-inaugural-anideo-hackathon.html). Using the awesome [mitmproxy](http://mitmproxy.org) tool which was featured on the front page of [Hacker News](https://news.ycombinator.com/item?id=3556688) yesterday, I started to observe the various API calls made to Path's servers from the iPhone app. It all seemed harmless enough until I observed a <code>POST</code> request to <code>https://api.path.com/3/contacts/add</code>.

Upon inspecting closer, I noticed that my **entire address book** (including full names, emails and phone numbers) was being sent as a plist to Path. Now I don't remember having given permission to Path to access my address book and send its contents to its servers, so I created a completely new "Path" and repeated the experiment and I got the same result - my address book was in Path's hands.

### Disclaimer

I'm not insinuating that Path is doing something nefarious with my address book but I feel quite violated that my address book is being held remotely on a third-party service. I love Path as an iOS app and I think there are some brilliant people working on it, but this seems a little creepy. I wonder how many other iOS apps actually do the same...

### The Trail of Events

**1.** <code>https://api.path.com/1/users.plist</code>

As soon as you create a new account to Path, a call is made to <code>https://api.path.com/1/users.plist</code> with your first name, last name, gender and password. An plist is returned which contains the user's ID as well as other information such as the date of creation.

<img src="/images/path/signup-1.png" class="screenshot" />

**2.** <code>https://api.path.com/3/moment/feed/home?all_friends=1</code>

This API call uses basic HTTP authentication (with a certain key) to obtain some metadata about myself - from the binary plist file it looks like it contains my first name, last name, cover photo, profile picture, etc.

<img src="/images/path/feed-home-2.png" class="screenshot" />

**3.**<code>https://api.path.com/3/contacts/add</code>

This is the actual offending call which uploads my entire address book to Path.

<img src="/images/path/contacts-add-3.png" class="screenshot" />

This is followed by normal API calls which among others, updates my location, fetches my activity stream and tracks events within the app using [Mixpanel](http://mixpanel.com).

### How to do this at home

This has been tried out on Mac OS X Lion 10.7.2.

1. Download the [mitmproxy](http://mitmproxy.org/) tool and set it up by going to the folder of mitmproxy and running <code>sudo python setup.py install</code>. If all goes well, mitmproxy must be available in your $PATH.
2. Start mitmproxy by running <code>mitmproxy</code>.
3. Obtain the IP address of your computer by running <code>ifconfig en1</code> (or whatever is the interface that you are using).
4. Set the proxy on your iPhone by going to your wireless settings, setting the proxy to be "Manual", and set the IP to be your computer's IP and the port as 8080.
