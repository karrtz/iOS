//
//  PackDetail.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import SwiftUI

struct PackDetail: View {
    @Binding var pack : Pack
    @Binding var packs : [Pack]

    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextEditor(text: $pack.name)
                    .onTapGesture {
                        print("tap gesture")
                        pack.name = pack.name
                        //save(pack: pack)
                    }
                    .frame(minHeight: 150)
            }
            
        }
        .onDisappear() {
            save(pack: pack)
            //packs.append(Pack(name: "temp", id: -1))
            //packs.removeLast()
            packs.remove(at:packs.firstIndex(of: pack)!)
            packs.append(pack)
            
        }
    }
}
/*
struct PackDetail_Previews: PreviewProvider {
    static var previews: some View {
        PackDetail(pack: $getPacks()[0])
    }
}*/
