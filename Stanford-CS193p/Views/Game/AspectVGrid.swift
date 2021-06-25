//
//  AspectVGrid.swift
//  Stanford-CS193p
//
//  Created by Jack Chen on 2021-06-25.
//

import SwiftUI

struct AspectVGrid<I, ItemView>: View where I: Identifiable, ItemView: View {
    
    var items: [I]
    var aspectRatio: CGFloat
    var content: (I) -> ItemView
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let width: CGFloat = widthThatFits(itemCount: items.count, in: geometry.size, itemAspectRatio: aspectRatio)
                LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0, content: {
                    ForEach(items, id: \.id) { item in
                        content(item).aspectRatio(aspectRatio, contentMode: .fit)
                    }
                })
            }
            Spacer(minLength: 0)
        }
    }
    
    init(items: [I], aspectRatio: CGFloat, content: @escaping (I) -> (ItemView)) {
        self.items = items
        self.aspectRatio = aspectRatio
        self.content = content
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItem = GridItem(.adaptive(minimum: width))
        gridItem.spacing = 0
        return gridItem
    }
    
    private func widthThatFits(itemCount: Int, in size: CGSize, itemAspectRatio: CGFloat) -> CGFloat {
        var columnCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columnCount)
            let itemHeight = itemWidth / itemAspectRatio
            if CGFloat(rowCount) * itemHeight < size.height {
                break
            }
            columnCount += 1
            rowCount = (itemCount + (columnCount - 1)) / columnCount
        } while columnCount < itemCount
        if columnCount > itemCount {
            columnCount = itemCount
        }
        return floor(size.width / CGFloat(columnCount))
    }
}

struct AspectVGrid_Previews: PreviewProvider {
    
    @ViewBuilder
    static var previews: some View {
        AspectVGrid(items: MemoryGame<String>(numberOfPairsOfCards: 6) { index in
            return EmojiMemoryGame.emojis[index]
        }.cards, aspectRatio: 2/3) { card in
            CardView(card).aspectRatio(2/3, contentMode: .fit)
        }
    }
}
