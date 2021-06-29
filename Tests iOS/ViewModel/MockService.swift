//
//  MockService.swift
//  Tests iOS
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import Foundation

class MockService : ServiceProtocol {
    let mockData: [Items]?
    
    init(mockData: [Items]?) {
        self.mockData = mockData
    }
    
    func fetchNews(completion: @escaping ([Items]?) -> Void) {
        completion(mockData)
    }
}
