//
//  HomeView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/25.
//

import SwiftUI
import SwiftUIX

struct HomeView: View {
    @State var inputText:String = ""
    var body: some View {
        NavigationView{
            VStack {
                Text("123")
                    
//                Spacer()
            }
            .navigationBarBackgroundColor(#colorLiteral(red: 0.9450980392, green: 0.2352941176, blue: 0.2352941176, alpha: 1))
            .navigationBarTitleView(CustomTitleView(),displayMode: .inline)
        }
        
    }
    
}

struct CustomTitleView: View {
    @State var searchText:String = ""
    var body: some View {
        ZStack {
            GeometryReader { geo in
                SearchBarView().frame(width: geo.size.width - 30, height: 35)
                    .position(x: geo.size.width / 2, y: geo.size.height / 2)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 44)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
