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
    public typealias Coordinator = FSPagerUIViewCoordinator
    private var cornerRadius:CGFloat = 0
    private var urls:[String] = []
    
    public func makeUIView(context: Context) -> FSPagerView {
        print("makeUIView \(type(of: context))")
        let view = FSPagerView()
        view.isInfinite = true
        view.backgroundColor = .gray
        view.dataSource = context.coordinator
        view.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "\(FSPagerViewCell.self)")
        view.layer.masksToBounds = true
        view.layer.cornerRadius = cornerRadius
        return view
    }
    public func updateUIView(_ uiView: FSPagerView, context: Context) {
        print("updateUIView \(uiView)")
        context.coordinator.urls = urls
        uiView.reloadData()
    }
    
    public func makeCoordinator() -> FSPagerUIViewCoordinator {
        print("makeCoordinator")
        return FSPagerUIViewCoordinator()
    }
    
    public func cornerRadius(cornerRadius:CGFloat) -> Self {
        var view = self
        view.cornerRadius = cornerRadius
        return view
    }
    
    public func urls(urls:[String]) -> Self {
        var v = self
        v.urls = urls
        return v
    }
}

public class FSPagerUIViewCoordinator:NSObject ,FSPagerViewDataSource {
    var urls:[String] = []
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return urls.count
    }
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "\(FSPagerViewCell.self)", at: index)
        cell.imageView?.loadImage(urlString: urls[index])
        return cell
    }
}

struct FSPagerControlUIView: UIViewRepresentable {
    typealias UIViewType = FSPageControl
    let numberOfPages:Int
    func makeUIView(context: Context) -> FSPageControl {
        let control = FSPageControl(frame: .zero)
        control.numberOfPages = numberOfPages
        control.currentPage = 0
        control.itemSpacing = 3
        control.setFillColor(.white, for: .selected)
        control.setFillColor(.blue, for: .normal)
        return control
    }
    func updateUIView(_ uiView: FSPageControl, context: Context) {
        uiView.layoutIfNeeded()
    }
}

struct FSPagerBannerView: View {
    var cornerRadius:CGFloat
    @Binding var urls:[String] {
        didSet {
            self.numberOfPages = urls.count
        }
    }
    @State var numberOfPages:Int = 0
    init(urls:Binding<[String]>, cornerRadius:CGFloat = 0) {
        self._urls = urls
        self.cornerRadius = cornerRadius
    }
    var body: some View {
        ZStack {
            FSPagerUIView()
                .cornerRadius(cornerRadius: cornerRadius)
                .urls(urls: urls)
            VStack {
                Spacer()
                FSPagerControlUIView(numberOfPages: numberOfPages)
                    .frame(width:100, height: 20)
                    .padding(.bottom, 10)
                    .background(.red)
            }
        }
    }
}

struct FSPagerUIView_Previews: PreviewProvider {
    @State static var url:[String] = [
        "http://pineal-ai-oss.oss-cn-hongkong.aliyuncs.com/article/image/dc68d8e5d17845b3850dc16f56277522.png",
        "http://pineal-ai-oss.oss-cn-hongkong.aliyuncs.com/article/image/dc68d8e5d17845b3850dc16f56277522.png"
    ]
    static var previews: some View {
        FSPagerBannerView(urls: $url).previewLayout(.fixed(width: 300, height: 100))
    }
}
