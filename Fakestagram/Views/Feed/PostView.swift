//
//  PostView.swift
//  Fakestagram
//
//  Created by Rubbermaid Laverde on 18/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    
    let user: User
    
    var screenWidth: CGFloat { return UIScreen.main.bounds.width }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                WebImage(url: user.urlImageThumbnail)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("\(user.name.firstName) \(user.name.lastName)")
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .frame(width: 32, height: 32)
                })
            }
            .padding(.horizontal, 8)
            
            WebImage(url: user.urlImagePost)
                .resizable()
                .frame(width: screenWidth, height: screenWidth*0.7)
                .scaledToFill()
            
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
                Text("\(user.likes ?? 0) Me gusta")
                Text(user.message ?? "")
                    .font(.body)
                    .lineLimit(2)
            }
            .padding(.horizontal, 8)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(user: User.mockUsers[0])
    }
}
