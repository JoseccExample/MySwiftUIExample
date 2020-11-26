//
//  SearchBarView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/26.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.9647058824, blue: 0.968627451, alpha: 1)))
            HStack {
                Image(systemName: .magnifyingglass)
                    .foregroundColor(Color(#colorLiteral(red: 0.4156862745, green: 0.4156862745, blue: 0.4156862745, alpha: 1)))
                Text("搜索店铺")
                    .font(Font.system(size: 16))
                    .foregroundColor(Color(#colorLiteral(red: 0.4156862745, green: 0.4156862745, blue: 0.4156862745, alpha: 1)))
                Spacer()
            }
            .offset(CGSize(width: 15, height: 0))
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView().previewLayout(.fixed(width: 300, height: 40))
    }
}
