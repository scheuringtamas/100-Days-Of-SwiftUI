# Milestone: Projects 13-15 - EventContacts

## Challenge - Day 77

From [Hacking with Swift](https://www.hackingwithswift.com/guide/ios-swiftui/6/3/challenge):

Your goal is to build an app that asks users to import a picture from their photo library, then attach a name to whatever they imported. The full collection of pictures they name should be shown in a List, and tapping an item in the list should show a detail screen with a larger version of the picture.

Breaking it down, you should:

>- Use PhotosPicker to let users import a photo from their photo library.
>- Detect when a new photo is imported, and immediately ask the user to name the photo.
>- Save that name and photo somewhere safe.
>- Show all names and photos in a list, sorted by name.
>- Create a detail screen that shows a picture full size.
>- Decide on a way to save all this data.

Remember to import the user's photo as Data, so you can write it out easily.

You can use SwiftData for this project if you want to, but it isn’t required – a simple JSON file written out to the documents directory is fine, although you will need to add a custom conformance to Comparable to get array sorting to work.

If you do choose to use SwiftData, here's an important tip: when storing large data like images or movies in your models, define them using a special @Attribute macro like this:

@Attribute(.externalStorage) var photo: Data

## Time for MapKit - Day 78: 

From [Hacking with Swift](https://www.hackingwithswift.com/100/swiftui/78):

Yesterday you built a new app that imports photos from the user’s library, and hopefully you’re pleased with the finished product – or at least making great progress towards the finished product.

But your boss has come in and demanded a new feature: when you’re viewing a picture that was imported, you should show a map with a pin that marks where they were when that picture was added. It might be on the same screen side by side with the photo, it might be shown or hidden using a segmented control, or perhaps it’s on a different screen – it’s down to you. Regardless, you know how to drop pins, and you also know how to use the center coordinate of map views, so the only thing left to figure out is how to get the user’s location to save alongside their text and image.

## Screenshots

<img src="/EventContacts/Screenshots/EventContacts.gif" width="300"/>
