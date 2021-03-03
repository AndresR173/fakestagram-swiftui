//
//  FeedView.swift
//  Fakestagram
//
//  Created by Andres Felipe Rojas R. on 26/02/21.
//

import SwiftUI

struct FeedView<ViewModel>: View where ViewModel: FeedViewModel {
    @ObservedObject var viewModel: ViewModel
    var body: some View {
        getContent(status: viewModel.status)
    }
}

private func getContent(status: Status) -> some View {
    switch status {
    case .loading:
        return AnyView(ProgressView())
    case .loaded:
        return AnyView(Text("Loaded"))
    case .empty:
        return AnyView(Text("Empty"))
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(viewModel: FeedViewModelImpl())
    }
}
