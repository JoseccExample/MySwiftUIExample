//
//  PageControlView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/27.
//

import SwiftUI

struct PageControlView: View {
    @State var pageCount:Int = 0
    @State var currentIndex:Int = 0
    var pageColor:UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var currentPageColor:UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var body: some View {
        HStack(spacing:3) {
            ForEach(0 ..< pageCount) { index in
                RoundedRectangle(cornerRadius: 2)
                    .background(.blue)
                    .frame(width:4, height:4)
            }
        }.foregroundColor(.clear)
    }
    
}

struct PageControlView_Previews: PreviewProvider {
    static var previews: some View {
        PageControlView(pageCount: 4).previewLayout(.sizeThatFits)
    }
}
