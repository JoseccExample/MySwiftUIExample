//
//  ContentView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        CustomTabView(contents: [
            ("美食",#imageLiteral(resourceName: "icon_nav_food1"),#imageLiteral(resourceName: "icon_nav_food2"),AnyView(HomeView())),
            ("附近",#imageLiteral(resourceName: "icon_nav_nearby1"),#imageLiteral(resourceName: "icon_nav_nearby2"),AnyView(NearbyView())),
            ("收藏",#imageLiteral(resourceName: "icon_nav_collect1"),#imageLiteral(resourceName: "icon_nav_collect2"),AnyView(CollectView())),
            ("问答",#imageLiteral(resourceName: "icon_nav_qa1"),#imageLiteral(resourceName: "icon_nav_qa2"),AnyView(QuestionView())),
            ("我的",#imageLiteral(resourceName: "icon_nav_mine1"),#imageLiteral(resourceName: "icon_nav_mine2"),AnyView(MyView())),
        ], selectColor: .red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



