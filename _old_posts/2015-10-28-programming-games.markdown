---
layout: post
title:  "Some Programming Games"
date:   2015-10-28
categories: games programming
---

![Human Resource Machine](/public/images/programming-games/Human-Resource-Machine.png)

I've spent the past few nights playing through [Human Resource Machine][hrm], the new game from the guys behind World of Goo, and I'm really kind of blown away by how much I like it. At it's core it's a puzzle game where you're given a job each level and have to program a little office worker to automate it for you.

 Stripping away the artifice of its presentation, what you're really doing is writing assembly code, in fact you can even output your solutions in assembly form. Here's my solution for one of the later levels:

{% gist 3316b0e83782d15da16a %}

On _Human Resource Machine's_ Steam page, there's the following disclaimer:

> Don't worry if you've never programmed before - **programming is just puzzle solving**. If you strip away all the 1's and 0's and scary squiggly brackets, programming is actually simple, logical, beautiful, and something that anyone can understand and have fun with!

Something about that idea of making basic programming and algorithm design accessible to people through games really resonates with me, and _Human Resource Machine_ is by no means the first game to attempt it. While it's by no means a crowded genre, there's been a few really good programming puzzle games in the past few years, let's run through some of them.

## Hack 'n' Slash

![Hack 'n' Slash](/public/images/programming-games/Hack-n-Slash.jpg)

[Steam Page](http://store.steampowered.com/app/246070/)

Hack 'n' Slash starts out as a fairly straightforward Zelda clone, but quickly gets interesting when the protagonist's sword breaks in half to reveal a USB connector. From here on out, you can use your sword to hack in to many of the enemies and other in-game objects in the game to change their internal variables and rewrite their behaviour.

The really insanely clever part of Hack 'n' Slash is that there's nothing artificial about the code you're modifying. When you hack into an enemy, what you see is a visual representation of the Lua code underpinning the actual game logic. In fact, with the amount of power the game gives you it's very easy to completely break it.

Thankfully Hack 'n' Slash includes a Git-inspired save system where you can rewind time and fork off into a new timeline. You can even jump between these forks to further modify different versions of the game world.

A lot of what makes Hack 'n' Slash interesting lies in that central conceit of directly modifying the game from within itself. Though unfortunately, once the novelty of that wears off, some of the game's puzzles can be overly finicky and I never actually got around to finishing this one.

## Spacechem

![Spacechem](/public/images/programming-games/Spacechem.png)

[Steam Page](http://store.steampowered.com/app/92800/)

In Spacechem, you're tasked with running a chemical plant. The way you do this is by placing down commands on a grid to manipulate 'waldos', which can pick up, break apart, and reconstruct molecules. It all sounds very complex, but the earlier puzzles are all fairly straightforward, and the game does a good job of teaching you the basics before it throws you in the deep end.

Though it's worth noting this game gets _extremely hard_ as it progresses, with puzzles that require you to connect multiple factories together and keep them efficient enough to avoid clogging up the overall system. I've never finished it, but that doesn't stop me from wholeheartedly recommending it as perhaps my favourite game in this genre.

## TIS-100

![TIS-100](/public/images/programming-games/TIS-100.jpg)

[Steam Page](http://store.steampowered.com/app/370360/)

TIS-100 has you programming a parallel computing system consisting of interconnected nodes, each of which can have different capabilities and pass data between each other. It's probably one of the more hardcore games in this category, and even includes a freeform sandbox mode where you can write whatever programs you want.

Furthermore the TIS-100's architecture is designed to be confusing and restrictive, which seems to fly in the face of what you'd consider Good and Fun Game Design. There's no in-game tutorial, just a PDF manual, and the problems quickly ramp up in difficulty.

Still I found myself putting many hours into this game, trying to hone my solutions to the point where I was happy with them. There's something legitimately appealing about learning the esoteric knowledge you need to solve the hardest of TIS-100's problems.

Or maybe I'm just crazy.

[hrm]: http://tomorrowcorporation.com/humanresourcemachine
