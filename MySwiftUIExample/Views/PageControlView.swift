//
//  PageControlView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/27.
//

import SwiftUI

struct PageControlView: View {
    var pageCount:Int = 0
    @Binding var currentIndex:Int
    var pageColor:UIColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 0.5)
    var currentPageColor:UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    var pageHeight:CGFloat = 4
    var body: some View {
        HStack(spacing:3) {
            ForEach(0 ..< pageCount, id: \.self) { index in
                RoundedRectangle(cornerRadius: pageHeight / 2)
                    .foregroundColor(Color(pageCorlor(index: index)))
                    .frame(width:pageHeight, height:pageHeight)
            }
        }.fixedSize()
    }
    
    func pageCorlor(index:Int) -> UIColor {
        return currentIndex == index ? currentPageColor : pageColor
    }
}

struct PageControlView_Previews: PreviewProvider {
    @State static var currentIndex:Int = 0
    static var previews: some View {
        PageControlView(pageCount: 4, currentIndex: $currentIndex, pageHeight: 100).previewLayout(.sizeThatFits)
            .background(.red)
    }
}
