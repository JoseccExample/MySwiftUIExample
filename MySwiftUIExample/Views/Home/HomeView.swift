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
            Text("Hello, World!")
                .navigationBarTitleView(CustomTitleView(),displayMode: .inline)
                .navigationBarColor(.red)
        }
        
    }
}

struct CustomTitleView: View {
    var body: some View {
        HStack {
            Text("2344")
                .frame(maxWidth:.infinity)
                
        }.frame(maxWidth:.infinity)
        .background(Color.red)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
