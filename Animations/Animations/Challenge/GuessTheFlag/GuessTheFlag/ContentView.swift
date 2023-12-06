import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    @State private var finalRound = false
    @State private var questions = 1
    
    @State private var animationAmount = 0.0
    @State private var selectedNumber = 0
    @State private var isCorrect = false
    @State private var isWrong = false
    @State private var fadeOutOpacity = false
    

    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        }
                    label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                                .rotation3DEffect(.degrees(self.isCorrect && self.selectedNumber == number  ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .opacity(self.fadeOutOpacity && !(self.selectedNumber == number) ? 0.25 : 1)
                                .rotation3DEffect(.degrees(self.isWrong && self.selectedNumber == number  ? 90 : 0), axis: (x: 0, y: 0, z: 0.5))

                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                Text("Question: \(questions)/8")
                    .foregroundStyle(.white)
                    .font(.title)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        
        .alert("Game over", isPresented: $finalRound) {
            Button("Restart game", action: reset)
        } message: {
            Text("Your final score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedNumber = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            isCorrect = true
            fadeOutOpacity = true
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            fadeOutOpacity = true
            isWrong = true
        }
        showingScore = true
        
        if questions == 8 {
            finalRound = true
        }
    }
    
    func askQuestion() {
        questions += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        isCorrect = false
        fadeOutOpacity = false
        isWrong = false
    }
    
    func reset() {
        questions = 0
        score = 0
    }
}

#Preview {
    ContentView()
}
