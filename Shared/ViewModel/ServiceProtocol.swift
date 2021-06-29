//
//  ServiceProtocol.swift
//  TheNews
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import Foundation

protocol ServiceProtocol {
    func fetchNews(completion: @escaping ([Items]?) -> Void)
}
