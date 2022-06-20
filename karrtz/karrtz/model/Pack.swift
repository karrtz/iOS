//
//  Pack.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import Foundation

open
class Pack : Identifiable, Decodable {
    
    init(name : String, id : Int) {
        self.name = name
        self.id = id
        self.cards = []
    }
    var name : String
    public var id : Int
    var cards : Array<Card>
}
