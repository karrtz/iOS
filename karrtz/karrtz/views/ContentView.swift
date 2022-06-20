//
//  ContentView.swift
//  karrtz
//
//  Created by Alex Jenke on 19.06.22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    //@FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Pack.name, ascending: true)],
    //        animation: .default)
        //private var packs: FetchedResults<Pack>
    
    var packs : [Pack] = []
    
    //packs.append()
    
    var body: some View {
        PackList()
    }
    /*
    private func deletePacks(offsets: IndexSet) {
        //offsets.map {packs[$0]}.forEach(viewContext.delete)
        do {
            try viewContext.save()
        } catch {
        
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    private func addPack() {
        withAnimation {
            //var newPack = Item(context: viewContext)
            //packs.append(newPack)
            //newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }*/
    
}

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

