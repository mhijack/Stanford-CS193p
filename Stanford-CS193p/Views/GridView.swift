//
//  GridView.swift
//  Stanford-CS193p
//
//  Created by Jianyuan Chen on 2021-06-23.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        VStack {
            HStack {
                CardView()
                CardView()
                CardView()
                CardView()
            }
            
            HStack {
                CardView()
                CardView()
                CardView()
                CardView()
            }
            
            HStack {
                CardView()
                CardView()
                CardView()
                CardView()
            }
            
            HStack {
                CardView()
                CardView()
                CardView()
                CardView()
            }
        }
        .padding()
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
