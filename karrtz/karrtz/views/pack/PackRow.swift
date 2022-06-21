//
//  PackRow.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import SwiftUI

struct PackRow: View {
    var pack: Pack
    
    var body: some View {
        HStack {
            Text(pack.name).font(.title2)
            Spacer()
        }
    }
}

struct PackRow_Previews: PreviewProvider {
    static var previews: some View {
        PackRow(pack: packs[0])
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
