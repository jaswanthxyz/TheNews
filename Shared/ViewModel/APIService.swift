//
//  APIService.swift
//  TheNews
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import Alamofire
import Foundation

class APIService : ServiceProtocol {
    
    func fetchNews(completion: @escaping ([Items]?) -> Void) {
        loadNews(completion)
    }
    
    private func loadNews(_ completion: @escaping ([Items]?) -> Void) {
        guard let url = URL(string: "https://api.rss2json.com/v1/api.json?rss_url=http://www.abc.net.au/news/feed/51120/rss.xml") else { return }
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let news = try? JSONDecoder().decode(NewsResponse.self, from: data) else {
                completion(nil)
                return
            }
            DispatchQueue.main.async {
                completion(news.items)
                print(news.items)
            }
        }.resume()
    }
}
