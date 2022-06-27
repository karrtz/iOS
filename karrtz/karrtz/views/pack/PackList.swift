//
//  PacketList.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//
import UniformTypeIdentifiers

import SwiftUI

struct PackList: View {
    
    @State private var packs : [Pack]
    @State private var showingSheet = false
    @State private var selectedPack : Pack? = nil
    @State private var showingExporter : Bool = false
    @State private var showingImporter : Bool = false
    @State private var showingAlert : Bool = false
    init() {
        packs = getPacks()
    }
    
    var body: some View {
        //Form {
        NavigationView {
            List {
                ForEach($packs, id: \.self.id) {$pack in
                    //VStack {
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
                                    self.showingSheet = true
                                } label: {
                                    Label("Edit", systemImage: "square.and.pencil")
                                }
                                
                                Button {
                                    self.showingExporter = true
                                } label: {
                                    Label("Export pack", systemImage: "square.and.arrow.up")
                                }
                            }
                        }
                    //}
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Packs")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    
                    Button(action: addPack) {
                        Label("Add a Pack", systemImage: "plus")
                    }
                    
                }
                ToolbarItem(placement: .automatic) {
                    Button(action: {showingImporter = true}) {
                        Label("Import Pack", systemImage: "square.and.arrow.down")
                    }
                }
            }
            
        }
            
        
        .fileExporter(isPresented: $showingExporter,
                      document:  JsonExportFILE(jsonString: createJsonString(packs: packs)),//getPackFile(pack: self.selectedPack!),
                      contentType: .json,
                      onCompletion: {result in })
        .fileImporter(isPresented: $showingImporter,
                      allowedContentTypes: [.json],
                      allowsMultipleSelection: false) { result in
            do {
                guard let selectedFile: URL = try result.get().first else { return }
                if selectedFile.startAccessingSecurityScopedResource() {
                    guard let packString : String = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
                    print(packString)
                    packs = try addToPacks(packString: packString, packs: packs)
                }
                selectedFile.stopAccessingSecurityScopedResource()
            } catch {
                print((error))
                showingAlert = true
            }
        }
        .alert("Coulnd not import file.", isPresented: $showingAlert) {
                  Button("OK", role: .cancel) { }
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
