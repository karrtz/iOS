//
//  PackDetail.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import SwiftUI

struct PackDetail: View {
    var pack : Pack
    var body: some View {
        CardList(pack: pack)
    }
}

struct PackDetail_Previews: PreviewProvider {
    static var previews: some View {
        PackDetail(pack: getPacks()[0])
    }
}
