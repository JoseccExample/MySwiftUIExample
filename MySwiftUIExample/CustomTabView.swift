//
//  CustomTabView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/25.
//

import SwiftUI

struct CustomTabView<Content:View>: View {
    let contents:[(title:String, image:UIImage, selectImage:UIImage, content:Content)]
    @State var tabIndex:Int = 1
    var body: some View {
        TabView(selection: $tabIndex) {
            ForEach(0 ..< contents.count) { index in
                contents[index].3
                    .tabItem {
                        TabItemView(title: contents[index].0,
                                    image: contents[index].1,
                                    selectImage: contents[index].2,
                                    index: index,
                                    currentIndex: $tabIndex)
                    }
                    .tag(index)
            }
        }
    }
    
}

extension CustomTabView {
    struct TabItemView: View {
        let title:String
        let image:UIImage
        let selectImage:UIImage
        let index:Int
        @Binding var currentIndex:Int
        var body: some View {
            VStack{
                if (currentIndex == index) {
                    Image(uiImage: selectImage)
                } else {
                    Image(uiImage: image.withRenderingMode(.alwaysTemplate))
                }
                Text(title)
            }
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(contents: [
            ("首页",#imageLiteral(resourceName: "icon_nav_food1"),#imageLiteral(resourceName: "icon_nav_food2"),Text("1")),
            ("首页",#imageLiteral(resourceName: "icon_nav_food1"),#imageLiteral(resourceName: "icon_nav_food2"),Text("2"))
        ])
    }
}
