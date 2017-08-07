---
title: 8 things to learn in React before using Redux
link: https://www.robinwieruch.de/learn-react-before-using-redux
date: 2017-07-24T13:17+1000
tags: redux react js
---

Robin Wieruch has a great article here about the merits of learning React and
Redux separately which I definitely agree with. In his own words:

> Often people learn React and Redux altogether. But it has drawbacks:
>
> - people never run into the problems of scaling state management with local state (this.state) only
>   - thus people don’t understand the need of a state management library like Redux
>   - thus people complain that it adds too much boilerplate
> - people never learn to manage local state in React
>   - thus people will manage (and clutter) all of their state in a state container provided by Redux
>   - thus people never use the local state management

I think there's a trend of prescriptivism in the JavaScript community that
promotes certain architectural approaches as the canonical 'correct' way to do
things. That kind of mindset leads to a lot of developers using tools because
they 'have to', without first understanding the problems they solve.

If you learn React and Redux together, you'll wonder why you have to write so
much boilerplate to achieve simple tasks, and what Redux is actually offering
you. But by learning React first, you'll find yourself hitting the limitations
of React's state management: business logic is hard to test, it's too difficult
to create shared abstractions, state that's only relevant to a specific
component has to be passed through three layers of unrelated components, and so
on.

Robin's list of things to learn covers pretty much all the bases you'd want to
before beginning to learn Redux.
