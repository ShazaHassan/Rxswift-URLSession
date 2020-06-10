//
//  APIClient.swift
//  Rxswift-URLSession
//
//  Created by Shaza Hassan on 6/10/20.
//  Copyright © 2020 Shaza Hassan. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
class APIClient{
    static var shared = APIClient()
    lazy var requestObservable = RequestObservable(config: .default)
    func getRecipes() throws -> Observable<[[String : Any]]> {
      var request = URLRequest(url:
            URL(string:"https://jsonplaceholder.typicode.com/posts")!)
      request.httpMethod = "GET"
      request.addValue("application/json", forHTTPHeaderField:
                "Content-Type")
      return requestObservable.callAPI(request: request)
    }
}
