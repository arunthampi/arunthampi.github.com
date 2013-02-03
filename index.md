---
layout: default
title: McLovin's Home - Ramblings about Ruby, Rails, iPhone and other joys of life
---

{% for post in site.posts limit: 5 %}
+--
  {{ post.content }}
  +--
  [View Comments]({{ post.url }}#disqus_thread) 
  =-- {: .signoff }
=-- {: .post }
{% endfor %}
