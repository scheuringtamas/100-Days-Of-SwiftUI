import SwiftUI

struct ContentView: View {
    @State private var isGameActive = false
    @State private var selectedTable = 2
    @State private var selectedQuestionCount = 5
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var score = 0

    @State private var questionArray: [Question] = []

    var body: some View {
        NavigationStack {
            VStack {
                if isGameActive {
                    Text("Question \(currentQuestionIndex + 1) of \(selectedQuestionCount)")
                        .font(.title)
                        .padding()

                    Text("What is \(questionArray[currentQuestionIndex].text)?")
                        .font(.headline)
                        .padding()

                    TextField("Your Answer", text: $userAnswer)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()

                    Button("Submit", action: checkAnswer)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                    Button("New Game", action: restart)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                    
                   Spacer()
                    
                    Text("Score: \(score) out of \(selectedQuestionCount)")
                        .font(.headline)
                        .foregroundColor(.blue)
                    
                    Spacer()

                } else {
                    Form {
                        Section(header: Text("Select Multiplication Table")) {
                            Stepper(value: $selectedTable, in: 2...12) {
                                Text("\(selectedTable)")
                            }
                        }

                        Section(header: Text("Select Number of Questions")) {
                            Picker("Questions", selection: $selectedQuestionCount) {
                                Text("5").tag(5)
                                Text("10").tag(10)
                                Text("20").tag(20)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                    }
                    .padding()

                    Button("Start Game", action: startGame)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Multiplication")
        }
    }

    func startGame() {
        questionArray = generateQuestions()
        isGameActive = true
    }

    func generateQuestions() -> [Question] {
        var questions = [Question]()
        for _ in 0..<selectedQuestionCount {
            let multiplier = Int.random(in: 1...12)
            let questionText = "\(selectedTable) x \(multiplier)"
            let answer = selectedTable * multiplier
            let question = Question(text: questionText, answer: answer)
            questions.append(question)
        }
        return questions
    }

    func checkAnswer() {
        guard let enteredAnswer = Int(userAnswer) else { return }
        let correctAnswer = questionArray[currentQuestionIndex].answer

        if enteredAnswer == correctAnswer {
            score += 1
        }

        if currentQuestionIndex + 1 < selectedQuestionCount {
            currentQuestionIndex += 1
        }

        userAnswer = ""
    }

    func endGame() {
        isGameActive = false
        currentQuestionIndex = 0
    }
    
    func restart() {
        score = 0
        endGame()
    }
}

struct Question {
    let text: String
    let answer: Int
}

#Preview {
    ContentView()
}
