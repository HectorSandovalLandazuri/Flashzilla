//
//  Card.swift
//  Flashzilla
//
//  Created by Héctor Manuel Sandoval Landázuri on 23/02/24.
//

import Foundation

struct Card: Codable, Identifiable {
    var id = UUID()
    var prompt: String
    var answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
