---
title: "Regrettable Adventures in AppleScript: A Better Blogging Workflow"
date: 2017-07-27T13:09+1000
tags: automation applescript mac
---

Since posting about AppleScript, I've learnt a bunch more and come up with some better scripts to support my blogging workflow. So far that arsenal consists of three scripts:

- _New Link Post in iA Writer_, which pulls information from the current Google Chrome tab and starts a new link post with it
- _Publish Link_ and _Publish Post_ which take the current Markdown document in iA Writer, copies it into my blog's repo, names it appropriately, and pushes it to GitHub Pages
  
# New Link Post in iA Writer

```applescript
property theURL : ""
property theTitle : ""

-- Get the current date and time as ISO8601
set theDateTime to (do shell script "date +%Y-%m-%dT%H:%M:%S%z")

-- Get title and url of current tab
tell application "Google Chrome"
	tell active tab of window 1
		set theURL to URL
		set theTitle to title
	end tell
end tell

-- Construct filename
set theDestination to "Macintosh HD:Users:rpowell:Library:Mobile Documents:27N4MQEA55~pro~writer:Documents:Blog:Links:"
set theSlug to do shell script "echo " & quoted form of theTitle & " | 
	iconv -t ascii//TRANSLIT | 
	sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/' | 
	sed 's/[^a-z0-9]/-/g'"
set theFilename to theSlug & ".txt"

-- Construct the head metadata section of the post
set theContent to "---" & return & "title: " & theTitle & return & "link: " & theURL & return & "date: " & theDateTime & return & "---" & return & return

--- Create a new iA Writer document with our content
activate application "iA Writer"
tell application "iA Writer"
	make new document
	delay 0.2
	tell application "System Events" to keystroke theContent
	save document 1 in theDestination & theFilename
end tell
```

Let's break down this kind of long script and look at each major section of it in turn.

```applescript
property theURL : ""
property theTitle : ""

-- Get the current date and time as ISO8601
set theDateTime to (do shell script "date +%Y-%m-%dT%H:%M:%S%z")
```

Firstly, I've ditched my overwrought date / time functions and deferred to a shell script to get the date. It turns 'defer to a shell script' is a nice way to get around a lot of the limitations of AppleScript.

```applescript
-- Get title and url of current tab
tell application "Google Chrome"
	tell active tab of window 1
		set theURL to URL
		set theTitle to title
	end tell
end tell
```

I was pleasantly surprised that Google Chrome has a fairly robust AppleScript dictionary. This part of the codebase pulls the URL and page title from the current tab and stores them in the `property` fields we defined earlier.

```applescript
-- Construct filename
set theDestination to "Macintosh HD:Users:rpowell:Library:Mobile Documents:27N4MQEA55~pro~writer:Documents:Blog:Links:"
set theSlug to do shell script "echo " & quoted form of theTitle & " | 
	iconv -t ascii//TRANSLIT | 
	sed 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/' | 
	sed 's/[^a-z0-9]/-/g'"
set theFilename to theSlug & ".txt"
```

This part of the code sets our destination path, and does some command line nonsense to construct the filename of our new document---which by Jekyll's conventions, has to be a valid URL slug. This shell pipeline does the following sequence of operations on the page title

- Transliterates from whatever character encoding the page title uses to ASCII
- Downcases the page title
- Replaces all the non-alphanumeric characters with dashes

We then get the final filename by appending the _.txt_ extension to that slug.

```applescript
-- Construct the head metadata section of the post
set theContent to "---" & return & "title: " & theTitle & return & "link: " & theURL & return & "date: " & theDateTime & return & "---" & return & return
```

Here we use the variables we created earlier to construct the file header for this post. It's pretty straightforward string concatenation.

```applescript
--- Create a new iA Writer document with our content
activate application "iA Writer"
tell application "iA Writer"
	make new document
	delay 0.2
	tell application "System Events" to keystroke theContent
	save document 1 in theDestination & theFilename
end tell
```

Finally we create the new document in iA Writer. Unfortunately Writer isn't very friendly to use with AppleScript, so we have to set the new document's content by simulating user keystrokes.

# Publish Post

```applescript
property theFile : ""
property theName : ""
property theExtension : ""
property theDestination : "Macintosh HD:Users:rpowell:Projects:rpowelll.github.io:_posts:"

-- Get the current ISO8601 date
set theDate to (do shell script "date +%Y-%m-%d")

-- Get info about the file currently open in iA Writer
tell application "iA Writer"
	set theFile to file of document of window 1
	set theName to name of (info for theFile)
	set theExtension to name extension of (info for theFile)
end tell

-- If there's a file extension, strip it from the file's name
if theExtension is not "" then set theName to text 1 thru -((count theExtension) + 2) of theName

-- Construct the filename in the format of `yyyy-mm-dd-slug.markdown`
set theFilename to theDate & "-" & theName & ".markdown"

-- Copy the file to the _posts directory and rename it
tell application "Finder"
	set theDuplicate to duplicate theFile to theDestination with replacing
	
	-- Check if a file with our intended filename already exists, and delete it if so
	if exists theDestination & theFilename then
		delete theDestination & theFilename
	end if
	
	set name of theDuplicate to theFilename
end tell

-- Commit to git
tell application "Finder"
	try
		do shell script ("cd \"" & (POSIX path of theDestination) & "\"; git add " & quoted form of theFilename) & "; git commit -m \"[New Post] " & theName & "\"; git push origin master"
	on error theError
		display dialog theError buttons {"OK"} with icon caution with title "Error"
	end try
end tell
```

Some of this is similar to the previous script, so I'll only highlight the interesting bits. Also worth noting, the _Publish Link_ script is identical to this, except the destination directory is *_links*.

```applescript
-- Get info about the file currently open in iA Writer
tell application "iA Writer"
	set theFile to file of document of window 1
	set theName to name of (info for theFile)
	set theExtension to name extension of (info for theFile)
end tell
```
  
Once again we're working around iA Writer's lacklustre AppleScript dictionary. In this case we defer to the [`info for`](https://developer.apple.com/library/content/documentation/AppleScript/Conceptual/AppleScriptLangGuide/reference/ASLR_cmds.html#//apple_ref/doc/uid/TP40000983-CH216-SW14) command to get the name and extension of the file open in iA Writer, as we can't get those directly.

```applescript
-- If there's a file extension, strip it from the file's name
if theExtension is not "" then set theName to text 1 thru -((count theExtension) + 2) of theName
```

We can't directly get the filename without the extension, so we do this nonsense to construct that.

```applescript
-- Copy the file to the _posts directory and rename it
tell application "Finder"
	set theDuplicate to duplicate theFile to theDestination with replacing
	
	-- Check if a file with our intended filename already exists, and delete it if so
	if exists theDestination & theFilename then
		delete theDestination & theFilename
	end if
	
	set name of theDuplicate to theFilename
end tell
```

Weirdly enough, you can't set the name of a file when you duplicate it, so we have to do it as a two-step process with a check in-between to ensure we don't get a conflict when we rename the duplicate. This works out pretty nice because---as long as I'm editing it on the same day---this allows me to publish corrections to existing posts.

```applescript
-- Commit to git
tell application "Finder"
	try
		do shell script ("cd \"" & (POSIX path of theDestination) & "\"; git add " & quoted form of theFilename) & "; git commit -m \"[New Post] " & theName & "\"; git push origin master"
	on error theError
		display dialog theError buttons {"OK"} with icon caution with title "Error"
	end try
end tell
```

This final part just defers to the `do shell` command to commit our new post to git and push the repo to GitHub. I threw in some basic error handling here to show any errors that git generates.