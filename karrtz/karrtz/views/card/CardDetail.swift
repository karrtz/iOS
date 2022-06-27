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
    var pack : Pack
    
    init(card: Card, pack : Pack) {
        self.card = card
        self.text = card.text
        self.type = card.type
        self.pack = pack
    }
    
    var body: some View {
        //Color(card.type.rawValue).ignoresSafeArea()
        Form{
            Section(header: Text("Type")) {
                Picker(selection: $type, label: Text("Card Type")) {
                    Text("white").tag(CardType.WHITE)
                    Text("black").tag(CardType.BLACK)
                }
                .onChange(of: type) { newvalue in
                    print("type \(card.type.rawValue) should now be \(type)")
                    card.type = type
                    save(pack: pack) //todo update view and save
                    }
            }
            .onDisappear {
                save(pack:pack)
            }
            
            Section(header: Text("Card")) {
                TextEditor(text: $card.text)
                    //.font(.system())
                    //.padding()
                    .frame(minHeight: 150)
                    .onTapGesture{
                        card.text = text
                        save(pack: pack)
                    }
            }
        }
    }
}

struct CardDetail_Previews: PreviewProvider {
    static var previews: some View {
        CardDetail(card: getPacks()[0].cards[2], pack: getPacks()[0])
    }
}
