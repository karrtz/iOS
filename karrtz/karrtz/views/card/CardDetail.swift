//
//  CardDetail.swift
//  karrtz
//
//  Created by Alex Jenke on 21.06.22.
//

import SwiftUI

struct CardDetail: View {
    @ObservedObject var card: Card
    @State var text : String
    @State var type : CardType
    
    init(card: Card) {
        self.card = card
        self.text = card.text
        self.type = card.type
    }
    
    var body: some View {
        //Color(card.type.rawValue).ignoresSafeArea()
        
        Section(header: Text("Type").font(.title)) {
            Picker(selection: $card.type, label: Text("Card Type").font(.title2)) {
                Text("white").tag(CardType.WHITE)
                Text("black").tag(CardType.BLACK)
            }
            .onTapGesture {
                print("type \(card.type.rawValue) should now be \(type)")
                card.type = type
                }
        }
        
        Section(header: Text("Card").font(.title)) {
            TextEditor(text: $card.text)
                .font(.title2)
                .padding()
                .onTapGesture{
                    card.text = text
                }
        }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(card: getPacks()[0].cards[2])
    }
}
