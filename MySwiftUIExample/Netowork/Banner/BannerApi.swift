//
//  BannerApi.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/27.
//

import Foundation
import Request

extension SwiftUIApi {
    public struct Banner: APIConfig {
        public var path: String { "banner/banner/findBannerListByPosition" }
        public var parameters: [String : Any]?
        public struct Parameters: Encodable {
            let position:Int
        }
        public struct Model: Codable {
            let bannerImg:String?
            let bannerTitle:String?
            let jumpProtocol:String?
            let jumpUrl:String?
        }
        public static func request(success:@escaping([Model]?) -> Void, failure:@escaping (Int,String) -> Void) {
            let api = Banner(parameters: Parameters(position: 1).toParameters())
            SwiftUIApi.request(type: BaseModel<[Model]>.self, config: api, success:{ (model) in
                success(model.data)
            }, failure: failure)
        }
    }
}
