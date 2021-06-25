//
//  CardView.swift
//  Stanford-CS193p
//
//  Created by Jianyuan Chen on 2021-06-23.
//

import SwiftUI

struct CardView: View {
    
    typealias Card = MemoryGame<String>.Card
    
    private var shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
    
    public var content: Card
    private var isFaceUp: Bool { return content.isFaceUp }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(content.content).font(font(in: geometry.size))
                } else if content.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    init(_ content: Card) {
        self.content = content
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.74
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
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
