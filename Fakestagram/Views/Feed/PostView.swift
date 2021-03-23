//
//  PostView.swift
//  Fakestagram
//
//  Created by Rubbermaid Laverde on 18/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    
    let post: Post
    
    var screenWidth: CGFloat { return UIScreen.main.bounds.width }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                WebImage(url: URL(string: post.user.picture.thumbnail))
                    .resizable()
                    .indicator(.activity)
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("\(post.user.name.firstName) \(post.user.name.lastName)")
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .frame(width: 32, height: 32)
                })
            }
            .padding(.horizontal, 8)
            
            WebImage(url: URL(string: post.image))
                .resizable()
                .scaledToFit()
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
                Text("\(post.likes) Me gusta")
                Text(post.message)
                    .font(.body)
                    .lineLimit(2)
            }
            .padding(.horizontal, 8)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(user: User(name: Name(firstName: "Rubbermaid", lastName: "Laverde"), picture: Picture(large: "", thumbnail: "https://randomuser.me/api/portraits/thumb/men/6.jpg")), image: "https://picsum.photos/600?image=145", likes: 43, message: "River Plate ganó la libertadores 2018 en Madrid ante su clásico rival"))
    }
}
