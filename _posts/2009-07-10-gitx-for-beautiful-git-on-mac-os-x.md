---
layout: post
title: GitX for beautiful Git on Mac OS X
section: writing
section_link: '/archives.html'
---

## {{ page.title }}

10 Jul 2009 - Singapore

Before I begin this post, let me warn you that I'm a very poor power-user of my tools. So if this post has a high-school-girl's-giddy-excitement ring to something which has been blindingly obvious to everybody, please excuse me.

I've been using [GitX](http://gitx.frim.nl/index.html) to look at commits to [Wego.com](http://www.wego.com) projects for a few months now and I always wished that it had a command-line option to launch it (similar to [Textmate's](http://macromates.com/) mate command). I like GitX's clean interface, search functionality and the fact that it's open source.

But today I realized that GitX *did* have a command-line tool that you can use to launch it from your Git repo. It can be enabled like so:

![GitX Terminal Usage](/images/blog/gitx_terminal_usage.jpg)
{: .image }

What this does is that it copies the executable <code>gitx</code> to <code>/usr/local/bin</code>.

Some of the other useful commands that I've started to use (more examples can be seen at the [user manual](http://gitx.frim.nl/user_manual.html)):

<script src="http://gist.github.com/144367.js">  </script>

If you think some of the options look familiar, you're right. GitX accepts command-line arguments which you normally provide to [<code>git log</code>](http://linux.die.net/man/1/git-log) and [<code>git diff</code>](http://linux.die.net/man/1/git-diff).

Happy GitXing!
