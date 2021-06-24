//
//  CardView.swift
//  Stanford-CS193p
//
//  Created by Jianyuan Chen on 2021-06-23.
//

import SwiftUI

struct CardView: View {
    
    private var shape = RoundedRectangle(cornerRadius: 20)
    
    public var content: MemoryGame<String>.Card
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack(alignment: .center) {
            shape
                .fill()
                .foregroundColor(isFaceUp ? .white : .red)
                .zIndex(isFaceUp ? 0 : 3)
            
            shape
                .strokeBorder(lineWidth: 3)
                .foregroundColor(.red)
            
            Text(content.content)
                .zIndex(isFaceUp ? 3 : 0)
                .font(.largeTitle)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
    
    init(_ content: MemoryGame<String>.Card) {
        self.content = content
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(MemoryGame<String>.Card(id: UUID(), isFaceUp: true, isMatched: false, content: "👆"))
                .previewDisplayName("Light")
                .preferredColorScheme(.light)
            
            CardView(MemoryGame<String>.Card(id: UUID(), isFaceUp: true, isMatched: false, content: "👆"))
                .previewDisplayName("Dark")
                .preferredColorScheme(.dark)
        }
    }
}
