//
//  PacketList.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import SwiftUI

struct PackList: View {
    
    @State private var packs : [Pack]
    @State private var showingSheet = false
    @State private var selectedPack : Pack? = nil
    init() {
        packs = getPacks()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach($packs, id: \.self.id) {$pack in
                    VStack {
                        Section {
                            NavigationLink {
                                CardList(pack: pack)
                            } label: {
                                PackRow(pack: $pack, packs: $packs)
                            }
                            .contextMenu {
                                Button {
                                    print(pack.name)
                                    self.selectedPack = pack
                                    showingSheet = true
                                } label: {
                                    Label("Edit", systemImage: "square.and.pencil")
                                }
                            }
                        }
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Packs")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    
                    Button(action: addPack) {
                        Label("Add a Pack", systemImage: "plus")
                    }
                    EditButton()
                }
            }
            
        }
        
        .sheet(item: self.$selectedPack) { pack in
            PackDetail(pack: Binding(get: {pack}, set: { pack in
                selectedPack = pack
            }), packs: $packs)
        }
        
        
    }
    func addPack() {
        var pack : Pack = Pack(name: "newPack", id: packs.count + 1)
        var card : Card = Card(id: 1, text: "first card", type: CardType.WHITE)
        pack.cards = [card]
        packs.append(pack)
        packs.sort()
        save(packs: packs)
    }
    
    private func delete(at offsets: IndexSet) {
        packs.remove(atOffsets: offsets)
        save(packs: packs)
    }
    
    public func update() {
        packs.append(Pack(name: "temp", id: -1))
        packs.removeLast()
    }
    
}
/*
struct PacketList_Previews: PreviewProvider {
    static var previews: some View {
        PackList()
    }
}*/
