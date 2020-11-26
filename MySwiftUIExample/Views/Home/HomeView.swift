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
        ZStack {
            NavigationView{
                Text("Hello, World!")
                    .background(Color.red)
                    .frame(maxWidth: .infinity)
                    .navigationBarColor(.blue)
                    .navigationBarTitleView(CustomTitleView(),displayMode: .inline)
            }
        }
        
    }
    
    init() {
        UINavigationBar.appearance().backgroundColor = .red
    }
}

struct CustomTitleView: View {
    @State var searchText:String = ""
    var body: some View {
        SearchBar(text: $searchText)
            .frame(width: .infinity, height: .infinity)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
