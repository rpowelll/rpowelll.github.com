---
title: Dolphin Emulator - Ubershaders
link: https://dolphin-emu.org/blog/2017/07/30/ubershaders/
date: 2017-07-31T11:43:36+1000
---

Today the Dolphin emulator team posted a deep dive into their, multi-year effort to eliminate shader compilation stutter from the emulator. Their solution is incredibly novel, running large parts of the rendering pipeline on the GPU itself. This gets around issues that caused stuttering artefacts on even the beefiest computers and makes some previously troublesome games like _Metroid Prime 3_ playable at full speed for the first time.

Emulation has always been a legal and ethical grey area, but from the standpoint of games preservation, it's unambiguously a good thing. The Dolphin team's hard work means that some of my favourite games like _The Legend of Zelda: The Wind Waker_ and _Super Mario Galaxy_ will be playable for many years to come.

The unfortunate downside is that, due to macOS's continually terrible graphics drivers, these improvements are currently only available on Windows and Linux. Apple seems to have been making moves towards better GPU support at the most recent WWDC, so maybe one day soon we'll see this problem addressed, but for now gaming on macOS continues to suffer for it.
