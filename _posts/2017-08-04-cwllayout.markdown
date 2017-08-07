---
title: "CwlLayout: a Swift wrapper around Auto Layout"
link: https://www.cocoawithlove.com/blog/cwllayout.html
date: 2017-08-04T06:43:58 10:00
tags: swift iOS code 
---

Matt Gallagher with a Swift wrapper around Cocoa’s Autolayout system. There’s a bunch of these around, but most just bolt a slightly ‘Swiftier’ API on top of the existing constraint APIs. Gallagher’s approach is more novel in that it asks you write code describing the desired layout, rather than the specific list of constraints you want to apply. 

The code is initially confusing, but maybe that’s because I haven’t written Swift in a minute. I’d be curious to try this approach with some more complex layouts than the example provided and see how it holds up. 