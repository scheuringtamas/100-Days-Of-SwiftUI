import SwiftUI

struct ContentView: View {
    let savePath = FileManager.documentsDirectory.appendingPathComponent("diceroll.json")

    @State private var rollAmount = 0
    @State private var results = [GameResults]()
    @State private var numSides = 6
    @State private var numDie = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("You Rolled: ")
                    .font(.title)
                    .padding()
                Text("\(rollAmount)")
                    .font(.largeTitle)
                    .padding()
                
                Button {
                    rollDice()
                    saveRoll()
                } label: {
                    Text("Start")
                        .font(.largeTitle)
                    
                }
                .buttonStyle(.bordered)
                .padding()
                .clipShape(Capsule())
                Form {
                    Section("Sides") {
                        Picker("", selection: $numSides) {
                            Text("4").tag(4)
                            Text("6").tag(6)
                            Text("8").tag(8)
                            Text("10").tag(10)
                            Text("12").tag(12)
                            Text("20").tag(20)
                            Text("100").tag(100)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Section("Dice") {
                        Picker("", selection: $numDie) {
                            ForEach(1...6, id: \.self) { i in
                                Text("\(i)").tag(i)
                                
                            }
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    Section {
                        NavigationLink {
                            RollResultsView()
                        } label: {
                            Text("View Previous Rolls")
                        }
                    }
                }
                
            }
            .navigationTitle("Dice Roller")
            .toolbar {
                Button("New Game"){
                    resetGame()
                }
            }
        }
    }
    
    
    
    
    func rollDice() {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()

        var flickerTimer: Timer?
        var flickerCount = 0
        var totalRoll = 0
        flickerTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            let rollPerDie = Int.random(in: 1...numSides)
            totalRoll += rollPerDie
            rollAmount = totalRoll
            flickerCount += 1
            if flickerCount == 10 {
                flickerTimer?.invalidate()
                generator.notificationOccurred(.success)
            }
        }
    }


    
    func saveRoll() {
        let result = GameResults(id: UUID(), rollResult: rollAmount)
        results.insert(result, at: 0)
        if let encoded = try? JSONEncoder().encode(results) {
            do {
                try encoded.write(to: savePath)
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
    
    func resetGame() {
        
        rollAmount = 0
        results = []

        if let encoded = try? JSONEncoder().encode(results) {
            do {
                try encoded.write(to: savePath)
            } catch {
                print("Error is \(error.localizedDescription)")
            }
        }
    }
    
    
    
}

#Preview {
    ContentView()
}
