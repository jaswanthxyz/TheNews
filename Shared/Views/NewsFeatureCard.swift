//
//  NewsCard.swift
//  TheNews
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import URLImage
import SwiftUI

struct NewsFeatureCard: View {
    
    var item: Items
    var myStringArr = "".components(separatedBy: " ")
    var body: some View {
        VStack(alignment: .leading) {
            URLImage(url: URL(string:  item.enclosure!.link!.components(separatedBy: "?")[0])!) { proxy in
                proxy.resizable()
                    .frame(width: 380, height: 350)
                
            }
            Text(item.title!)
                .font(.system(size: 18))
                .foregroundColor(Color(red: 62 / 255, green: 143 / 255, blue: 174 / 255))
                .padding(.bottom, 10)
                .lineLimit(nil)
            Text(item.pubDate!)
                .font(.footnote)
                .foregroundColor(.gray)
            Spacer()
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity, alignment: .center)
        .modifier(CardModifier())
        .padding(.leading, 30)
        .padding(.trailing, 30)
        .padding(.top, 0)
        .padding(.bottom, 0)
    }
}
