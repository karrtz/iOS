//
//  CardList.swift
//  karrtz
//
//  Created by Alex Jenke on 21.06.22.
//

import SwiftUI

struct CardList: View {
    var pack : Pack
    var body: some View {
        List(pack.cards) {card in
            Section{
                NavigationLink {
                    CardDetail(card: card)
                } label: {
                    CardCell(card: card)
                    
                }
                
            }
            .background(card.type == CardType.WHITE ? .white : .black).ignoresSafeArea()
            
        }
        
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(pack.name)
    
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList(pack: packs[0])
    }
}
