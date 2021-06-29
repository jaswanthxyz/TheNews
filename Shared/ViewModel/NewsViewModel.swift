//
//  NewsViewModel.swift
//  TheNews
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import Combine

class NewsViewModel: ObservableObject {
    @Published var newsItems = ItemsList(items: [])
    @Published var loading = false
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = APIService()) {
        self.service = service
    }
    
    func loadNews() {
        self.loading = true
        service.fetchNews { newsItems in
            self.loading = false
            guard let newsItems = newsItems else {
                return
            }
            self.newsItems = ItemsList(items: newsItems)
        }
    }
}
