/*
 Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar
 
 */

import Foundation
struct Items : Codable, Identifiable {
    let id = UUID()
    let title : String?
    let pubDate : String?
    let link : String?
    let guid : String?
    let author : String?
    let thumbnail : String?
    let description : String?
    let content : String?
    let enclosure : Enclosure?
    let categories : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case title = "title"
        case pubDate = "pubDate"
        case link = "link"
        case guid = "guid"
        case author = "author"
        case thumbnail = "thumbnail"
        case description = "description"
        case content = "content"
        case enclosure = "enclosure"
        case categories = "categories"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        let pubDateStr = try values.decodeIfPresent(String.self, forKey: .pubDate)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd HH':'mm':'ss"
        let date = dateFormatter.date(from: pubDateStr!)
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy h:mm a"
        dateFormatterPrint.amSymbol = "AM"
        dateFormatterPrint.pmSymbol = "PM"
        pubDate = dateFormatterPrint.string(from: date!)
        
        link = try values.decodeIfPresent(String.self, forKey: .link)
        guid = try values.decodeIfPresent(String.self, forKey: .guid)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        content = try values.decodeIfPresent(String.self, forKey: .content)
        enclosure = try values.decodeIfPresent(Enclosure.self, forKey: .enclosure)
        categories = try values.decodeIfPresent([String].self, forKey: .categories)
    }
    
}
