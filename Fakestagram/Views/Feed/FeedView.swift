//
//  FeedView.swift
//  Fakestagram
//
//  Created by Andres Felipe Rojas R. on 26/02/21.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var viewModel: FeedViewModel
    
    var body: some View {
            
        VStack(alignment: .leading) {
            
            FeedHeaderView()
                .padding(.horizontal)

            ScrollView {
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    ScrollView(.horizontal) {
                        if viewModel.users.count > 0 {
                            HStack(spacing: 16) {
                                ForEach(viewModel.users) { user in
                                    StoryView(user: user)
                                }
                            }
                            .padding()
                        } else {
                            HStack(spacing: 16) {
                                ForEach(0..<5) { _ in
                                    StoryView()
                                }
                            }
                            .padding()
                        }
                    }
                    
                    VStack(spacing: 24) {
                        ForEach(0..<100) { _ in
                            PostView()
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.getUsers()
        })
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        return FeedView(viewModel: FeedViewModel(dataService: AppDataService()))
    }
}
