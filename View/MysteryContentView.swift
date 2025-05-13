//
//  MysteryContentView.swift
//  FoodieApp
//
//  Created by Vernee Thompson on 4/24/25.
//

import SwiftUI


struct MysteryFoodQuestion {
    var question: String
    var answer: String

}

var riddles: [MysteryFoodQuestion] = [
    // Place real riddles about resturants here
    // How to have multiple answers for a question
    MysteryFoodQuestion(
        question: "Flats or drums, we do our thing-- who run the city when it comes to wings?",
        answer: "Kingz of Wings"),
    // These are placeholders
    //MysteryFoodQuestion(question: "Which kind of fruit must have a large wedding ceremony with lots of people in attendance?", answer: "Cantelope"),
    MysteryFoodQuestion(question: "What kind of fruit do computer nerds love the most?", answer: "Apples"),
    //MysteryFoodQuestion(question: "I am a bird, I am a fruit and I am a person. What am I?", answer: "Kiwi"),
    //MysteryFoodQuestion(question: "What kind of vegetable do people look forward to getting every month?", answer: "Celery"),
    //MysteryFoodQuestion(question: "What vegetable always loses in every competition, yet is a terrific rapper?", answer: "Beets"),
    //MysteryFoodQuestion(question: "What vegetable can you use to tie your shoe lace?", answer: "String Bean"),
    //MysteryFoodQuestion(question: "Which fruit is a celebrity?", answer: "Star Apple"),
    //MysteryFoodQuestion(question: "What kind of food do mummies like to eat?", answer: "Wraps"),
    //MysteryFoodQuestion(question: "What fruit is friendly and likes to meet people?", answer: "Dates"),
    //MysteryFoodQuestion(question: "What fruit likes to get drunk the most?", answer: "Cocktail"),
    //MysteryFoodQuestion(question: "I love apples and I love to read, you’ll find me digging around in the earth. What am I?", answer: "Bookworm"),
    //MysteryFoodQuestion(question: "What is the most delicious kind of money?", answer: "Doughnut"),
    //MysteryFoodQuestion(question: "What is the craziest, wackiest, most bizarre fruit?", answer: "Coconut"),
    //MysteryFoodQuestion(question: "I am the sweetest and most romantic fruit. What am I?", answer: "Honeydew"),
    //MysteryFoodQuestion(question: "What is the longest fruit?", answer: "Longan"),
    //MysteryFoodQuestion(question: "Which vegetable is always unhappy?", answer: "Bitter melon"),
    //MysteryFoodQuestion(question: "What kind of food is always tardy?", answer: "Chocolate"),
    //MysteryFoodQuestion(question: "What vegetable grows eggs?", answer: "Eggplant"),
    //MysteryFoodQuestion(question: "What is the most deceitful and dishonest fruit?", answer: "Lychee"),
    //MysteryFoodQuestion(question: "What did the judge say to the Pillsbury Doughboy?", answer: "Please rise"),
    MysteryFoodQuestion(question: "I am the meanest of all foods and it takes all the might of your teeth to tear me apart, what am I?", answer: "Jerky"),
    MysteryFoodQuestion(question: "What food do you eat when you take a break at school?", answer: "Recess pieces"),
    MysteryFoodQuestion(question: "What is the father of all fruits?", answer: "Pop"),
    MysteryFoodQuestion(question: "What kind of food does a baby chicken make when it goes to the bathroom?", answer: "Chickpeas")
].shuffled()

//func mysteryQuest(mysteryFoodQuestion: MysteryFoodQuestion, userGuess: String) -> Bool {
//
//    if mysteryFoodQuestion.answer == userGuess {
//            return true
//        } else {
//            return false
//        }

func checkAnswer(userGuess: String, correctAnswer: String) -> Bool {
    
    if userGuess == correctAnswer {
        return true
    } else {
        return false
    }
}


struct MysteryContentView: View {
    @State private var userAnswer = ""
    @State private var showAlert = false
    @State private var correctGuess = true
    @State private var wrongGuess = false
    
    @State var mysteryFoodQuestion: MysteryFoodQuestion
    
    
    
    var body: some View {
    
            ZStack {
                Image("Flavorhood")
                    .resizable()
                    .padding(.bottom, 75)
                    .edgesIgnoringSafeArea(.all)
//
                //Image placeholder and animation
               
                ImageAnimation(
                    isFlipped: checkAnswer(
                        userGuess: userAnswer, correctAnswer: mysteryFoodQuestion.answer
                        
                    ),
                    showAlert: $showAlert,
                    question: mysteryFoodQuestion
                    
                )
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            //Button will add discount code to user profile.  How do we keep them from using it more than once
            
            
            
        }

}

#Preview {
    MysteryContentView(
        mysteryFoodQuestion: MysteryFoodQuestion(
            question: "What is the father of all fruits?",
            answer: "Pop"
        )
    )
}

