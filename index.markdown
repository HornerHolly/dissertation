---
layout: default
title: Home
---


<div class="home">

  <h1 class="page-heading">Digital Approaches to Sites and Sound in Romantic Poetry, A Dissertation</h1>
  
<h1>Latest Posts</h1>

<ul>
  {% for post in site.posts %}
    <li>
      <h2><a href="{{site.baseurl}}{{ post.url }}">{{ post.title }}</a></h2>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>

 <p class="rss-subscribe">subscribe <a href="{{ "/feed.xml" | relative_url }}">via RSS</a></p>


</div>