//
//  FSPagerUIView.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/27.
//

import SwiftUI
import FSPagerView
//import Kingfisher

/// FSPagerView To SwiftUI
public struct FSPagerUIView: UIViewRepresentable {
    public typealias UIViewType = FSPagerView
    public typealias WillDisplay = (Int) -> Void
    public typealias DidSelectItemAt = (Int) -> Void
    public var cornerRadius:CGFloat = 0
    public var urls:[String] = []
    public var willDisplay:WillDisplay?
    public var didSelectItemAt:DidSelectItemAt?
    public func makeUIView(context: Context) -> FSPagerView {
        let view = FSPagerView()
        view.isInfinite = true
        view.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        view.dataSource = context.coordinator
        view.delegate = context.coordinator
        view.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "\(FSPagerViewCell.self)")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        return view
    }
    public func updateUIView(_ uiView: FSPagerView, context: Context) {
        context.coordinator.view = self
        uiView.reloadData()
    }
    
    public func makeCoordinator() -> FSPagerUIViewCoordinator {
        return FSPagerUIViewCoordinator(view: self)
    }
}

public class FSPagerUIViewCoordinator:NSObject ,FSPagerViewDataSource {
    var view:FSPagerUIView
    init(view:FSPagerUIView) {
        self.view = view
    }
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return view.urls.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "\(FSPagerViewCell.self)", at: index)
        cell.imageView?.loadImage(urlString: view.urls[index])
        return cell
    }
    
    
}

extension FSPagerUIViewCoordinator: FSPagerViewDelegate {
    public func pagerView(_ pagerView: FSPagerView, willDisplay cell: FSPagerViewCell, forItemAt index: Int) {
        view.willDisplay?(index)
    }
    
    public func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        view.didSelectItemAt?(index)
    }
}

struct FSPagerBannerView: View {
    @StateObject var bannerModel:BannerModel
    var cornerRadius:CGFloat = 0
    @State var currentIndex:Int = 0
    public var didSelectItemAt:FSPagerUIView.DidSelectItemAt?
    var body: some View {
        ZStack {
            FSPagerUIView(cornerRadius: 15,
                          urls: bannerModel.urls,
                          willDisplay:  { (index) in
                            self.currentIndex = index
                          },
                          didSelectItemAt: self.didSelectItemAt)
                          
            VStack {
                Spacer()
                PageControlView(pageCount: bannerModel.count, currentIndex: $currentIndex)
                    .background(.clear)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
        }
    }
}

extension FSPagerBannerView {
    /// Banner的数据
    class BannerModel: ObservableObject {
        /// Banner图片的URL数组
        @Published var urls:[String] {
            didSet {
                self.count = urls.count
            }
        }
        /// Banner的数量
        @Published private(set) var count:Int
        init(urls:[String] = []) {
            self.urls = urls
            self.count = urls.count
        }
    }
}

struct FSPagerUIView_Previews: PreviewProvider {
    static var urls:[String] = [
        "http://pineal-ai-oss.oss-cn-hongkong.aliyuncs.com/article/image/dc68d8e5d17845b3850dc16f56277522.png",
        "http://pineal-ai-oss.oss-cn-hongkong.aliyuncs.com/article/image/dc68d8e5d17845b3850dc16f56277522.png"
    ]
    static var previews: some View {
        FSPagerBannerView(bannerModel: FSPagerBannerView.BannerModel(urls: urls))
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
