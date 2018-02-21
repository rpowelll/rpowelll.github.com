---
title: "Better Flow Error Messages for the JavaScript Ecosystem"
link: https://medium.com/flow-type/better-flow-error-messages-for-the-javascript-ecosystem-73b6da948ae2
date: 2018-02-21T11:02:22+1100
tags: code javascript flow
---

I've been using Flow for a little under a year now, and at this point I wouldn't start a JavaScript project without it. Alternatives like TypeScript exist, but Flow's type inference and refinement make it so much nicer to work with.
  
One glaring issue, however, has been the way Flow reports errors. A simple mismatched type can result in hundreds of lines of cryptic, tangled error output that only really becomes easier to decipher with lots of experience. In the past, when I've had to onboard new developers to a codebase that uses Flow, these error messages have been the biggest barrier to entry.

That's why I'm so excited to see all these improvements they're making in Flow 0.66, which largely overhauls the way errors are reported. From simple formatting changes, to 'scoring' the branches of a union type to determine which ones are most applicable, it looks to be a huge step forward.

There's still a few issues I have with Flow[^1], but this is an enormous improvement that's been sorely needed for a while now.

[^1]: It's so much harder than it should be to publish an npm package with included Flow definitions.