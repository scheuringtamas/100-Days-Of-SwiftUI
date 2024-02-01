# Day 61 - Time for SwiftData

https://www.hackingwithswift.com/100/swiftui/61

## Challenges

If I had said to you that your challenge was to build an app that fetches data from the network, decodes it into native Swift types, then displays it using a navigation stack – oh, and by the way, the whole thing should be powered using SwiftData… well, suffice to say you’d probably have balked at the challenge.

So, instead I’ve pulled a fast one: yesterday I had you work on the fundamentals of the app, making sure you understand the JSON, got your Codable support right, thought your UI through, and more.

Today I’m going to do what inevitably happens in any real-world project: I’m going to add a new feature request to the project scope. This is sometimes called “scope creep”, and it’s something you’re going to face on pretty much every project you ever work on. That doesn’t mean planning ahead is a bad idea – as Winston Churchill said, “those who plan do better than those who do not plan, even though they rarely stick to their plan.”

So, we’re not sticking to the plan; we’re adding an important new feature that will force you to rethink the way you’ve built your app, will hopefully lead you to think about how you structured your code, and also give you practice in a technique that you ought to be thoroughly familiar with by now: SwiftData.

Yes, your job today is to expand your app so that it uses SwiftData. Your boss just emailed you to say the app is great, but once the JSON has been fetched they really want it to work offline. This means you need to use SwiftData to store the information you download, then use your SwiftData models to display the views you designed – you should only fetch the data once.

The end result will hopefully be the same as if I had given you the task all at once, but segmenting it in two like this hopefully makes it seem more within reach, while also giving you the chance to think about how well you structured your code to be adaptable as change requests come in.

Important: please read!
This is a hard challenge. I’m going to give you a small tip below, and some of you might think “tips? Ha! I don’t need tips, I can do this myself!” But please make an exception today, because this small tip will save you hours of headaches.

Here's the tip: You need to make your User and Friend structs into @Model classes that conform to Codable. Doing that means adding custom Codable conformance: an initializer from a Decoder, and an encode(to:) method.

If you've forgotten how to do that, reread the Key Points summary from the most recent milestone, particularly the section "Completely custom Codable implementations".

That’s it! Again, this is a hard challenge, so please don’t feel bad when it feels hard. Take your time and work through

Good luck!

## Screenshot

<img src="/Friendface2/Screenshots/Friendface2.gif" width="300"/>
