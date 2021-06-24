//
//  GridView.swift
//  Stanford-CS193p
//
//  Created by Jianyuan Chen on 2021-06-23.
//

import SwiftUI

struct GridView: View {
    
    public var data: [String]
    public var emojiCount: Int
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()], alignment: .center, spacing: nil, pinnedViews: [], content: {
                ForEach(data[0..<emojiCount], id: \.self) { item in
                    CardView(item)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            })
        }
        .padding()
    }
    
    init(data: [String], emojiCount: Int) {
        self.data = data
        self.emojiCount = emojiCount
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // GridView(data: emojis)
            GameView()
                .previewDisplayName("Light")
                .preferredColorScheme(.light)
            
            // GridView(data: emojis)
            GameView()
                .previewDisplayName("Dark")
                .preferredColorScheme(.dark)
        }
    }
}
