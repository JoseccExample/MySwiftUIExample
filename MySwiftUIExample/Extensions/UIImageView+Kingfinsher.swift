//
//  UIImageView+Kingfinsher.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/27.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(urlString:String) {
        guard let url = URL(string: urlString) else {
            return
        }
        self.kf.setImage(with: url)
    }
}
