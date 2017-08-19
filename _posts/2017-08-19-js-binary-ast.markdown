---
title: Towards a JavaScript Binary AST
link: https://yoric.github.io/post/binary-ast-newsletter-1/
date: 2017-08-19T11:16:51+1000
tags:
- browsers
- javascript
- mozilla
---

Mozilla engineer David Tell has written [a post](https://yoric.github.io/post/binary-ast-newsletter-1/) providing some background on Mozilla and Facebook's efforts towards a binary AST representation of JavaScript:

> Over the years, JavaScript has grown from one of the slowest scripting languages available to a high-performance powerhouse, fast enough that it can run desktop, server, mobile and even embedded applications, whether through web browsers or other environments.
> 
> As the power of JavaScript has grown, so has the complexity of applications and their size. Whereas, twenty years ago, few websites used more than a few Kb of JavaScript, many websites and non-web applications now need to deliver and load several Mb of JavaScript before the user can start actually using the site/app.
> 
> [...]
> 
> We have reached a stage at which the simple duration of parsing the JavaScript source code of a large web application such as Facebook can easily last 500ms-800ms on a fast computer – that’s before the JavaScript code can be compiled to bytecode and/or interpreted. There is very little reason to believe that JavaScript applications will get smaller with time.
> 
> So, a joint team from Mozilla and Facebook decided to get started working on a novel mechanism that we believe can dramatically improve the speed at which an application can start executing its JavaScript: the Binary AST.

The proposal is compelling, as we've long since reached the point of diminishing returns on JS parsing performance, while JS bundles continue to grow larger and larger. Microsoft has experimented with shipping bytecode directly for privileged apps, but bytecode varies between browsers and provides a moving target. A parsed AST is about as low level as you can get before you have to start dealing with browser-specific differences.

If you want to track the progress of these experiments, the [Bugzilla ticket](https://bugzilla.mozilla.org/show_bug.cgi?id=1349917) tracks Mozilla's efforts, while David Tell has started publishing a [regular newsletter](https://yoric.github.io/post/binary-ast-engineering-newsletter-1/) on his blog reporting on major developments week to week.

It really is fascinating to see the lengths to which browser vendors are going to make JavaScript performant. While WebAssembly provides another route to performant applications in the browser, JavaScript remains as important as ever, so these efforts benefit the web and users hugely.