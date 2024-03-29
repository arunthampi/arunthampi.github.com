--- 
layout: post
title: SuperModel - to sexy up your Ruby models
section: writing
section_link: '/archives.html'
---

## {{ page.title }}

11 Jun 2008 - Singapore

A few months ago, my friend [Chu Yeow](http://blog.codefront.net) and I [released](http://www.wego.com/blog/2008/01/23/activecouch-a-ruby-wrapper-for-couchdb/) a Ruby gem called ActiveCouch which was designed to be a very elegant Ruby wrapper for the exciting new phenomenon - [CouchDB](http://incubator.apache.org/couchdb/). ActiveCouch was my first shot at a Ruby library and I had a lot of fun creating elegant DSL's (a lot of which were inspired from ActiveRecord and ActiveResource). In essence, [ActiveCouch](http://www.github.com/arunthampi/activecouch) lets you define models like so:

<script src="http://gist.github.com/142161.js">  </script>

While this is great, I found myself using these semantics more often in other Ruby libraries that I started to work on. Thus was born - [SuperModel](http://www.github.com/arunthampi/supermodel).

SuperModel's aim is to wrap semantics such as <code>has</code>, <code>has_one</code>, <code>has_many</code> (which are familiar to many Ruby/Rails developers) in a re-usable library which can form the basis for other such libraries. For instance, I am currently in the process of re-writing ActiveCouch so that <code>ActiveCouch::Base</code> inherits from <code>SuperModel::Base</code>. By doing so, all the 'modeling' semantics will be taken care of by SuperModel and ActiveCouch can deal with interfacing with CouchDB.

SuperModel also gives you serialization for free (currently only JSON, but future releases will also include XML, YAML, etc.) So, methods such as <code>to_json</code>, <code>to_xml</code> and <code>to_yaml</code> will let you serialize/de-serialize SuperModel objects in/from any format that you want.

<script src="http://gist.github.com/142165.js">  </script>

SuperModel is hosted at [http://www.github.com/arunthampi/supermodel](http://www.github.com/arunthampi/supermodel) and the gem is available from GitHub as well. \[Note: There are some problems currently with installing gems from GitHub, please refer to the [GitHub RubyGems page](http://gems.github.com) for pointers]
