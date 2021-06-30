//
//  NewsViewModelTests.swift
//  Tests iOS
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import XCTest

class NewsViewModelTests: XCTestCase {
    
    let jsonString = """
        {
          "status": "ok",
          "feed": {
            "url": "http://www.abc.net.au/news/feed/51120/rss.xml",
            "title": "Just In",
            "link": "https://www.abc.net.au/news/justin/",
            "author": "",
            "description": "",
            "image": "https://www.abc.net.au/news/image/8413416-1x1-144x144.png"
          },
          "items": [
            {
              "title": "Perth and Peel plunged into lockdown after another local coronavirus case detected",
              "pubDate": "2021-06-28 12:13:05",
              "link": "https://www.abc.net.au/news/2021-06-28/wa-coronavirus-perth-peel-hard-lockdown/100250920",
              "guid": "https://www.abc.net.au/news/2021-06-28/wa-coronavirus-perth-peel-hard-lockdown/100250920",
              "author": "",
              "thumbnail": "https://live-production.wcms.abc-cdn.net.au/9ac8c8dcf33c8024416b8a108d1768de?impolicy=wcms_crop_resize&amp;cropH=3333&amp;cropW=2500&amp;xPos=1578&amp;yPos=0&amp;width=862&amp;height=1149",
              "description": "Western Australia records a further positive case of COVID-19 and effective from midnight, Perth and Peel will enter a four-day hard lockdown. ",
              "content": "Western Australia records a further positive case of COVID-19 and effective from midnight, Perth and Peel will enter a four-day hard lockdown. ",
              "enclosure": {
                "link": "https://live-production.wcms.abc-cdn.net.au/9ac8c8dcf33c8024416b8a108d1768de?impolicy=wcms_crop_resize&amp;cropH=2813&amp;cropW=5000&amp;xPos=0&amp;yPos=60&amp;width=862&amp;height=485",
                "type": "image/jpeg",
                "thumbnail": "https://live-production.wcms.abc-cdn.net.au/9ac8c8dcf33c8024416b8a108d1768de?impolicy=wcms_crop_resize&amp;cropH=3333&amp;cropW=2500&amp;xPos=1578&amp;yPos=0&amp;width=862&amp;height=1149"
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
    
    func testSuccessFetchDataAndParsing() {
        
        let decoder = JSONDecoder()
        
        
        do {
            print("here")
            let data = Data(jsonString.utf8)
            let expectedList = try decoder.decode(NewsResponse.self, from: data)
            let service = MockService(mockData: expectedList.items)
            
            let viewModel = NewsViewModel(service: service)
            
            viewModel.loadNews()
            
            XCTAssertTrue(!viewModel.loading)
            XCTAssertEqual(viewModel.newsItems.items.count, 1)

        } catch {
            print(error.localizedDescription)
            print(String(describing: error))
            XCTFail(String(describing: error))
        }
    }
    
    func testSuccessParsing() {
        
        let decoder = JSONDecoder()
        
        
        do {
            let data = Data(jsonString.utf8)
            let expectedList = try decoder.decode(NewsResponse.self, from: data)
            XCTAssertEqual(expectedList.items!.count, 1)
            XCTAssertEqual(expectedList.items![0].categories!.count, 3)
            XCTAssertEqual(expectedList.feed!.link, "https://www.abc.net.au/news/justin/")
            XCTAssertNotNil(expectedList.items![0].enclosure?.link)
            

        } catch {
            print(error.localizedDescription)
            print(String(describing: error))
            XCTFail(String(describing: error))
        }
    }
    
    func testEmptyData() {
        let expectedList = [Items]()
        let service = MockService(mockData: expectedList)
        
        let viewModel = NewsViewModel(service: service)
        
        
        viewModel.loadNews()
        
        XCTAssertTrue(!viewModel.loading)
        XCTAssertEqual(viewModel.newsItems.items.count, 0)
    }
    
    func testNilData() {
        let expectedList: [Items]? = nil
        let service = MockService(mockData: expectedList)
        
        let viewModel = NewsViewModel(service: service)
        
        
        viewModel.loadNews()
        
        XCTAssertTrue(!viewModel.loading)
        XCTAssertEqual(viewModel.newsItems.items.count, 0)
    }
    
}
