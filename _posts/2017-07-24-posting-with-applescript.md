---
title: "Regrettable Adventrues in AppleScript: Publishing from iA Writer"
date: 2017-07-24T21:47+1000
tags: automation applescript mac
---

Now that I'm actually posting to this blog for the first time in
who-knows-how-long, I decided to put some time into removing the friction from
this process. Since I last posted here, my writing process has evolved into
something like this:

1.  When I have an idea I want to write about, I'll jot down a few quick notes
    in Notes.app on my iPhone
2.  When I'm ready to flesh that out, I'll write up an outline in OmniOutliner
    Pro or OmniOutliner for iOS.
3.  When I'm ready to write the actual post, I open iA Writer in split screen
    with OmniOutliner and turn that outline into beautiful, deeply amateurish
    words.
4.  I take the Markdown file from iA Writer and add it to my blog's git repo.

So this morning as I was working on a new post in iA Writer, and continually
copying it into my blog's repo to preview how it would look on the site, I
thought "why don't I automate this?" I've barely dabbled in Mac automation, but
it seemed like AppleScript was the tool for the job. Anyway, an hour or so
later, after tearing my hair out over AppleScript's not-quite-english syntax, I
ended up with this:

```applescript
on date_to_iso(dt)
	set {year:y, month:m, day:d} to dt
	set y to text 2 through -1 of ((y + 10000) as text)
	set m to text 2 through -1 of ((m + 100) as text)
	set d to text 2 through -1 of ((d + 100) as text)
	return y & "-" & m & "-" & d
end date_to_iso

set destination to "Macintosh HD:Users:rpowell:Projects:rpowelll.github.io:_posts"
set dt to current date
set iso_dt to date_to_iso(dt)

tell application "iA Writer"
	set source to file of document 1
end tell

tell application "Finder"
	set copiedPost to duplicate file source to folder destination with replacing
	set slug to name of copiedPost
	set ext to name extension of copiedPost
	if ext is not "" then set slug to text 1 thru -((count ext) + 2) of slug
	set postWithDate to (iso_dt & "-" & slug & ".markdown")
	if exists postWithDate then
		delete postWithDate
	end if
	set name of copiedPost to postWithDate
end tell
```

Oh god. Let's break this down.

The first thing in this file is a utility function for spitting out ISO8601
formatted dates, which I'll prepend to the filename when I add it to my blog's
repo.

```applescript
on date_to_iso(dt)
	set {year:y, month:m, day:d} to dt
	set y to text 2 through -1 of ((y + 10000) as text)
	set m to text 2 through -1 of ((m + 100) as text)
	set d to text 2 through -1 of ((d + 100) as text)
	return y & "-" & m & "-" & d
end date_to_iso
```

Then we set up a few variables. For some bizarre reason, file system paths in
AppleScript use colons to separate path segments, whatever. We also grab the
current date as `dt` and use taht function from before to turn that into a
string.

```applescript
set destination to "Macintosh HD:Users:rpowell:Projects:rpowelll.github.io:_posts"
set dt to current date
set iso_dt to date_to_iso(dt)
```

Still with me? Alright now we have to set the source file to the file that's
currently open in iA Writer, that's pretty easy.

```applescript
tell application "iA Writer"
	set source to file of document 1
end tell
```

Finally we get to the ugliest, most baffling part of this code. The last part
of this script copies our source file to the destination directory, does some
atrocious string manipulation to grab the copied file's name minus the
extension[^1], and finally renames the file by prepending the date, and
appending the .markdown file type extension. String manipulation is note
AppleScript's strong suit it turns out, so this code is an unreadable nightmare.

```applescript
tell application "Finder"
	set copiedPost to duplicate file source to folder destination with replacing
	set slug to name of copiedPost
	set ext to name extension of copiedPost
	if ext is not "" then set slug to text 1 thru -((count ext) + 2) of slug
	set postWithDate to (iso_dt & "-" & slug & ".markdown")
	if exists postWithDate then
		delete postWithDate
	end if
	set name of copiedPost to postWithDate
end tell
```

Anyway, while AppleScript's syntax can be frequently frustrating, the promise
of ubiquitous, system level scripting and automation is tempting enough for me
to endure it. Hopefully I haven't forgotten all of this next time I need to
open up _Script Editor.app_.

[^1]: I usually just use the .txt extension for Markdown files, because they're
    just plain text after all, and iA Writer is set up to use this as the
    default. However Jekyll needs these files to have a `.md` or `.markdown`
    extension, hence all this noise.
