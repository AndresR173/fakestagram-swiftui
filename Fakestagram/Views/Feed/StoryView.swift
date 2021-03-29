//
//  StoryView.swift
//  Fakestagram
//
//  Created by Rubbermaid Laverde on 12/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct StoryView: View {
    
    var user: User
    
    var body: some View {
        VStack {
            WebImage(url: user.urlImageThumbnail)
                .resizable()
                .clipShape(Circle())
                .shadow(color: .black, radius: 6, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .frame(width: 100, height: 100)
            
            Text(user.name.firstName + " " + user.name.lastName)
                .lineLimit(1)
                .font(.system(size: 14))
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(user: User.mockUsers[0])
    }
}
