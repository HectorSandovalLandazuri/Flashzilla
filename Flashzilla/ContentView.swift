//
//  ContentView.swift
//  Flashzilla
//
//  Created by Héctor Manuel Sandoval Landázuri on 13/12/23.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, world!")
//                .onTapGesture(count: 2) {
//                    print("Double tapped!")
//                }
//        }
//        .padding()
//    }
//}

//struct ContentView: View {
//    @State private var currentAmount = 0.0
//    @State private var finalAmount = 1.0
//
//    var body: some View {
//        Text("Hello, World!")
//            .scaleEffect(finalAmount + currentAmount)
//            .gesture(
//                MagnificationGesture()
//                    .onChanged { amount in
//                        currentAmount = amount - 1
//                    }
//                    .onEnded { amount in
//                        finalAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
//    }
//}

//struct ContentView: View {
//    @State private var currentAmount = Angle.zero
//    @State private var finalAmount = Angle.zero
//
//    var body: some View {
//        Text("Hello, World!")
//            .rotationEffect(currentAmount + finalAmount)
//            .gesture(
//                RotationGesture()
//                    .onChanged { angle in
//                        currentAmount = angle
//                    }
//                    .onEnded { angle in
//                        finalAmount += currentAmount
//                        currentAmount = .zero
//                    }
//            )
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .onTapGesture {
//                    print("Text tapped")
//                }
//        }
//        .onTapGesture {
//            print("VStack tapped")
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .onTapGesture {
//                    print("Text tapped")
//                }
//        }
//        .highPriorityGesture(
//            TapGesture()
//                .onEnded { _ in
//                    print("VStack tapped")
//                }
//        )
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Hello, World!")
//                .onTapGesture {
//                    print("Text tapped")
//                }
//        }
//        .simultaneousGesture(
//            TapGesture()
//                .onEnded { _ in
//                    print("VStack tapped")
//                }
//        )
//    }
//}

//struct ContentView: View {
//    // how far the circle has been dragged
//    @State private var offset = CGSize.zero
//
//    // whether it is currently being dragged or not
//    @State private var isDragging = false
//
//    var body: some View {
//        // a drag gesture that updates offset and isDragging as it moves around
//        let dragGesture = DragGesture()
//            .onChanged { value in offset = value.translation }
//            .onEnded { _ in
//                withAnimation {
//                    offset = .zero
//                    isDragging = false
//                }
//            }
//
//        // a long press gesture that enables isDragging
//        let pressGesture = LongPressGesture()
//            .onEnded { value in
//                withAnimation {
//                    isDragging = true
//                }
//            }
//
//        // a combined gesture that forces the user to long press then drag
//        let combined = pressGesture.sequenced(before: dragGesture)
//
//        // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
//        Circle()
//            .fill(.red)
//            .frame(width: 64, height: 64)
//            .scaleEffect(isDragging ? 1.5 : 1)
//            .offset(offset)
//            .gesture(combined)
//    }
//}

//struct ContentView: View {
//    @State private var counter = 0
//
//    var body: some View {
//        Button("Tap Count: \(counter)") {
//            counter += 1
//        }
//        .sensoryFeedback(.increase, trigger: counter)
//    }
//}

//import CoreHaptics
//struct ContentView: View {
//    @State private var engine: CHHapticEngine?
//    var body: some View {
//        Button("Tap Me", action: complexSuccess)
//            .onAppear(perform: prepareHaptics)
//    }
//    
//    func prepareHaptics() {
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//
//        do {
//            engine = try CHHapticEngine()
//            try engine?.start()
//        } catch {
//            print("There was an error creating the engine: \(error.localizedDescription)")
//        }
//    }
//    
////    func complexSuccess() {
////        // make sure that the device supports haptics
////        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
////        var events = [CHHapticEvent]()
////
////        // create one intense, sharp tap
////        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: 1)
////        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: 1)
////        let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 0)
////        events.append(event)
////
////        // convert those events into a pattern and play it immediately
////        do {
////            let pattern = try CHHapticPattern(events: events, parameters: [])
////            let player = try engine?.makePlayer(with: pattern)
////            try player?.start(atTime: 0)
////        } catch {
////            print("Failed to play pattern: \(error.localizedDescription).")
////        }
////    }
////    
//    func complexSuccess() {
//        // make sure that the device supports haptics
//        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
//        var events = [CHHapticEvent]()
//
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
//            events.append(event)
//        }
//
//        for i in stride(from: 0, to: 1, by: 0.1) {
//            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
//            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
//            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
//            events.append(event)
//        }
//        
//        // convert those events into a pattern and play it immediately
//        do {
//            let pattern = try CHHapticPattern(events: events, parameters: [])
//            let player = try engine?.makePlayer(with: pattern)
//            try player?.start(atTime: 0)
//        } catch {
//            print("Failed to play pattern: \(error.localizedDescription).")
//        }
//    }
//
//    
//}


//struct ContentView: View {
//    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped!")
//                }
//
//            Circle()
//                .fill(.red)
//                .frame(width: 300, height: 300)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    print("Circle tapped!")
//                }
//                //.allowsHitTesting(false)
//        }
//    }
//}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("Hello")
//            Spacer().frame(height: 100)
//            Text("World")
//        }
//        .contentShape(Rectangle())
//        .onTapGesture {
//            print("VStack tapped!")
//        }
//    }
//}

//struct ContentView: View {
//    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
//    @State private var counter = 0
//    var body: some View {
//        Text("Hello, World!")
//            .onReceive(timer) { time in
//                if counter == 5 {
//                    timer.upstream.connect().cancel()
//                } else {
//                    print("The time is now \(time)")
//                }
//
//                counter += 1
//            }
//    }
//}

//struct ContentView: View {
//    @Environment(\.scenePhase) var scenePhase
//    
//    var body: some View {
//        Text("Hello, world!")
//            .padding()
//            .onChange(of: scenePhase) { newPhase, _ in
//                if newPhase == .active {
//                    print("Active")
//                } else if newPhase == .inactive {
//                    print("Inactive")
//                } else if newPhase == .background {
//                    print("Background")
//                }
//            }
//    }
//}

//struct ContentView: View {
//    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
//
//    var body: some View {
//        HStack {
//            if differentiateWithoutColor {
//                Image(systemName: "checkmark.circle")
//            }
//                Text("Success")
//            }
//            .padding()
//            .background(differentiateWithoutColor ? .black : .green)
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//        }
//    }

//struct ContentView: View {
//    @Environment(\.accessibilityReduceMotion) var reduceMotion
//    @State private var scale = 1.0
//
//    var body: some View {
//        Text("Hello, World!")
//            .scaleEffect(scale)
//            .onTapGesture {
//                if reduceMotion {
//                    scale *= 1.5
//                } else {
//                    withAnimation {
//                        scale *= 1.5
//                    }
//                }
//            }
//    }
//}


//func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
//    if UIAccessibility.isReduceMotionEnabled {
//        return try body()
//    } else {
//        return try withAnimation(animation, body)
//    }
//}
//
//
//struct ContentView: View {
//    @State private var scale = 1.0
//    
//    var body: some View {
//        Text("Hello, World!")
//            .scaleEffect(scale)
//            .onTapGesture {
//                withOptionalAnimation {
//                    scale *= 1.5
//                }
//            }
//    }
//}

//struct ContentView: View {
//    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
//
//    var body: some View {
//        Text("Hello, World!")
//            .padding()
//            .background(reduceTransparency ? .black : .black.opacity(0.5))
//            .foregroundColor(.white)
//            .clipShape(Capsule())
//    }
//}

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = Double(total - position)
        return self.offset(y: offset * 10)
    }
}


struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @State private var cards = [Card]()
    @State private var timeRemaining = 100
    @State private var showingEditScreen = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                ZStack {
                    ForEach(cards) { card in
                        CardView(card: card) {  isCorrect in
                            if !isCorrect {
                                readdCard(from: getIndex(for: card))
                            }
                            withAnimation {
                                removeCard(at: getIndex(for: card))
                            }
                        }
                        .stacked(at: getIndex(for: card), in: cards.count)
                        .allowsHitTesting(getIndex(for: card) == cards.count - 1)
                        .accessibilityHidden(getIndex(for: card) < cards.count - 1)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundColor(.black)
                        .clipShape(.capsule)
                }
            }
            
            VStack {
                HStack {
                    Spacer()

                    Button {
                        showingEditScreen = true
                    } label: {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(.black.opacity(0.7))
                            .clipShape(.circle)
                    }
                }

                Spacer()
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            
            if accessibilityDifferentiateWithoutColor || accessibilityVoiceOverEnabled {
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            withAnimation {
                                readdCard(from: cards.count - 1)
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Wrong")
                        .accessibilityHint("Mark your answer as being incorrect.")

                        Spacer()

                        Button {
                            withAnimation {
                                removeCard(at: cards.count - 1)
                            }
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                        .accessibilityLabel("Correct")
                        .accessibilityHint("Mark your answer as being correct.")
                    }
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer) { time in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) {
            if scenePhase == .active {
                if cards.isEmpty == false {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards, content: EditCards.init)
        .onAppear(perform: resetCards)
    }
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func resetCards() {
        timeRemaining = 100
        isActive = true
        loadData()    
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
    
    func getIndex(for card: Card) -> Int {
        cards.firstIndex(where: { $0.id == card.id }) ?? 0
    }

    func readdCard(from index: Int) {
        guard index >= 0 else { return }
        
        let currentCard = cards[index]
        let newCard = Card(prompt: currentCard.prompt, answer: currentCard.answer)
        cards.insert(newCard, at: 0)
    }


}



#Preview {
    ContentView()
}
