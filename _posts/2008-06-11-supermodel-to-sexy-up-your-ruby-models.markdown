--- 
wordpress_id: "3"
layout: post
title: SuperModel - to sexy up your Ruby models
excerpt: <![CDATA[]]>
wordpress_url: http://mclovindoesruby.wordpress.com/?p=3
---
<![CDATA[A few months ago, my friend <a href="http://blog.codefront.net">Chu Yeow</a> and I <a href="http://www.wego.com/blog/2008/01/23/activecouch-a-ruby-wrapper-for-couchdb/">released</a> a Ruby gem called ActiveCouch which was designed to be a very elegant Ruby wrapper for the exciting new phenomenon - <a href="http://incubator.apache.org/couchdb/">CouchDB</a>. ActiveCouch was my first shot at a Ruby library and I had a lot of fun creating elegant DSL's (a lot of which were inspired from ActiveRecord and ActiveResource). In essence, <a href="http://www.github.com/arunthampi/activecouch">ActiveCouch</a> lets you define models like so:
<pre><code>class Pet &lt; ActiveCouch::Base

  has :name, :which_is =&gt; :text, :with_default_value =&gt; 'Tom'

end

class Person &lt; ActiveCouch::Base

  has :name, :which_is =&gt; :text, :with_default_value =&gt; 'McLovin'

  has :age, :which_is =&gt; :number, :with_default_value =&gt; 0

  has_many :dogs, :class =&gt; Pet

  has_many :cats, :class =&gt; Pet

  has_many :pets # Automagically assumes that 'pets' corresponds to the class Pet

end
</code></pre>
While this is great, I found myself using these semantics more often in other Ruby libraries that I started to work on. Thus was born - <a href="http://www.github.com/arunthampi/supermodel">SuperModel</a>.

SuperModel's aim is to wrap semantics such as has, has_one, has_many (which are familiar to many Ruby/Rails developers) in a re-usable library which can form the basis for other such libraries. For instance, I am currently in the process of re-writing ActiveCouch so that ActiveCouch::Base inherits from SuperModel::Base. By doing so, all the 'modeling' semantics will be taken care of by SuperModel and ActiveCouch can deal with interfacing with CouchDB.

SuperModel also gives you serialization for free (currently only JSON, but future releases will also include XML, YAML, etc.) So, methods such as to_json, to_xml and to_yaml will let you serialize/de-serialize SuperModel objects in/from any format that you want.
<pre><code>class Person &lt; SuperModel::Base</code>
<span style="font-family:0;">  # If you don't specify a 'type', it defaults to string</span>
<span style="font-family:0;">  # while converting to JSON</span>
<code>  has :name</code>
<code>end</code>
<span style="font-family:0;">
</span><span style="font-family:0;"># Create a SuperModel object</span>
<code>p = Person.new(:name =&gt; 'McLovin')</code>
<span style="font-family:0;">
</span>
<code># Another way you can create a SuperModel object
p1 = Person.new do |person|
  person.name = 'Seth'
end</code>
<code>
# JSON serialization
p.to_json # =&gt; {"name":"McLovin"}
</code></pre>
SuperModel is hosted at <a title="SuperModel on GitHub" href="http://www.github.com/arunthampi/supermodel" target="_blank">http://www.github.com/arunthampi/supermodel</a> and the gem is available from GitHub as well. [Note: There are some problems currently with installing gems from GitHub, please refer to the <a href="http://gems.github.com">GitHub RubyGems page</a> for pointers] ]]>
