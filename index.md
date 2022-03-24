---
title: McLovin's Home - Ramblings about Ruby, Rails, iPhone and other joys of life
layout: default
---

{% for post in site.posts limit: 5 %}
  {{ post.content }}
{% endfor %}
