//
//  MysteryModelView.swift
//  Flavor_Hood
//
//  Created by Vernee Thompson on 5/13/25.
//



import SwiftUI

struct ImageAnimation: View {
    @State var isFlipped: Bool
    @State var guess: String = ""
    @Binding var showAlert: Bool
    @State var question: MysteryFoodQuestion
    @State var showClearedText: Bool = false
    @State var newText = ""
    
    var body: some View {
        ImageFlip(
            front: {
                VStack{
                    Text("\(question.question)")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .bold()
                    TextField("Enter your answer", text: $guess)
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .padding(50)
                    Button() {
                        if guess.lowercased() == question.answer.lowercased() {
                            
                            isFlipped.toggle()
                           
                        } else {
                            if guess.lowercased() != question.answer.lowercased() {
                                
                                isFlipped.toggle()
                            
                            }
                        }
                        print(isFlipped.description)
                    } label: {
                        Label("Check Answer", systemImage: "chevron.right")
                    }
                    .font(.title3)
                }
                .onAppear(perform: randomQuestions)
                
            },
            back: {
                if guess.lowercased() == question.answer.lowercased() {
                    Text("Congratulations! You've unlocked a mystery resturant! Click link to go to restaurant webpage!")
                    Link("Hacking with Swift", destination: URL(string: "https://www.hackingwithswift.com")!)
                        .padding(.top, 200)
                    Button("Ok", role: .cancel, action: flip)
                        .padding(.top, 300)
                } else {
                    Text("Sorry, try again tomorrow!")
                    Button("Ok", role: .cancel, action: flip)
                        .padding(.top, 200)
                }
                
            },
            isFlipped: $isFlipped)
    }
    func randomQuestions() {
        question = riddles
            .randomElement() ?? MysteryFoodQuestion(question: "Error", answer: "Food not found")
    }
    func flip() {
        isFlipped.toggle()
    }
}
struct ImageFlip<Front, Back>: View where Front: View, Back: View {
    
    var front: () -> Front
    var back: () -> Back
    
    @Binding var isFlipped: Bool
    
    @State private var imageRotation = 0.0
    @State private var contentRotation = 0.0
    
    init(
        @ViewBuilder front: @escaping () -> Front,
        @ViewBuilder back: @escaping () -> Back,
        isFlipped: Binding<Bool>) {
            self.front = front
            self.back = back
            self._isFlipped = isFlipped
            
        }
    
    var body: some View {
        ZStack {
            if isFlipped {
                back()
            } else {
                front()
                
            }
        }
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .padding()
        .frame(width: 375, height: 375)
        .background(Color.tangerine)
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerSize: .init(width: 30, height: 30))
                .stroke(Color.tyrianPurple, lineWidth: 5)
        )
        .padding(.top, 70)
        .onChange(of: isFlipped, { oldValue, newValue in
            print(isFlipped.description)
            flipImage()
        })
        .rotation3DEffect(.degrees(imageRotation), axis: (x: 0, y: 1, z: 0))
    }
    
    func flipImage() {
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime)) {
            imageRotation += 360
            
        }
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
            contentRotation += 360
            isFlipped.toggle()
        }
    }
}

#Preview {
    ImageAnimation(
        isFlipped: false,
        showAlert: .constant(false),
        question: .init(question: "What is the father of all fruits?", answer: "Pop"))
}

