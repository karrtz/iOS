//
//  File.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import Foundation

class Card : Identifiable, Decodable, ObservableObject, Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        if (lhs.type == rhs.type) {
            return lhs.text < rhs.text
        }
        return lhs.type.rawValue < rhs.type.rawValue
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
    
    init(id: Int, text: String, type: CardType) {
        self.id = id
        self.text = text
        self.type = type
    }
    let id : Int
    var text : String
    var type : CardType
    
}
