//
//  CardList.swift
//  karrtz
//
//  Created by Alex Jenke on 21.06.22.
//

import SwiftUI

struct CardList: View {

    var pack : Pack
    @State var cards : [Card] //= pack.cards
    init(pack : Pack){
        cards = pack.cards
        self.pack = pack
    }
    
    
    var body: some View {
        List() {
            ForEach(cards, id: \.self.id) {card in
                Section{
                
                    NavigationLink(destination: CardDetail(card: card)) {
                        CardCell(card: card).padding()
                            
                    }.listRowBackground(card.type == CardType.WHITE ? Color.white : Color.black)
                        
                }
            }
            .onDelete(perform: delete)
            
        }
    
        .navigationTitle(pack.name)
        .toolbar {
            
            ToolbarItem(placement: .primaryAction) {
                
                Button(action: addCard) {
                    Label("Add a card", systemImage: "plus")
                }
                EditButton()
            }
        
        }
    }
    private func addCard(){
        
        var card : Card = Card(id: pack.cards.count + 1,text:"addedCard", type: CardType.WHITE)
        cards.append(card)
        pack.cards = cards
        save(pack: pack)
    }
    
    private func delete(at offsets: IndexSet) {
            cards.remove(atOffsets: offsets)
        pack.cards = cards
        save(pack: pack)
        }
        
}



struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList(pack: getPacks()[0])
    }
}
