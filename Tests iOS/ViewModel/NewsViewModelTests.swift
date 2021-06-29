//
//  NewsViewModelTests.swift
//  Tests iOS
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import XCTest

class NewsViewModelTests: XCTestCase {
    
    func testSuccessFetchData() {
        let decoder = JSONDecoder()
        let jsonString = "{\n" +
            "      \"title\": \"Perth and Peel plunged into lockdown after another local coronavirus case detected\",\n" +
            "      \"pubDate\": \"2021-06-28 12:13:05\",\n" +
            "      \"link\": \"https://www.abc.net.au/news/2021-06-28/wa-coronavirus-perth-peel-hard-lockdown/100250920\",\n" +
            "      \"guid\": \"https://www.abc.net.au/news/2021-06-28/wa-coronavirus-perth-peel-hard-lockdown/100250920\",\n" +
            "      \"author\": \"\",\n" +
            "      \"thumbnail\": \"https://live-production.wcms.abc-cdn.net.au/9ac8c8dcf33c8024416b8a108d1768de?impolicy=wcms_crop_resize&amp;cropH=3333&amp;cropW=2500&amp;xPos=1578&amp;yPos=0&amp;width=862&amp;height=1149\",\n" +
            "      \"description\": \"Western Australia records a further positive case of COVID-19 and effective from midnight, Perth and Peel will enter a four-day hard lockdown. \",\n" +
            "      \"content\": \"Western Australia records a further positive case of COVID-19 and effective from midnight, Perth and Peel will enter a four-day hard lockdown. \",\n" +
            "      \"enclosure\": {\n" +
            "        \"link\": \"https://live-production.wcms.abc-cdn.net.au/9ac8c8dcf33c8024416b8a108d1768de?impolicy=wcms_crop_resize&amp;cropH=2813&amp;cropW=5000&amp;xPos=0&amp;yPos=60&amp;width=862&amp;height=485\",\n" +
            "        \"type\": \"image/jpeg\",\n" +
            "        \"thumbnail\": \"https://live-production.wcms.abc-cdn.net.au/9ac8c8dcf33c8024416b8a108d1768de?impolicy=wcms_crop_resize&amp;cropH=3333&amp;cropW=2500&amp;xPos=1578&amp;yPos=0&amp;width=862&amp;height=1149\"\n" +
            "      },\n" +
            "      \"categories\": [\n" +
            "        \"COVID-19\",\n" +
            "        \"State and Territory Government\",\n" +
            "        \"Lockdown\"\n" +
            "      ]\n" +
            "    }";
        
        do {
            let expectedList = try decoder.decode([Items].self, from: Data(jsonString.utf8))
            let service = MockService(mockData: expectedList)
            
            let viewModel = NewsViewModel(service: service)
            
            
            viewModel.loadNews()
            
            XCTAssertTrue(!viewModel.loading)
            XCTAssertEqual(viewModel.newsItems.items.count, 1)
        } catch {
            print(error.localizedDescription)
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
