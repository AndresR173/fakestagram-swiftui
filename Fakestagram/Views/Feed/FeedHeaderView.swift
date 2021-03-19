//
//  FeedHeaderView.swift
//  Fakestagram
//
//  Created by Rubbermaid Laverde on 18/03/21.
//

import SwiftUI

struct FeedHeaderView: View {
    
    var body: some View {
        HStack {
            Image("InstagramTitle")
                .resizable()
                .renderingMode(.template)
                .frame(width: 100, height: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "plus.rectangle")
                    .foregroundColor(.black)
            })
            
            Button(action: {}, label: {
                Image(systemName: "heart")
                    .foregroundColor(.black)
                    .frame(width: 32, height: 32)
            })
            
            Button(action: {}, label: {
                Image(systemName: "paperplane")
                    .foregroundColor(.black)
                    .frame(width: 32, height: 32)
            })
        }
    }
}

struct FeedHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FeedHeaderView()
    }
}
