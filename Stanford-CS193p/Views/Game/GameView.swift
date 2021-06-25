//
//  GameView.swift
//  Stanford-CS193p
//
//  Created by Jianyuan Chen on 2021-06-23.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var game: EmojiMemoryGame
    
    @AppStorage("iconSize") var iconSize = 35.0
    
    @State var data = foodsEmojis
    @State var emojiCount: Int = 16
    
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            CardView(card)
                .onTapGesture {
                    game.choose(card)
                }
                .padding(5)
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
}

extension GameView {
    
    private func setTheme(_ theme: Theme) {
        var data: [String] = []
        switch theme {
        case .vehicle:
            data = vehicleEmojis.shuffled()
        case .food:
            data = foodsEmojis.shuffled()
        case .sport:
            data = sportsEmojis.shuffled()
        }
        self.data = data
    }
    
    @ViewBuilder
    private var vehicleButton: some View {
        Button(action: {
            setTheme(.vehicle)
        }, label: {
            VStack {
                Image(systemName: "car")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(iconSize), height: CGFloat(iconSize), alignment: .center)
            }
        })
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private var foodsButton: some View {
        Button(action: {
            setTheme(.food)
        }, label: {
            VStack {
                Image(systemName: "hare")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(iconSize), height: CGFloat(iconSize), alignment: .center)
            }
        })
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private var sportsButton: some View {
        Button(action: {
            setTheme(.sport)
        }, label: {
            VStack {
                Image(systemName: "sportscourt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(iconSize), height: CGFloat(iconSize), alignment: .center)
            }
        })
        .frame(maxWidth: .infinity)
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView(game: EmojiMemoryGame())
                .preferredColorScheme(.light)
                .previewDevice("iPhone SE (2nd generation")
            
            GameView(game: EmojiMemoryGame())
                .preferredColorScheme(.dark)
        }
    }
}
