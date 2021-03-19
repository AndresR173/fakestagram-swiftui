//
//  PostView.swift
//  Fakestagram
//
//  Created by Rubbermaid Laverde on 18/03/21.
//

import SwiftUI

struct PostView: View {
    
    var screenWidth: CGFloat { return UIScreen.main.bounds.width }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("SampleUser1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("User Name")
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .frame(width: 32, height: 32)
                })
            }
            .padding(.horizontal, 8)
            
            Image("SampleUser1")
                .resizable()
                .scaledToFill()
                .frame(width: screenWidth, height: screenWidth*0.7)
            
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .foregroundColor(.black)
                        .frame(width: 32, height: 32)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "message")
                        .foregroundColor(.black)
                        .frame(width: 32, height: 32)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "paperplane")
                        .foregroundColor(.black)
                        .frame(width: 32, height: 32)
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "bookmark")
                        .foregroundColor(.black)
                        .frame(width: 32, height: 32)
                })
            }
            .padding(.horizontal, 8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("140 Me gusta")
                Text("Este es un mensaje de ejemplo de un post de Instagram")
                    .font(.body)
                    .lineLimit(2)
            }
            .padding(.horizontal, 8)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
