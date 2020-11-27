//
//  HomeView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/25.
//

import SwiftUI
import SwiftUIX

struct HomeView: View {
    @State var banners:[SwiftUIApi.Banner.Model] = [] {
        didSet {
            self.bannerModel.urls = banners.compactMap({$0.bannerImg})
        }
    }
    @ObservedObject var bannerModel:FSPagerBannerView.BannerModel = FSPagerBannerView.BannerModel()
    var body: some View {
        NavigationView{
            VStack(spacing:0) {
                FSPagerBannerView(bannerModel: bannerModel, cornerRadius: 15)
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
                    .frame(height:pagerSize().height)
                Spacer()
            }
            .navigationBarBackgroundColor(#colorLiteral(red: 0.9450980392, green: 0.2352941176, blue: 0.2352941176, alpha: 1))
            .navigationBarTitleView(CustomTitleView(),displayMode: .inline)
        }.onAppear(perform: {
            SwiftUIApi.Banner.request { (models) in
                guard let models = models else {
                    return
                }
                self.banners = models
            } failure: { (code, message) in
                
            }

        })
    }
    
    
    /// 获取首页Banner的大小
    /// - Returns: CGSize
    func pagerSize() -> CGSize {
        let screenSize = UIScreen.main.bounds.size
        let width = screenSize.width - 30
        let height = (width / 345) * 100
        return CGSize(width: width, height: height)
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
