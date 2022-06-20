//
//  PacketList.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import SwiftUI

struct PackList: View {
    var body: some View {
        List(packs) { pack in
            PackRow(pack: pack)
        }
    }
}

struct PacketList_Previews: PreviewProvider {
    static var previews: some View {
        PackList()
    }
}
