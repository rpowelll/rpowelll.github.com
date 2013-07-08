---
title: Graphing the iOS Class Hierarchy
layout: post
---

After playing around with D3.js a bit over the weekend, I got a cool idea for I graph I wanted to build. The inspiration came from [one of Mike Bostock's _many_ D3 examples](http://bl.ocks.org/mbostock/4063550), which shows [Flare's](http://flare.prefuse.org) code base as a tree based on class hierarchy. This made got me thinking, what would the class hierarchy of a much bigger code base, say the iOS SDK, look like?

The final product can be [viewed live](http://rpowell.me/labs/d3/ios-sdk/) on my site and the source code is in my [D3 experiments repo](https://github.com/rpowelll/d3-experiments) on GitHub. If you're interested in how I built it, read on.

---

The iOS SDK is written in Objective-C which, like all C-derived languages, splits its code between header and implementation files. While the actual implementations of the iOS SDK's classes are vendored as pre-compiled object code, the header files are provided as plain text to assist the compilation process. After a bit of digging, I found the iOS SDK's frameworks folder and copied all the headers in it into a temporary directory. 

With those files all in the same directory I was able to pull out the name and superclass of every class definition in the headers with a single (messy) command in the terminal.

```bash
 cat *.h\
  | egrep -o "^.*@interface (\w+)\s?:\s?(\w+).+\$"\
  | sed -E 's/^.*@interface +([A-Za-z]+) ?: ?([A-Za-z]+).*$/\1 \2/g' > classes.txt
```

That gave me a file that had a line for each class with the name and subclass's names separated by spaces, like so:

```
UITabBarItem UIBarItem
UITableView UIScrollView
UITableViewCell UIView
UITableViewController UIViewController
UITableViewHeaderFooterView UIView
UITapGestureRecognizer UIGestureRecognizer
```

Now the quickest way to get this data into a format renderable by D3 was to turn it into a JSON file. The specific format D3 works best with in these cases involves a root JSON object with any number of properties as well as an array of `children` objects. Each of these objects can also have an array of children, and so on.

To get to that JSON representation I wrote a simple (super messy awful) Ruby script:

```ruby
require 'json'

nodes = []

File.open "classes.txt" do |f|
  f.each do |line|
    node = {}
    components = line.split
    if components
      node[:name] = components[0]
      node[:parent] = components[1] if components.length == 2
      nodes << node
    end
  end
end

def nest_node node, nodes
  nodes.each do |n|
    if n[:name] == node[:parent]
      node.delete :parent
      n[:children] ||= []
      n[:children] << node
    elsif n[:children]
      nest_node node, n[:children]
    end
  end
end

node_names = nodes.reject { |node| node[:parent].nil? }.map { |node| node[:name] }
node_names.each do |name|
  node = nodes.detect { |node| node[:name] == name }
  nest_node node, nodes
  nodes.delete node
end

json = JSON.generate nodes.first, indent: '  ', object_nl: "\n", array_nl: "\n"

File.open "classes.json", "w+" do |f|
  f.write json
end
```

With the data in a usable format, it was time to turn it into a graph. I wont list my code here because it's pretty similar to Mike's Flare code graph. The one notable difference is that I wrapped the code in a function closure with getter and setter methods for the data source and dimensions. This means that the graph itself is entirely reusable.

---

I'm pretty happy with how this turned out, the final graph really gives you a great sense of the sheer size of the SDK. Furthermore the approach is generic enough that it can theoretically be applied to any Objective-C project with a few tweaks.

I might come back to this at some point and enhance it a bit. I'd like to colour nodes based on the framework they belong to communicate more information in the graph. I could also add some interactivity such as showing statistics about the class under the user's cursor and allowing the graph to rotate such that the current node's label is on the horizon. But overall I think it's a pretty cool little project for a Monday afternoon.
