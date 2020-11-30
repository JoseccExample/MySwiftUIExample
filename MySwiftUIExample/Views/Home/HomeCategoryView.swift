//
//  HomeCategoryView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/29.
//

import SwiftUI

struct HomeCategoryView: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem(),GridItem()]) {
            ForEach(0 ..< 10) { index in
                Rectangle()
                    .frame(width:44, height: 42)
            }
        }
    }
}

struct HomeCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategoryView().previewLayout(.fixed(width: 300, height: 100))
        
    }
}
