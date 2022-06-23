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
        VStack(alignment: .center) {
            Text(card.text)
                .font(.title2)
                //.foregroundColor((Color(card.type.rawValue).colorInvert() as! Color))
                .foregroundColor(card.type == CardType.WHITE ? .black : .white)
                .frame(height: 150, alignment: .center)
                //.listRowBackground(card.type == CardType.WHITE ? Color.black : Color.white)
                
                //.shadow(radius: 10)
                /*.overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(card.type.rawValue), lineWidth: 1)
                            .background(.black)
                            
                )*/
            
        }
        
        .frame(maxWidth: .infinity, alignment: .center)
        //.background(card.type == CardType.WHITE ? Color.white : Color.black.opacity(0.8))
        .cornerRadius(10)
        
        
                //Spacer()
        //Color(card.type == CardType.WHITE ? .white : .black).ignoresSafeArea()
        
    }
    

}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CardCell(card: getPacks()[0].cards[0])
    }
}
