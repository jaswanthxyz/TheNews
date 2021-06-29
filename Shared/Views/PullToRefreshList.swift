//
//  PullToRefreshList.swift
//  TheNews
//
//  Created by Jaswanth Manigundan on 30/6/21.
//

import SwiftUI

struct RefreshControl: View {
    var coordinateSpace: CoordinateSpace
    var onRefresh: ()->Void
    @State var refresh: Bool = false
    var body: some View {
        GeometryReader { geo in
            if (geo.frame(in: coordinateSpace).midY > 150) {
                Spacer()
                    .onAppear {
                        if refresh == false {
                            onRefresh() ///call refresh once if pulled more than 50px
                        }
                        refresh = true
                    }
            } else if (geo.frame(in: coordinateSpace).maxY < 1) {
                Spacer()
                    .onAppear {
                        refresh = false
                        ///reset  refresh if view shrink back
                    }
            }
            ZStack(alignment: .center) {
                if refresh { ///show loading if refresh called
                    ActivityIndicator(color: Color.blue, size: 20)
                } else { ///mimic static progress bar with filled bar to the drag percentage
                    ForEach(0..<8) { tick in
                        VStack {
                            Rectangle()
                                .fill(Color(UIColor.tertiaryLabel))
                                .opacity((Int((geo.frame(in: coordinateSpace).midY)/7) < tick) ? 0 : 1)
                                .frame(width: 3, height: 7)
                                .cornerRadius(3)
                            Spacer()
                        }.rotationEffect(Angle.degrees(Double(tick)/(8) * 360))
                    }.frame(width: 20, height: 20, alignment: .center)
                }
            }.frame(width: geo.size.width)
        }.padding(.top, -180)
    }
}

struct PullToRefreshList: View {
    @ObservedObject var viewmodel = NewsViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                RefreshControl(coordinateSpace: .named("RefreshControl")) {
                    self.viewmodel.loadNews()
                }
                if (viewmodel.newsItems.items.count > 0) {
                    VStack(spacing: 10) {
                        ForEach(Array(viewmodel.newsItems.items.enumerated()), id: \.1.id) { (index, news) in
                            NavigationLink(destination: NewsDetails(item: news)){
                                if(index == 0) {
                                    NewsFeatureCard(item: news)                                    
                                }else {
                                    NewsCard(item: news)
                                }
                            }
                            
                        }
//                        .frame(maxWidth: .infinity)
                    }
                    
                } else {
                    VStack(alignment: .center) {
                        Text("No News or error")
                    }
                }
            }.coordinateSpace(name: "RefreshControl")
            .navigationBarTitle(Text("News"))
            
        }
        .onAppear {
            self.viewmodel.loadNews()
        }
    }
}

struct PullToRefreshDemo_Previews: PreviewProvider {
    static var previews: some View {
        PullToRefreshList()
    }
}
