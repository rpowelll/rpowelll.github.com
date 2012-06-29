---
layout: post
title: The Joy of Text
subtitle: Making the most of plain text
published: true
---

There's something to be said for the simple plain text file, over the past 40 years or so computing has changed immensely, yet the plain text file has stood still. This simple, enduring means of conveying information is one of the most flexible tools in computing.

## A Little Background ##

Let me tell you a story about a program called [Microsoft OneNote][onenote], a note taking tool from Microsoft that's been bundled with new copies of Office for the past few years. Now, I'm not going to beat on OneNote, in fact I think it's a pretty good program from a utility and usability format, but it has one major flaw which I'll get to in a minute. 

Now I really liked OneNote back when I used to use it, it was a great note taking tool and I used it for a lot of my subject notes in high school. It allowed me to easily organise notes, diagrams and other clippings into freeform 'notebooks' and served as a pretty good organisational tool, it was a really neat piece of software. To achieve all this cool functionality, it stored all the user's data in a proprietary `.one` format. A weird mix of XML and image files globbed together into a single binary file.

Now, this worked fine for a while, I was the only one editing these files and I didn't have to worry about using them on other platforms because I only used Windows. Everything worked fine for a long time, but then a big change happened.

### Changing Platforms ###

I'd been getting really into web development with [Ruby on Rails][rails], which really doesn't work that well on Windows. I'd been dual booting Windows 7 and [Ubuntu Linux][ubuntu] (eventually switching to [Arch Linux][arch]). I coded in Linux and did pretty much everything else in Windows, it worked *okay*, but it was hardly ideal. 

Also around this time I participated in a [local university's programming competition][progcomp], we made it into the finals and had to bring our own computer along. The only laptop our team had between us was my friend's MacBook Pro, so we used that. I like it, I mean I *really* liked it, so much so that I started saving for my own and later that year picked up the MacBook Pro that I'm writing this post on.

Which brings us back to OneNote. As it turns out, there's no version of OneNote for OS X, so I had no way of reading all those notes I'd spent untold hours compiling. Needless to say I was a little pissed off, I'd been burned for the first time by proprietary formats and I wasn't going to let it happen again.

## Plain Text ##

That brings us back to my original point about, pretty much every computer on earth can read plain text. It's also a really flexible format, you can express a lot in plain text. But you're probably shaking your head at this point thinking "you must be joking, plain text can't be formatted at all, it's utterly primitive!" Hopefully this post will change your mind about that. 

### Why Use Plain Text? ###

Plain text files have a lot of benefits over other formats, chiefly:

+ **They're portable**, with few exceptions every computer on earth is capable of reading plain text files.
+ **They're tiny**, the size of most text files can be measured in bytes, there's no bloated headers or storage formats here.
+ **You can probably already edit them**, every computer I've ever had has built in tools for working with text files, no software to install and pay for.
+ **They're durable**, 40 years from now, you'll still be able to open and edit your text files with ease, which is more than can be said for the latest incarnation of the `.doc` format.

So now you know *why* using plain text is a good idea, let's look at the how.

### Tools for Working With Plain Text ###

Now plain text is only as useful as the tools you use with it. On it's own plain text can be fairly primitive, but there's a lot you can do to really make the most of this format.

#### Markdown ####

[Markdown][md] is the plain text formatting syntax invented by John Gruber of [Daring Fireball][df]. What's that mean exactly? Well the basic idea is that you use a certain formatting style when writing your text files which allows you to apply formatting to otherwise unformatted text files. Here's an example of some of the stuff you can do with Markdown

    # This is a heading #

    You can format text with *italics* and make it **bold**.

    You can do bulleted list:
    
    + One
    + Two
    + Three

As you can see, even without converting this text to HTML, a Word document or some other format, it's already pretty readable as-is. That's one of the great things about Markdown, it takes conventions that people already used in plain text emails and bulletin board systems and makes them convention.

#### NValt ####

![NVAlt, a lightning fast, lightweight note taking tool](http://cdn2.brettterpstra.com/wp-content/uploads/2011/01/nvALT2.0Screenshot.jpg?9d7bd4)

[NValt][nvalt] is a super fast note taking tool for Mac OS X with built in support for Markdown. I have literally hundreds of notes managed by NValt, all of which are stored as plain text files on my computer. It allows me to show a Markdown preview for any of my notes and offers a metric ton of other features like fullscreen support, full text search and custom colour schemes and fonts.

#### Simplenote ####

[Simplenote][simplenote] is an iOS app and website that allows you to store plain text notes in the cloud. It has a some very cool features including the ability to reverse changes to notes. It also integrates effortlessly with NValt allowing me to access notes made on my Mac from my iOS devices and vice versa.



[onenote]: http://en.wikipedia.org/wiki/Microsoft_OneNote
[rails]: http://rubyonrails.org/
[ubuntu]: http://www.ubuntu.com/
[arch]: http://www.archlinux.org/
[progcomp]: http://www.computing.unsw.edu.au/progcomp/
[nv]: http://notational.net/
[md]: http://daringfireball.net/projects/markdown
[df]: http://daringfireball.net/
[jekyll]: https://github.com/mojombo/jekyll
[nvalt]: http://brettterpstra.com/project/nvalt/
[simplenote]: http://simplenoteapp.com/