# Milestone: Projects 7-9

https://www.hackingwithswift.com/100/swiftui/47

## Challenges
From [Hacking with Swift](https://www.hackingwithswift.com/guide/ios-swiftui/4/3/challenge):

This time your goal is to build a habit-tracking app, for folks who want to keep track of how much they do certain things. That might be learning a language, practicing an instrument, exercising, or whatever – they get to decide which activities they add, and track it however they want.

At the very least, this means there should be a list of all activities they want to track, plus a form to add new activities – a title and description should be enough.

For a bigger challenge, tapping one of the activities should show a detail screen with the description. For a tough challenge – see the hints below! – make that detail screen contain how many times they have completed it, plus a button incrementing their completion count.

And if you want to make the app really useful, use Codable and UserDefaults to load and save all your data.

So, there are three levels to this app, and you can choose how far you want to go depending on how much time you have and how far you want to push yourself. I do recommend you at least give each level a try, though – every little bit of practice you get helps solidify your learning!

Hacking with Swift+ subscribers can get a complete video solution for this checkpoint here: Solution to Habit Tracking. If you don’t already subscribe, you can start a free trial today.

Hints:

>1. Start with your data: define a struct that holds a single activity, and a class that holds an array of activities.
>2. The class will need to use the Observable macro so SwiftUI can monitor your data for changes.
>3. Your main listing and form should both be able to read the shared activities object.
>4. Make sure your activity conforms to Identifiable to avoid problems.
>5. Present your adding form using sheet(), and your activity detail view (if you add one) using NavigationLink. I recommend against using presentation values for your navigation – keep it simple here!

## Screenshot

<img src="/HabitTracking/Screenshots/HabitTracking.gif" width="300"/>
