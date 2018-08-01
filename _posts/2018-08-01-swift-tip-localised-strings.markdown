---
title: "Swift Tip: Localised String Constants"
date: 2018-08-01T14:36+1000
tags: swift
---

If you're a detail-oriented iOS developer, one of the things you've probably had drilled into you is that you should alwys localise user facing strings. Thankfully in Cocoa we have a variety of tools at our disposal to do this, from simple `.strings` files, to the `.stringsdict` file format: which lets us handle more specialised strings with pluralisation rules.

That said, it can make your code look messy to have dozens of calls to `NSLocalizedString()` all over the place, and this only gets more out of control when using `NSString.localizedStringWithFormat(_:, comment:)` to handle format strings.

Thankfully, there's a Swifty solution we can employ to make our code read just a bit more clearly: _type extensions_. By extending the `String` type, we can turn these long, messy lines of code:

```swift
self.navigationItem.title = NSLocalizedString("Notes", "Navigation title for the notes screen")
self.notesCountLabel.text = NSString.localizedStringWithFormat(NSLocalizedString("%lu Notes", comment: "The number of notes"), self.viewModel.notesCount)
```

Into something that looks like this:

```swift
self.navigationItem.title = .notesNavigationTitle
self.notesCountLabel.text = .notesCount(self.viewModel.notesCount)
```

The magic that makes these lines of code work is a simple extenison to the `String` type, which we can stick at the bottom of a view controller's file, or put in its own swift file called something like _String+Localized.swift_ to make it available throughout our codebase.

```swift
extension String {
    // A regular localised string in a `.strings` file
    static let notesNavigationTitle = NSLocalizedString("Notes", "Navigation title for the notes screen")

    // A localised format string with pluralization rules declared in a `.stringsdict` file
    func notesCount(_ count: Int) -> String {
      NSString.localizedStringWithFormat(NSLocalizedString("%lu Notes", comment: "The number of notes"), count)
    }
}
```

You can take this approach even further with a tool like [SwiftGen][swiftgen], which can take your _Localizable.strings_ file and generate type-safe Swift code from it, but on a smaller project, the approach above can really make your code easier to read.

[swiftgen]: https://github.com/SwiftGen/SwiftGen
