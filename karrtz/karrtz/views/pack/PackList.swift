//
//  PacketList.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import SwiftUI

struct PackList: View {
    var body: some View {
        NavigationView {
            List(getPacks()) { pack in
                NavigationLink {
                    PackDetail(pack: pack)
                } label: {
                    PackRow(pack: pack)
                }
            }
            .navigationTitle("Packs")
        }
        
    }
}

struct PacketList_Previews: PreviewProvider {
    static var previews: some View {
        PackList()
    }
}
