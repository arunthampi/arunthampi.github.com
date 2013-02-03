---
layout: post
title: Sending SMS's using iPhone SDK 3.0 - A workaround
---

# [{{ page.title }}]({{ page.url }})

2 Nov 2009 - Singapore
{: .meta }

I've been trying to find a way to send SMS's as part of my upcoming iPhone app - [MovieFu](http://www.moviefuapp.com). Essentially why I need to access the SMS functionality is for a user to quickly share movie showtimes with friends who don't have access to the Internet.

## The iPhone URL Scheme

The [iPhone OS Reference Library](http://developer.apple.com/iphone/library/featuredarticles/iPhoneURLScheme_Reference/Articles/sms.html) recommends that we use the 'sms://' protocol to send SMS's. Essentially if we need to send an SMS to a number such as 87654321, we can launch the SMS app with the URL 'sms://87654321'. While this is fine and dandy for most cases, I would also like the body of the SMS pre-filled so that the user does not have to re-enter all that information.

## My workaround (which hopefully isn't a PITA)

Bear in mind that this solution will probably be rendered obsolete by the next update of iPhone OS which will include an awesome MFSMSComposeViewController (sic) of some sort, but for the time being my workaround flows like this:

The body of the SMS which I want to be sent is copied to the clipboard. The user is then presented with a UIActionSheet which provides this option: 'Copy and Paste in SMS'. When the user selects that option, the SMS app is opened with a blank recipient list, and the user can then tap once in the body to invoke the 'copy-paste-select-all' widget, thus allowing you to paste the details of the showtime you want to share.

This is illustrated below:

![Sending SMS Action Sheet](/images/blog/actionsheet.png)
{: .image }

**Above**: Action Sheet which brings up the various options, one of which is 'Copy and Paste in SMS'.

![SMS App Launches with this screen](/images/blog/paste.jpg)
![After Pasting this is what it looks like](/images/blog/pasted.jpg)
{: .image }

**Above**: Once the SMS screen is launched, the user can then tap the text area, by which time the details would have copied to the clipboard, bring up the 'paste' menu and voila, the details are ready to be sent to your friends.

The associated code-snippet is here:

<script src="http://gist.github.com/224068.js">  </script>

## Feedback

What do you guys think of this solution? While this is not ideal, I think this solves the problem of pre-generating content for an SMS to be sent. Would love to hear what you think about it.
