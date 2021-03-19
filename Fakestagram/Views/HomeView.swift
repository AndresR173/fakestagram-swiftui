//
//  Home.swift
//  Fakestagram
//
//  Created by Andres Felipe Rojas R. on 26/02/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            FeedView(viewModel: FeedViewModel(dataService: AppDataService()))
                .tabItem {
                    Image(systemName: "house")
                    Text("Feed")
                }
            Text("View 2")
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
