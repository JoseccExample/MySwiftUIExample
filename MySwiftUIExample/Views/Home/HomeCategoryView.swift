//
//  HomeCategoryView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/29.
//

import SwiftUI

struct HomeCategoryView: View {
    var body: some View {
        LazyHGrid(rows: [GridItem(.fixed(0), spacing: 0, alignment: .center)], spacing:27) {
            Text("Placeholder")
            Text("Placeholder")
            Text("Placeholder")
            Text("Placeholder")
            Text("Placeholder")
        }
    }
}

struct HomeCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategoryView().previewLayout(.fixed(width: 300, height: 100))
        
    }
}
