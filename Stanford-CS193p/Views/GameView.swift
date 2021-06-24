//
//  GameView.swift
//  Stanford-CS193p
//
//  Created by Jianyuan Chen on 2021-06-23.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.system(size: 30))
            
            GridView()
            
            HStack(alignment: .center) {
                Button(action: {
                    didTapVehicle()
                }, label: {
                    VStack {
                        Image(systemName: "car")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: .center)
                        Text("Vehicles")
                    }
                })
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    didTapTheme2()
                }, label: {
                    VStack {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: .center)
                        Text("Theme 2")
                    }
                })
                .frame(maxWidth: .infinity)
                
                Button(action: {
                    didTapTheme3()
                }, label: {
                    VStack {
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: .center)
                        Text("Theme 3")
                    }
                })
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
    
    private func didTapVehicle() {
        
    }
    
    private func didTapTheme2() {
        
    }
    
    private func didTapTheme3() {
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
