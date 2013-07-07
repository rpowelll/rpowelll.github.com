---
layout: post
title: Graphing GitHub Networks
published: true
---

I decided to finally buckle down and get to know [D3.js][d3js] this weekend. It's part of a larger goal I've been pursuing of getting really ridiculously good at JavaScript and putting out actual, finished projects for a change. 

I find I don't learn well unless I'm actually building towards something concrete, so I needed a project to motivate me. What I ended up building was a simple interactive network visualisation of GitHub repos and their contributors. Clicking a node would expand it to show either contributors to a repo or a user's repos depending on the type of node. The code to do this, with networking and everything, comes in at around 200 lines which you can see [on GitHub][repo]. The graph itself, assuming you're reading this on my site, is embedded below:

<div id="gh-graph"></div>

The viewport here is small and gets crowded quickly, so you might want to look at [a bigger version][bigger].

---

I had to learn a lot to get to this point, but the underlying ideas are all fairly simple. If you want to start learning D3 I suggest you start with [the tutorial on the project homepage][d3js]. From there, Michael Bostock—the project's maintainer—has some great articles on how [joins][joins], [transitions][transitions], and [selections][selections] work that helped me grok what was going on with a lot of the examples.

But most of all, think of something you want to build and keep expanding your knowledge until you know how to build it. 

<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="/labs/d3/github-graph/main.js"></script>
<link href="/labs/d3/github-graph/main.css" rel="stylesheet" type="text/css">

<script type="text/javascript">

var graph = GitHubGraph()
    .width(640)
    .height(400)
    .repo("AFNetworking/AFNetworking");

d3.select('#gh-graph').call(graph);

</script>

[d3js]: http://d3js.org
[repo]: https://github.com/rpowelll/d3-experiments
[bigger]: http://rpowell.me/labs/d3/github-graph
[joins]: http://bost.ocks.org/mike/join/
[transitions]: http://bost.ocks.org/mike/transition/
[selections]: http://bost.ocks.org/mike/selection/
