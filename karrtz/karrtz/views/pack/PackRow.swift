//
//  PackRow.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import SwiftUI

struct PackRow: View {
    @Binding var pack: Pack
    @Binding var packs : [Pack]
    
    @State var shown : Bool = false
    
    var onChange = {}
    
    
    var body: some View {
        ZStack {
            Button(action: {shown = true}, label: {row})
        }
        .sheet(isPresented: $shown, onDismiss: {
            save(pack:pack)
            self.onChange()
        })
        {
            NavigationView {
                PackDetail(pack: $pack, packs: $packs)
                    .navigationTitle(pack.name)
                    .navigationBarTitleDisplayMode(.inline)
            }
            
            
            .foregroundColor(Color.primary)
        }
    }
    
    var row: some View {
        
        HStack {
            Text(pack.name).font(.title2)
            Spacer()
                .frame(height: 100)
        }
    }
}
/*
struct PackRow_Previews: PreviewProvider {
    static var previews: some View {
        PackRow(pack: getPacks()[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}*/
