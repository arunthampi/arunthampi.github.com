--- 
layout: post
title: EventedNet - A new way to make evented HTTP calls in Ruby
---

# [{{ page.title }}]({{ page.url }})

19 Aug 2008 - Singapore
{: .meta }

I caught the 'evented' bug last week when I started poking around EventMachine for an internal EventMachine based library at [work](http://www.wego.com). Basically, I wanted an HTTP library which could be used in an evented fashion while being used in an EventMachine reactor, and in the boring synchronous way, when used outside the reactor. Why do I want this, you ask? Well, the primary reason is that the HTTP client that I am writing should be able to run normally without an EventMachine reactor (for me to test out individually, write specs for, etc) but once it is used in an EventMachine reactor, it should get all the [benefits of using the Deferred pattern](http://igvita.com/2008/05/27/ruby-eventmachine-the-speed-demon).

Simple enough, right? Since EventMachine exposes the <code>EM.reactor_running?</code> method, all I need to do is to check if the reactor is running and make the appropriate call. Well, wrong! The built-in HTTPClient which comes as part of the EventMachine library (EM::Protocols::HttpClient) had a lot of problems with the initial set of tests that I was conducting. As far as I understand, it was because EventMachine's HTTP parser is not robust enough to handle streaming HTTP data.

## Enter Stage Left, Zed Shaw

Thus began my search for a proper HTTP parser which could be used as part of my networking library. I stumbled upon the [Rev project](http://rev.rubyforge.org/) (which is similar to EventMachine in many ways, and exposes the libevent library to Ruby). Rev has an HTTP client which uses Rev semantics, but whose parser is based on Zed Shaw's immortal Mongrel parser.

## Finito

Armed with Zed Shaw awesomeness, I was able to easily use the modular, fast HTTP parser from the Rev project as a Ruby-C extension and hook it up to EventMachine semantics, and thus was born EventedNet::HTTP !

The API to make a simple HTTP GET request, is like so:


<script src="http://gist.github.com/142171.js">  </script>

*Note:* The callback parameter can even be a Method object, please see [evented_get.rb](http://github.com/arunthampi/evented_net/tree/master/examples/evented_get.rb) for an example of how that works.

## Installation

EventedNet is available at [GitHub](http://github.com/arunthampi/evented_net/tree/master). In the coming weeks, I intend to add more functionality (including HTTP authentication) and more specs so as to make the library more complete. As always, patches and pull requests are always come!

You can also install the gem from GitHub:

<script src="http://gist.github.com/142174.js">  </script>
