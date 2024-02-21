# Project 17 - Flashzilla

This app is designed to facilitate learning through flashcards, where one side of the card displays a concept or word (e.g., "to buy"), and the other side provides its corresponding translation or meaning (e.g., "comprar").

## Topics

Gestures, hit testing,  Combine framework, Timer, reading specific accessibility settings, haptic feedback.

## Challenges
From [Hacking with Swift](https://www.hackingwithswift.com/books/ios-swiftui/flashzilla-wrap-up):
>1. When adding a card, the text fields keep their current text. Fix that so that the textfields clear themselves after a card is added.
>2. If you drag a card to the right but not far enough to remove it, then release, you see it turn red as it slides back to the center. Why does this happen and how can you fix it? (Tip: think about the way we set offset back to 0 immediately, even though the card hasn’t animated yet. You might solve this with a ternary within a ternary, but a custom modifier will be cleaner.)
>3. For a harder challenge: when the users gets an answer wrong, add that card goes back into the array so the user can try it again. Doing this successfully means rethinking the ForEach loop, because relying on simple integers isn’t enough – your cards need to be uniquely identifiable.

Still thirsty for more? Try upgrading our loading and saving code in two ways:

>1. Make it use an alternative approach to saving data, e.g. documents JSON rather than UserDefaults, or SwiftData – this is generally a good idea, so you should get practice with this.
>2. Try to find a way to centralize the loading and saving code for the cards. You might need to experiment a little to find something you like!

## Screenshots

<img src="/Flashzilla/Screenshots/Flashzilla.gif" width="500"/>
