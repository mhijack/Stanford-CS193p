//
//  GameView.swift
//  Stanford-CS193p
//
//  Created by Jianyuan Chen on 2021-06-23.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel: EmojiMemoryGame
    
    @AppStorage("iconSize") var iconSize = 35.0
    
    @State var data = foodsEmojis
    @State var emojiCount: Int = 16
    
    var body: some View {
        VStack {
            Text("Memorize")
                .font(.system(size: 30))
            
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem(), GridItem()], alignment: .center, spacing: nil, pinnedViews: [], content: {
                    ForEach(viewModel.cards, id: \.id) { card in
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                })
                .animation(nil)
            }
            .padding()
            
            Spacer()
            
            HStack(alignment: .center) {
                vehicleButton
                foodsButton
                sportsButton
            }
        }
        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
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
            GameView(viewModel: EmojiMemoryGame())
                .preferredColorScheme(.light)
            
            GameView(viewModel: EmojiMemoryGame())
                .preferredColorScheme(.dark)
        }
    }
}
