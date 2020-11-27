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
    var pageColor:UIColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    var currentPageColor:UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var pageHeight:CGFloat = 4
    var body: some View {
        HStack(spacing:3) {
            ForEach(0 ..< pageCount) { index in
                RoundedRectangle(cornerRadius: pageHeight / 2)
                    .foregroundColor(Color(pageCorlor(index: index)))
                    .frame(width:pageHeight, height:pageHeight)
            }
        }
    }
    
    func pageCorlor(index:Int) -> UIColor {
        return currentIndex == index ? currentPageColor : pageColor
    }
}

struct PageControlView_Previews: PreviewProvider {
    static var previews: some View {
        PageControlView(pageCount: 4, pageHeight: 4).previewLayout(.sizeThatFits)
    }
}
