//
//  File.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import Foundation

class Card : Identifiable, Decodable, ObservableObject {
    init(id: Int, text: String, type: CardType) {
        self.id = id
        self.text = text
        self.type = type
    }
    let id : Int
    var text : String
    var type : CardType
    
}
