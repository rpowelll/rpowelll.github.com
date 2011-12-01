---
layout: post
title: Learning BDD
subtitle: From the outside in
published: true
---

Recently, I've been learning a lot about a certain approach to software
development known as *behaviour-driven development*, often simply abbreviated
to BDD. The core idea of BDD is that you first figure out how you want your 
software to behave, then work from the outside in to make it behave that way. 
It's an approach that, while initially a little tedious, is invaluable for 
both understanding and documenting complex systems.

Now for me, most of the software I've developed lately has been built with the
[Ruby on Rails][ror] and this sort of highly structured application works
brilliantly with BDD. In this article, I'm going to talk about what BDD is and
how to get started using it to develop Rails apps; if you're not a Rails
developer, this post still goes into some of the theory behind BDD and the
concepts.

What is BDD?
------------

To understand behaviour-driven development, we first have to understand test-
driven development. TDD, as it is often known, was the precursor to BDD and the
two share many ideas. In TDD, we first write a very small test for code that we
wish to have; naturally, this test will fail. At this point, we write the
*absolute minimum* code that will make this test pass. Once we have done this,
we refactor the code, ensuring that the test continues to pass. These three
tests are often referred to as 'red, green, refactor' and form the core of both
TDD and BDD.

Initially, writing tests helps us better understand the problem we're trying to
solve. It separates the process of designing a piece of code from the process
of implementing said code. These tests also give us the confidence to refactor
our code, by having a solid test suite we can rely on to make sure our code
works properly, we can make changes with the assurance that any bugs we
unintentionally introduce will be picked up by running our tests.



Why Use BDD?
------------

Getting started with BDD
------------------------

### Cucumber and RSpec ###

### A Basic Blog ###

[ror]: http://rubyonrails.org/

