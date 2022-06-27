//
//  CardDetail.swift
//  karrtz
//
//  Created by Alex Jenke on 21.06.22.
//

import SwiftUI

struct CardDetail: View {
    @Binding var card: Card
    @Binding var cards : [Card]
    var pack : Pack
    
    var body: some View {
        //Color(card.type.rawValue).ignoresSafeArea()
        Form{
            Section(header: Text("Type")) {
                Picker(selection: $card.type, label: Text("Card Type")) {
                    Text("white").tag(CardType.WHITE)
                    Text("black").tag(CardType.BLACK)
                        
                }
                .pickerStyle(MenuPickerStyle())
                .onChange(of: card.type) { newvalue in
                    //print("type \(card.type.rawValue) should now be \(type)")
                    //$card.type = type
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
                        //card.text = text
                        save(pack: pack)
                    }
            }
        }
    }
}
