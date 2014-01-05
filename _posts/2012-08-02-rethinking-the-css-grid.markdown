---
layout: post
title: Rethinking the CSS Grid
published: true
category: code
---

I'm a big fan of the [Sass][sass-lang] stylesheet languge. The addition of mixins, variables, inheritence, and flow control to CSS coupled with its simplified syntax make tasks that would have been difficult or impossible with regular CSS much simpler. I'm also a fan of CSS grids, from the complicated 16-column variety to the [simple two column responsive grid][grater] I use on this site. Recently I've been thinking about how these two technologies fit together, how Sass can make CSS grids work better, and in doing the responsive redesign of this site I think I've come up with a pretty good solution.

[sass-lang]: http://sass-lang.com/
[grater]: https://github.com/samsoffes/grater

Ideally when you're building a site you want clear separation of duties between your HTML and CSS; the HTML handles the content and the CSS styles it. But with most CSS grids this line is blurred, HTML is littered with classes like `span6` and `container`, classes that deal with styling rather than content. Of course, when you're writing straight CSS this is done to ensure reusability of grid styles across a project. But if you're like me, you rarely work with straight CSS nowadays so it's time to rethink this approach to grids.

My new approach takes advantage of Sass's mixins to add grid properties to HTML elements straight in the CSS. Here's what my site's `grid.sass` file looks like right now:

{% highlight sass %}
// Grid styles, heavily derived from Grater
// https://github.com/samsoffes/grater

body
  width: $large-container-width
  margin: auto

  @media #{$small-media-query}
    width: $small-container-width

=split
  > div, > header, > section, > footer, > nav
    width: $column-width
    margin: 0 0 2em

    &:first-child
      float: left

    &:last-child
      float: right

  // Clearfix
  zoom: 1

  &:before, &:after
    content: ""
    display: table

  &:after
    clear: both

  @media #{$small-media-query}
    margin-bottom: 1em

    > div, > header, > section, > footer, > nav
      float: none !important
      margin: 0 auto 2em


.split
  +split
{% endhighlight %}

As you can see, the grid styles are implemented as a Sass mixin, I also define a `.split` class for purposes such as displaying images side by side in a post but this is rarely used.

Now when I want to apply grid properties to a part of my site, I can simply use code like the following:

{% highlight sass %}
body > header
	+split
{% endhighlight %}

This allows me to keep ugly grid classes out of my HTML and still get all the benefit of reusable grid styles. I really liked how easy this was to implement on my site's redesign and I think I'll use this technique in all my personal projects going forward.