//
//  GameView.swift
//  Stanford-CS193p
//
//  Created by Jianyuan Chen on 2021-06-23.
//

import SwiftUI

let emojis = ["🥖", "🍔", "🍣", "🍱", "🍿", "🍜", "🍥", "🍤", "🦀", "🐖", "🐠", "🌶", "🧄", "🍓", "🥝", "🥑"]

struct GameView: View {
    
    @AppStorage("iconSize") var iconSize = 40.0
    
    @State var data = emojis
    @State var emojiCount: Int = 4
    
    var body: some View {
        VStack {
            Text("Memorize")
                .font(.system(size: 30))
            
            GridView(data: data, emojiCount: emojiCount)
            
            Spacer()
            
            HStack(alignment: .center) {
                minusButton
                
                shuffleButton
                
                addButton
            }
        }
        .padding()
    }
    
    var addButton: some View {
        Button(action: {
            add()
        }, label: {
            VStack {
                Image(systemName: "plus.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(iconSize), height: CGFloat(iconSize), alignment: .center)
            }
        })
        .frame(maxWidth: .infinity)
        .disabled(emojiCount >= emojis.count)
    }
    
    var shuffleButton: some View {
        Button(action: {
            shuffle()
        }, label: {
            VStack {
                Text("Shuffle")
                    .font(.headline)
            }
        })
        .frame(maxWidth: .infinity)
    }
    
    var minusButton: some View {
        Button(action: {
            minus()
        }, label: {
            VStack {
                Image(systemName: "minus.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: CGFloat(iconSize), height: CGFloat(iconSize), alignment: .center)
            }
        })
        .disabled(emojiCount <= 1)
        .frame(maxWidth: .infinity)
    }
    
    private func add() {
        guard emojiCount <= emojis.count - 1 else {
            return
        }
        emojiCount += 1
    }
    
    private func shuffle() {
        
    }
    
    private func minus() {
        guard emojiCount >= 1 else {
            return
        }
        emojiCount -= 1
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView()
                .preferredColorScheme(.light)
            
            GameView()
                .preferredColorScheme(.dark)
        }
    }
}
