//
//  SwiftUIApi.swift
//  MySwiftUIExample
//
//  Created by 张行 on 2020/11/27.
//

import Foundation
import Request
import Alamofire

public class SwiftUIApi: API {
    public static var host: String {
        return "https://radar-api.pinealsys.zone/api/"
    }
    public static var mock: String = ""
    public static var defaultHeadersConfig: ((inout HTTPHeaders) -> Void)?
}

public struct BaseModel<T:Codable>: Model {
    public var _isSuccess: Bool { self.success }
    public var _code: Int { self.code }
    public var _message: String { self.message }
    public let code:Int
    public let message:String
    public let success:Bool
    public let data:T?
}

