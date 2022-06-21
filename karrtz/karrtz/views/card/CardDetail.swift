//
//  CardDetail.swift
//  karrtz
//
//  Created by Alex Jenke on 21.06.22.
//

import SwiftUI

struct CardDetail: View {
    var card: Card
    var body: some View {
        //Color(card.type.rawValue).ignoresSafeArea()
        
        Text(card.text)
            //.foregroundColor(card.type == CardType.WHITE ? .white : .black)
            .font(.title)
            .padding()
           /* .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color(card.type.rawValue), lineWidth: 1)
                        .background(card.type == CardType.WHITE ? .black : .white).ignoresSafeArea()
                        
            )*/
            //.background(card.type == CardType.WHITE ? .white : .black))
        
        //.foregroundColor(Color(card.type.rawValue))
        //Color(card.type == CardType.WHITE ? .white : .black).ignoresSafeArea()
            
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(card: packs[0].cards[2])
    }
}
