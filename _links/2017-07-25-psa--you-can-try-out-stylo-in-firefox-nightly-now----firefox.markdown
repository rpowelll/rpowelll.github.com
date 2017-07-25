---
title: Stylo Now Shipping in Firefox Nightly
link: https://www.reddit.com/r/firefox/comments/6p9t83/psa_you_can_try_out_stylo_in_firefox_nightly_now/
date: 2017-07-25T19:17:38+1000
tags: browsers firefox web
---

> Stylo is the project to take Servo's style system and put it inside Firefox. It uses Rust and does styling in parallel, which makes it both more secure and fast.
> As of two weeks ago, we've been shipping it in Firefox Nightly (desktop), disabled by default.
> If you want to run more Rust code on your machine, or help this project along, download Nightly and flip the pref layout.css.servo.enabled in about:config. I've personally noticed that stuff is much smoother/faster on many sites, and never perceptibly slower on others.

Firefox has been getting better and better in recent times, and this is another big step for the project. For those not in the loop, [Servo][servo] is the Mozilla foundation's project to build a new browser engine from scratch in [Rust][rust]. Seeing parts of that project start towards shipping to end-users is hugely exciting.

I've been increasingly dissatisfied with Chrome as of late, and as much as I love Safari, its lack of developer tools extensions makes it a no go. Maybe it's time to give Firefox a try.

[servo]: https://servo.org/
[rust]: https://www.rust-lang.org/en-US/