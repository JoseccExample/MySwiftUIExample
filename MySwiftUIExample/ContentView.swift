//
//  ContentView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var index:Int = 4 {
        didSet {
            print(index)
        }
    }
    var body: some View {
        TabView(selection: $index,
                content:  {
                    HStack{
                        Spacer()
                        Text("Tab Content 1")
                        VStack {
                            Spacer(minLength: 10)
                            Rectangle().frame(width: 5, height: .infinity, alignment: .center)
                            Spacer(minLength: 10)
                        }
                        Text("Tab Content 1")
                        Spacer()
                    }
                        .tabItem {
                            VStack {
                                Image(uiImage: #imageLiteral(resourceName: "icon_nav_food1"))
                                Text("Tab Label 1")
                            }
                        }.tag(1)
                    Text("Tab Content 2")
                        .tabItem {
                            VStack {
                                Image(uiImage: #imageLiteral(resourceName: "icon_nav_nearby1"))
                                Text("Tab Label 1")
                            }
                        }.tag(2)
                    Text("Tab Content 3")
                        .tabItem {
                            VStack {
                                Image(uiImage: #imageLiteral(resourceName: "icon_nav_collect1"))
                                Text("Tab Label 1")
                            }
                        }.tag(2)
                    Text("Tab Content 4")
                        .tabItem {
                            VStack {
                                Image(uiImage: #imageLiteral(resourceName: "icon_nav_qa1"))
                                Text("Tab Label 1")
                            }
                        }.tag(2)
                    Text("Tab Content 4")
                        .tabItem {
                            TabItemView()
                        }.tag(2)
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct TabItemView: View {
//    let title:String
//    let image:UIImage
    
    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName: "icon_nav_mine1"))
            Spacer(minLength: 10)
            Text("Tab Label 1")
        }
    }
}
