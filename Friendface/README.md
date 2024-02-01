# Milestone: Projects 10-12

https://www.hackingwithswift.com/100/swiftui/60

## Challenges
From [Hacking with Swift](https://www.hackingwithswift.com/guide/ios-swiftui/5/3/challenge):

It’s time for you to build an app from scratch, and it’s a particularly expansive challenge today: your job is to use URLSession to download some JSON from the internet, use Codable to convert it to Swift types, then use NavigationStack, List, and more to display it to the user.

Your first step should be to examine the JSON. The URL you want to use is this: https://www.hackingwithswift.com/samples/friendface.json – that’s a massive collection of randomly generated data for example users.

As you can see, there is an array of people, and each person has an ID, name, age, email address, and more. They also have an array of tag strings, and an array of friends, where each friend has a name and ID.

How far you implement this is down to you, but at the very least you should:

>1. Fetch the data and parse it into User and Friend structs.
>2. Display a list of users with a little information about them, such as their name and whether they are active right now.
>3. Create a detail view shown when a user is tapped, presenting more information about them, including the names of their friends.
>4. Before you start your download, check that your User array is empty so that you don’t keep starting the download every time the view is shown.

If you’re not sure where to begin, start by designing your types: build a User struct with properties for name, age, company, and so on, then a Friend struct with id and name. After that, move onto some URLSession code to fetch the data and decode it into your types.

You might notice that the date each user registered has a very specific format: 2015-11-10T01:47:18-00:00. This is known as ISO-8601, and is so common that there’s a built-in dateDecodingStrategy called .iso8601 that decodes it automatically.

While you’re building this, I want you to keep one thing in mind: this kind of app is the bread and butter of iOS app development – if you can nail this with confidence, you’re well on your way to a full-time job as an app developer.

Tip: As always, the best way to solve this challenge is to keep it simple – write as little code as you can to solve the challenge, and for you to feel comfortable that it works well.

## Screenshot

<img src="/Friendface/Screenshots/Friendface.gif" width="300"/>
