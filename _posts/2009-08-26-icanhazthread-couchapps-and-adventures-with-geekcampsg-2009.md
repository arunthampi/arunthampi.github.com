---
layout: post
title: icanhazthread, CouchApps and adventures with GeekCampSG 2009
---

# [{{ page.title }}]({{ page.url }})

26 Aug 2009 - Singapore
{: .meta }

One week before the inaugural [#geekcampsg](http://geekcamp.pbworks.com) event, I was working on developing a [CouchApp](http://github.com/couchapp/couchapp) which would would let users play around with the entire English Premier League schedule. My reasoning was that it would be an interesting problem which would bring in a lot of cool CouchDB/CouchApp features - such as map/reduce, list and show functions, etc.

It was then, that I came across Joshua Schachter's [shell script](http://a.tinythread.com) (as he put it) called TinyThread, which let Twitter users create threaded conversations in a simple web application. It had a very simple premise and the fact that I happened to be the first/second person to reply to one the first TinyThread thread, made me feel very connected to the whole launch of the product (which seems kinda stupid in hindsight, but never mind). It struck me that this would be an awesome demo application to code up, to showcase CouchDB's capabilities for #geekcampsg.

![i.canhazthread.com thread view page](/images/blog/canhazthread.png)
{: .image }

Thus was born [i.canhazthread.com](http://i.canhazthread.com). It pretty much has the same functionality as TinyThread but over the past one week, there've been some new features added which I like, and there are some more that I would like to be in the product as well. As mentioned during #geekcampsg, i.canhazthread.com is powered by Ruby On Rails and CouchDB. Rails handles all the nitty-gritty behind Twitter-OAuth authorizations and HTML rendering etc, while CouchDB powers the back-end. The CouchDB back-end behind i.canhazthread.com is open source and is available on [GitHub](http://github.com/arunthampi/icanhazthread).

There are some interesting facets of i.canhazthread.com which I'd like to elaborate in detail over a few blog posts, but I'll list them here anyway (as a reminder-to-self):

* The map/reduce view called to display information on i.canhazthread.com's homepage is quite interesting and really helped me understand map/reduce views and the awesome power that it has.
* The Atom feeds for both the [home page](http://i.canhazthread.com/atom.xml) as well as individual threads are powered directly by CouchDB (through the [_list function](http://wiki.apache.org/couchdb/Formatting_with_Show_and_List)) without any Rails intervention.
* The Rails application runs on [Ruby Enterprise Edition](http://www.rubyenterpriseedition.com/) and [Passenger](http://www.modrails.com/) with Nginx and so far, I'm really happy with it.
* I use [delayed_job](http://github.com/shopify/delayed_job) and [God](http://god.rubyforge.org) to deliver tweets in the background, whenever a thread is created/reply is posted.
* This is not that interesting, but I think is a nice use-case for i.canhazthread.com - you can embed GitHub [gists](http://gist.github.com) in your threads and discuss (and reply with) code.

Stay tuned for a few more i.canhazthread.com adventures over the course of the next few weeks.

Finally, I'd just like to give my thanks to the organizers of #geekcampsg for giving me the opportunity to speak and I'd just like to say that I had a great time and hope for more kick-ass GeekCamps in the future. You can get slides of a few #geekcampsg presentations [here](http://www.slideshare.net/search/slideshow?q=+%23geekcampsg&submit=post&searchfrom=header) (NB: This is not the entire list and will probably be updated gradually).

My slides are [here](http://www.slideshare.net/arunthampi/geekcamp-sg-2009-couchapps-with-couchdb).
