---
title: Some Site Updates
date: 2017-08-01T11:25+1000
tags: meta site-updates
---

I've really been enjoying the experience of building my own personal site, it's been a good opportunity to flex my web development skills outside of the usual React stack, to build something a little more 'vanilla'. Over the past few days I've spent some of my spare time overhauling my base [Jekyll](http://jekyllrb.com/) install into something a little more bespoke, something tailored to my personal wants and needs.

Here's a quick summary of what I've done over the past week or so:

# New Theme

Well, that's not entirely true. My current site theme is a heavily tweaked version of Jekyll's default [minima](https://github.com/jekyll/minima) theme. I've gone for a darker colour scheme that I find a lot easer on the eyes, with splashes of bold yellow to make it a little less boring. I've also switched to system fonts site wide. Whether you use San Francisco, Robots, Segoe UI, or any other common system font, you should see that applied site-wide.

One thing I made sure to do when picking a colour scheme was ensure that I didn't sacrifice accessibility by using low-contrast text, so I made sure that the colours I chose had a high [WCAG contrast ratio](https://www.w3.org/WAI/intro/wcag) using the great [Contrast](https://usecontrast.com/) app for macOS.

I also overhauled my syntax highlighting theme to something better suiting the new colour scheme. The site even shows AppleScript snippets in a proportional font now.

# Progressive Web App Nonsense

Google's push for [Progressive Web Apps](https://developers.google.com/web/progressive-web-apps/) seems largely motivated by a desire to make web sites work better in Chrome than in any other web browser, which I'm a little wary of. However, some of the things they're advocating for are a net positive. Ensuring the web is accessible, loads fast, and makes judicious use of caching to save bandwidth and work offline benefits everyone. 

So this site now serves itself over HTTPS, registers a service worker for content caching, provides home screen icons for both Android and iOS, and implements a smattering of other small tweaks aimed at improving the experience. Google's [Lighthouse](https://developers.google.com/web/tools/lighthouse/) tool reports this site as having perfect scores in everything except performance, which scores a still respectable 98. If you're curious to see what else is in that report, you can check it out [here](https://googlechrome.github.io/lighthouse/viewer/?gist=d0d7457322ea13316c0d57a80f2054f4).

# JSON Feed

Finally, I've implemented a JSON Feed. [JSON Feed](https://jsonfeed.org/) is a JSON based alternative to RSS and Atom feeds that aims to be easier to parse by virtue of Not Using XML. While support for the format in feed readers is still not widespread, I've got some ideas for future site features that would benefit from having a canonical JSON representation of recent posts, so a JSON Feed seemed like the way to go.

---
  
I've still got a lot of things I want to do with this site---moving it off GitHub pages and onto my own custom hosting among them---but I'm really happy with how it's been shaping up. I've really enjoyed having this site to tinker with in my spare time, and I've got a lot of ideas for new features and articles I want to add to it over the coming weeks and months.