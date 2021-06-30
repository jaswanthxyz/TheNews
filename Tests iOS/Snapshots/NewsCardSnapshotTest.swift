//
//  NewsCardSnapshotTest.swift
//  Tests iOS
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import XCTest
import SnapshotTesting
import SwiftUI

class NewsCardSnapshotTest: XCTestCase {
    
    func testNewsCardSnapshot() throws {
        
        let decoder = JSONDecoder()
        let jsonString = """
            {
              "status": "ok",
              "feed": {
                "url": "http://www.abc.net.au/news/feed/51120/rss.xml",
                "title": "Just In",
                "link": "https://www.abc.net.au/news/justin/",
                "author": "",
                "description": "",
                "image": "https://via.placeholder.com/150/0000FF/808080?Text=TheNews"
              },
              "items": [
                {
                  "title": "Perth and Peel plunged into lockdown after another local coronavirus case detected",
                  "pubDate": "2021-06-28 12:13:05",
                  "link": "https://www.abc.net.au/news/2021-06-28/wa-coronavirus-perth-peel-hard-lockdown/100250920",
                  "guid": "https://www.abc.net.au/news/2021-06-28/wa-coronavirus-perth-peel-hard-lockdown/100250920",
                  "author": "",
                  "thumbnail": "https://via.placeholder.com/150/0000FF/808080?Text=TheNews",
                  "description": "Western Australia records a further positive case of COVID-19 and effective from midnight, Perth and Peel will enter a four-day hard lockdown. ",
                  "content": "Western Australia records a further positive case of COVID-19 and effective from midnight, Perth and Peel will enter a four-day hard lockdown. ",
                  "enclosure": {
                    "link": "https://via.placeholder.com/150/0000FF/808080?Text=TheNews",
                    "type": "image/jpeg",
                    "thumbnail": "https://via.placeholder.com/150/0000FF/808080?Text=TheNews"
                  },
                  "categories": [
                    "COVID-19",
                    "State and Territory Government",
                    "Lockdown"
                  ]
                },
              ]
            }
            """
        
        do {
            let data = Data(jsonString.utf8)
            let expectedList = try decoder.decode(NewsResponse.self, from: data)
            let subject = NewsCard(item: expectedList.items![0])
            let text = try subject.inspect().hStack().vStack(0).text(0).string()
            assertSnapshot(matching: subject.toVC(), as: .image)
            
        } catch {
            print(error.localizedDescription)
            print(String(describing: error))
            XCTFail(String(describing: error))
        }
    }
    
}
