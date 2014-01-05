---
title: This is UNIX! I know this!
layout: post
---

It's probably fair to say that most professions are misrepresented in modern film. But being a programmer, not to mention being incredibly narcissistic, I've always been fascinated by the way computers and programming are framed in film. These portrayals vary from the fairly grounded to the fanciful, from the accurate to the 'have these people ever seen a fucking computer before'-inducing.

A few users on Tumblr have done a pretty great job of collecting all these representations, from [on screen portrayal of code](http://moviecode.tumblr.com), to [several different blogs](http://accessmaincomputerfile.net) focusing on [fake computer UIs](http://fakeui.tumblr.com). Honestly I could spend hours picking out examples from these sites, but I'll show some uncharacteristic restraint and focus on a few of my favourites.

![Screen capture of _The Social Network_](/public/images/computers-in-film/the-social-network.png)

_Image from [Screen shots of computer code](http://moviecode.tumblr.com/post/72188619673/theres-quite-a-bit-of-code-in-the-social-network)_

_The Social Network_ has, in my opinion, one of the best portrayals of hacking in film. Full stop. The scene itself can be found pretty easily [on YouTube](http://www.youtube.com/watch?v=odOzMz-fOOw).

In the scene, <s>Michael Cera's</s> Jesse Eisenberg's character is trying to grab portraits of every student on campus. What's surprising is that he actually goes about it by writing a [web scraper](http://en.wikipedia.org/wiki/Web_scraping) in [Perl](http://www.perl.org) and exploiting common security flaws. Even the tools he uses for the task is totally appropriate: a copy of [GNU Emacs](http://www.gnu.org/software/emacs/) running in a somewhat dated looking [KDE](http://www.kde.org) desktop environment.

There's obviously some bullshitting happening, but that can be safely categorised under _artistic license_. It's a real testament to David Fincher that he'd put such detail into a relatively minor scene.

![Various screen captures from _Tron Legacy_](/public/images/computers-in-film/tron-legacy.jpg)

_Image from [jtnimoy](http://jtnimoy.net/workviewer.php?q=178)_

Another great example of computers being portrayed accurately is, surprisingly, _Tron Legacy_. Despite not being a particularly great film, _Legacy_ has some fantastic visual effects. While for the most part its portrayal of computing is fanciful, lots of talk about sentient programs, there's one scene in particular which is worth mentioning.

At a point fairly early in the film, Big Bad Corporation™ has had its board room display hacked by our protagonist. In a desperate bid to save face, Mr. Villain logs into the system himself to kill this process. When he does this he's actually using real tools any [UNIX](http://en.wikipedia.org/wiki/Unix) programmer would be familiar with. He uses [ps](http://en.wikipedia.org/wiki/Ps_(Unix)) to grab a list of processes, pipes them through [grep](http://en.wikipedia.org/wiki/Grep) to find the one he's looking for, and then uses [kill](http://en.wikipedia.org/wiki/Kill_(Unix)) to stop it.

In fact this screen was captured from the screen of one of the many digital artists who worked on the film. He's got a great writeup of this scene, as well as his other contributions [on his site](http://jtnimoy.net/workviewer.php?q=178), which is well worth a read. As with _The Social Network_ there's some window dressing here, but it's once again pretty accurate, certainly more so than most films.

![The Iron Man MK VII HUD from _Marvel's The Avengers_](/public/images/computers-in-film/the-avengers.jpg)

_Image from [Jayse Hansen](http://jayse.tv/v2/?portfolio=hud)_

Shifting gears a bit, I want to highlight an example of great fictional UI design from _Marvel's The Avengers_. For the HUD elements in Iron Man's Mark VII suit, designer Jayse Hansen did a staggering amount of research into actual fighter jet cockpits, attempting to make something that looked cool without being totally unrealistic. He's got a pretty good writeup on [his personal site](http://jayse.tv/v2/?portfolio=hud).

Jayse's UI even switches between a variety of different modes depending on whether Iron Man is flying, in battle, and so on. There's really a staggering amount of detail in this for something that gets shown primarily in the periphery of Robert Downey Jr.'s face, and the part of me that was really into [Star Wars's visual dictionaries](http://www.amazon.com/Visual-Dictionary-Star-Wars-Episode/dp/0789447010) as a kid really appreciates it.

--- 

You could argue that, in the grand scheme of things, most of this stuff doesn't really matter. That it's only going to be seen by a very small portion of your audience. But for that small part of the audience, myself included, the decision to put real effort and detail into the portrayal of computers and avoid cheap, condescending cliches shows a deep respect for the viewer's intelligence. I think that's pretty great.
