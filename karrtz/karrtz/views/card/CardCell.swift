//
//  SwiftUIView.swift
//  karrtz
//
//  Created by Alex Jenke on 21.06.22.
//

import SwiftUI

struct CardCell: View {
    var card : Card
    var body: some View {
        //Color(.black).ignoresSafeArea()
        
            Text(card.text)
                .font(.title2)
                //.foregroundColor((Color(card.type.rawValue).colorInvert() as! Color))
                .foregroundColor(card.type == CardType.WHITE ? .black : .white)
                .frame(height: 150, alignment: .center)
                /*.overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(card.type.rawValue), lineWidth: 1)
                            .background(.black)
                            
                )*/
                
                
                //Spacer()
        //Color(card.type == CardType.WHITE ? .white : .black).ignoresSafeArea()
        
    }
        

}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardCell(card: packs[0].cards[1])
    }
}
