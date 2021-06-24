//
//  CardView.swift
//  Stanford-CS193p
//
//  Created by Jianyuan Chen on 2021-06-23.
//

import SwiftUI

struct CardView: View {
    
    private var shape = RoundedRectangle(cornerRadius: 20)
    
    public var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack(alignment: .center) {
            shape
                .fill()
                .foregroundColor(isFaceUp ? .white : .red)
                .zIndex(isFaceUp ? 0 : 3)
            
            shape
                .stroke(lineWidth: 3)
                .foregroundColor(.red)
            
            Text(content)
                .zIndex(isFaceUp ? 3 : 0)
                .font(.largeTitle)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
    
    init(_ content: String) {
        self.content = content
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView("👆")
                .previewDisplayName("Light")
                .preferredColorScheme(.light)
            
            CardView("👆")
                .previewDisplayName("Dark")
                .preferredColorScheme(.dark)
        }
    }
}
