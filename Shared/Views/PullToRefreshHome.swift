//
//  PullToRefreshList.swift
//  TheNews
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import SwiftUI

struct PullToRefreshHome: View {
    @ObservedObject var viewmodel = NewsViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                RefreshControl(coordinateSpace: .named("RefreshControl")) {
                    self.viewmodel.loadNews()
                }
                if (viewmodel.newsItems.items.count > 0) {
                    ScrollView(.vertical) {
                        VStack(spacing: 10) {
                            ForEach(Array(viewmodel.newsItems.items.enumerated()), id: \.1.id) { (index, news) in
                                NavigationLink(destination: NewsDetails(item: news)){
                                    if(index == 0) {
                                        NewsFeatureCard(item: news)
                                        
                                    }else {
                                        NewsCard(item: news)
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                    
                } else {
                    VStack(alignment: .center) {
                        Text("No News or error")
                    }
                }
            }.coordinateSpace(name: "RefreshControl")
            .navigationBarTitle(Text("News"))
            
        }
        .onAppear {
            self.viewmodel.loadNews()
        }
    }
}

struct PullToRefreshHome_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefreshHome()
    }
}
