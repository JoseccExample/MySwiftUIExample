//
//  CustomTabView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/25.
//

import SwiftUI
/// 自定义的Tab
struct CustomTabView<Content:View>: View {
    ///需要展示的内容元祖数组
    /// - Parameter title: 显示标题
    /// - Parameter image: 默认的显示图片
    /// - Parameter selectImage: 选中的图片 图片颜色将由`selectColor`设置
    /// - Parameter content: 对应的内容试图
    let contents:[(title:String, image:UIImage, selectImage:UIImage, content:Content)]
    /// 设置选中图片的前景色
    let selectColor:UIColor
    @State var tabIndex:Int = 0
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
        }.accentColor(Color(selectColor))
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
        ], selectColor: .red)
    }
}
