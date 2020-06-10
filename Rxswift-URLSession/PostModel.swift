//
//  PostModel.swift
//  Rxswift-URLSession
//
//  Created by Shaza Hassan on 6/4/20.
//  Copyright © 2020 Shaza Hassan. All rights reserved.
//

import Foundation
import ObjectMapper
//MARK: PostModel
//public struct PostModel: Codable {
//  private var id: Int
//  private var userId: Int
//  private var title: String
//  private var body: String
//  init(id: Int, userId: Int, title: String, body: String) {
//     self.id = id
//     self.userId = userId
//     self.title = title
//     self.body = body
//  }
//  func getId() -> Int {
//    return self.id
//  }
//  func getUserId() -> Int {
//    return self.userId
//  }
//  func getTitle() -> String {
//    return self.title
//  }
//  func getBody() -> String {
//    return self.body
//  }
//}
class PostModel: Mappable{
    var id: Int?
    var userId: Int?
    var title: String?
    var body: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        userId <- map["userId"]
        title <- map["title"]
        body <- map["body"]
    }
    
    init() {
    }
}
