---
title: Hacking on Atom
layout: post
date: 2014-03-02
---

A few days ago GitHub announced a beta for [Atom][], a new text editor built on web technologies. I've been using it for these past few days and come away very impressed. The barrier to entry for hacking on Atom is extremely low and I can see it generating a vibrant ecosystem. So here's my experience developing a package for Atom.

[Atom]: https://atom.io

One of the things I've always wanted from my text editor is integration with [GitHub Gists][]. I use that service all the time to share code snippets and small projects with people, so having it built into my editor would be a useful time saver. I sat down to write a package for this after dinner on Thursday and later that the evening had it looking like this:

[Github Gists]: https://gist.github.com

![](/public/images/hacking-on-atom/screencast.gif)

The package itself is called [Gist It](http://atom.io/packages/gist-it) and if you're using Atom you can install it with `apm install gist-it`. Read on for more about how I built it.

## Creating Packages

Atom makes the barrier for creating packages so low you could trip on it. To create a new package all you have to do is open the command palette and run the _Generate Package_ command. Atom prompts you for a name, scaffolds the package for you, and opens a new window in the package's directory.

What you'll find in that directory is a bunch of `.coffee`, `.less`, and `.cson` files. I had to look that last one up because I'd never heard of it, turns out it stands for _CoffeeScript Object Notation_, a JSON like syntax that's way cleaner and easier to write. Neato.

Anyway there's going to be one of these `.cson` files in each of the `/menus` and `/keymaps` directories. Those'll let you configure the commands your package adds to the _Packages_ menu as well as any keyboard shortcuts. The bulk of your package's code however goes in the `/lib` directory

The scaffolder had created two files for me in there: `gist.coffee` and `gist-view.coffee`. The former acts as my package's main entry point while the latter provided a view subclass that I could display in the editor's UI. This brings us on to one of the coolest parts of Atom's APIs.

## Views

Unlike other editors, you don't have to do a ton of work just to render a view for user input. Atom's entire interface is HTML, so if you know how to make a web page you'll know how to write an Atom view. This is _an enourmously huge deal_, it means that most of Atom's userbase will be able to leverage existing knowledge instead of starting from scratch. More importantly it massively lowers the barrier for hacking on your editor.

Now you could just write your view with plain HTML, but Atom offers something cooler: a CoffeeScript DSL for generating HTML they're calling [SpacePen][]. It took me a few minutes to get comfortable with SpacePen before I could build my package's main view: a simple form that allowed the user to enter a description for their Gist and choose whether to make it private. What I ended up with looked something like this:

[SpacePen]: http://atom.github.io/space-pen/

```coffee
class GistView extends View
  @content: ->
    @div class: "gist overlay from-top padded", =>
      @div class: "inset-panel", =>
        @div class: "panel-heading", =>
          @span outlet: "title"
          @div class: "btn-toolbar pull-right", outlet: 'toolbar', =>
            @div class: "btn-group", =>
              @button outlet: "privateButton", class: "btn", "Private"
              @button outlet: "publicButton", class: "btn", "Public"
        @div class: "panel-body padded", =>
          @subview 'descriptionEditor', new EditorView(mini:true, placeholderText: 'Description')
          @div class: 'pull-right', =>
            @button outlet: 'gistButton', class: 'btn btn-primary', "Gist It"
```

## Making It All Work

Now came the tricky part: making it do something other than look pretty. Thankfully I'd worked with the Gist API before so I knew what I was doing there, but I didn't have a clue how to actually call it from my script. However I did know Atom was based on Node.js so I figured that'd probably provide me with the tools I needed to call a remote API.

After a bit of googling around, I found the docs for node's `http` module and managed to figure out how to `POST` to the Gists API from my app. Hooking that to occur when the user clicked my `gistButton` was pretty straightforward with SpacePen and I soon had everything working.

Keep in mind this was probably a bit over an hour into creating my package. The great documentation surrounding both Atom and Node.js is just so much better than what I'm used to writing text editors.

## Publishing

Whereas with most text editors, you'd distribute your package by pushing it to somewhere like GitHub, Atom provides an `npm` inspired package manager aptly titled `apm`. With my package already pushed to a GitHub remote, all I had to do was update my `package.json` file and run `apm publish minor`.

With that one command, `apm` bumps your package's version number, commits it to git, tags that commit with the version number and pushes it upstream. With all that done, it publishes it to the `apm` package repository for other users to easily install.

Published packages even get [a page on the Atom website][apm-page] with their README, a link to the repo, and of course the package's name.

[apm-page]: https://atom.io/packages/gist-it

---

To say I'm impressed with Atom would be a gross understatement. The ease with which significant new functionality can be added to the editor puts it leagues ahead of the competition. I've started using Atom as my default text editor for non-iOS projects andI can't wait to see how it grows and devlops in the future.
