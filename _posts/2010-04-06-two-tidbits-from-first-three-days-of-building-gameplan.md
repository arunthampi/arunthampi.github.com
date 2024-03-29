---
layout: post
title: Two tidbits from first three days of building Gameplan
section: writing
section_link: '/archives.html'
---

## {{ page.title }}

6 Apr 2010 - Singapore

So as you may or may not know, [Andy](http://andycroll.com) and I are building [Gameplan](http://gameplanapp.com) (which, to paraphrase [Jon Stewart](http://thedailyshow.com) will be the best *expletive* sports league management software on the planet). We've already started in great earnest, and we're looking forward to kicking on and making lots of progress. By the way, we are chronicling our progress at [Naked Startup](http://nakedstartup.com).

There're two interesting technical gotchas which we experienced in the last three days, that I'd like to share.

## How do you test that a model acts_as_authentic?

We could check if any of the standard AuthLogic methods, such as password or password= are present in the model, but that felt a little dirty. The other way is to see if AuthLogic modules are included in the model. Trouble is that, AuthLogic includes a bunch of modules to every ActiveRecord class as Rails boots up. However, we discovered that there are certain modules which are only included when you use the method 'acts_as_authentic' in your class. So the corresponding unit test will be:

<script src="http://gist.github.com/357565.js?file=acts_as_authentic_user.rb">  </script>

If there is a simpler way we've missed, we'd love to hear about it!

## Uniqueness validation tests fail in Shoulda

All we wanted to do was to test whether we've included the uniqueness_validation for the 'permalink' attribute in our model, but it gave us a cryptic 'Can't find Competition' error. Turns out that existing records in a database is a pre-requisite for Shoulda to run these tests successfully, as [Johan Andersson](http://blog.tuxicity.se/rails/shoulda/testing/2009/06/03/shoulda-requires-a-database-record.html) points out. The corresponding unit test will be:

<script src="http://gist.github.com/357574.js?file=competition_test.rb">  </script>

As a bonus tidbit, I'd just like to say that pair programming is pretty darn awesome. For the last few days, I haven't checked my email, Twitter, Facebook or browsed anything other than RDocs (and Googling for answers) any time between 9am and 6pm, and that makes us very productive. Long may it continue!

