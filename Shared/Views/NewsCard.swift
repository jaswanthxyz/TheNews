//
//  NewsCard.swift
//  TheNews
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import URLImage
import SwiftUI

struct NewsCard: View {
    
    var item: Items
    var myStringArr = "".components(separatedBy: " ")
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(item.title!)
                    .font(.system(size: 18))
                    .foregroundColor(Color(red: 62 / 255, green: 143 / 255, blue: 174 / 255))
                    .padding(.bottom, 10)
                Text(item.pubDate!)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            Spacer()
            URLImage(url: URL(string:  item.enclosure!.link!.components(separatedBy: "?")[0])!) { proxy in
                proxy.resizable()
                    .frame(width: 100, height: 100)
                
            }
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .modifier(CardModifier())
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .padding(.top, 10)
        .padding(.bottom, 10)

    }
}
