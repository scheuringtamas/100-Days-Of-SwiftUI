import SwiftUI

struct ContentView: View {
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var randomNumber = Int.random(in: 0..<3)
    @State private var round = 1
    @State private var gameOver = false
    
    let moves = ["✊🏻", "✋🏻", "✌🏻"]
    
    
    var body: some View {
        VStack(spacing: 50) {
            Text(moves[randomNumber])
                .font(.system(size: 100))
            
            Text("You should \(shouldWin ? "win" : "lose")!")
                .font(.title)
                .padding()
            
            HStack {
                ForEach(moves, id: \.self) { move in
                    Button(action: {
                        self.evaluateMove(move: move)
                    }) {
                        Text(move)
                            .font(.system(size: 100))
                    }
                }
            }
            .alert("Game over", isPresented: $gameOver){
                Button("Restart game", action: {
                    round = 0
                    score = 0
                })
            }
            
            
            Text("Score \(score)")
                .font(.title)
            Text("Round \(round) / 10")
                .font(.title)
        }
    }
    
    func evaluateMove(move: String) {
            let appWins = moves[(randomNumber + 1) % 3]
            let appLoses = moves[(randomNumber + 2) % 3]

            if (shouldWin && move == appWins) || (!shouldWin && move == appLoses) {
                score += 1
            } else {
                if(score > 0) {
                    score -= 1
                }
            }

            if round < 10 {
                round += 1
                randomNumber = Int.random(in: 0..<3)
                shouldWin.toggle()
            } else {
                gameOver = true
            }
        }
}

#Preview {
    ContentView()
}

