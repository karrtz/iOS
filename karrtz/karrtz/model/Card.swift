//
//  File.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import Foundation

struct Card : Identifiable, Decodable {
    let id : Int
    let text : String
    let type : CardType
}
