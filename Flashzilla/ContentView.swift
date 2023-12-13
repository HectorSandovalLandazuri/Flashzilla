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

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    ContentView()
}
