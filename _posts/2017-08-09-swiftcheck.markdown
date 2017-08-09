---
title: "SwiftCheck: QuickCheck for Swift"
link: https://github.com/typelift/SwiftCheck
date: 2017-08-09T11:36:22 10:00
tags:
---

> SwiftCheck is a testing library that automatically generates random data for testing of program properties. A property is a particular facet of an algorithm or data structure that must be invariant under a given set of input data, basically an XCTAssert on steroids. Where before all we could do was define methods prefixed by test and assert, SwiftCheck allows program properties and tests to be treated like data.

SwiftCheck is a small library that lets you do [property-based testing](http://blog.jessitron.com/2013/04/property-based-testing-what-is-it.html?m=1) in Swift. It has its roots in Haskell’s QuickCheck library, and that shows in its very Haskell-inspired syntax. 

I can’t say I’m a fan of libraries that stray so far from idiomatic Swift[^1], but I’ve always been curious about the ideas behind property-based testing, so I’ll probably spend some time messing around with this. 

[^1]: Whatever that means. Swift is a new language so it’s not wise to get to dogmatic about what’s “idiomatic”. 