//
//  NewsDetails.swift
//  TheNews
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import SwiftUI
import URLImage

struct NewsDetails : View {
    var item: Items
    var body: some View {
        VStack(alignment: .leading)  {
            URLImage(url: URL(string:  item.enclosure!.link!.components(separatedBy: "?")[0])!) {proxy in
                proxy.resizable()
                    .frame(width: 400, height: 350)
            }
            Text(item.title!)
                .font(.title)
                .padding()
            
            
            Text(item.content!)
                .padding()
            
            Text(item.pubDate!)
                .font(.footnote)
                .padding()
            
        }.navigationBarTitle(Text(item.title!), displayMode: .inline)
        .padding()
    }
}

