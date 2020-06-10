//
//  RequestObservable.swift
//  Rxswift-URLSession
//
//  Created by Shaza Hassan on 6/4/20.
//  Copyright © 2020 Shaza Hassan. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import ObjectMapper
class RequestObservable{
    private lazy var jsonDecoder = JSONDecoder()
    private var urlSession: URLSession
    public init(config:URLSessionConfiguration) {
        urlSession = URLSession(configuration:
                  URLSessionConfiguration.default)
    }
    
    func callAPI(request: URLRequest) -> Observable<[[String : Any]]> {
        return Observable.create{ observer in
            let task = self.urlSession.dataTask(with: request){ (data,response, error) in
                if let httpResponse = response as? HTTPURLResponse{
                    let statusCode = httpResponse.statusCode
                    
                    do {
                        let _data = data ?? Data()
                        if (200...399).contains(statusCode) {
                            
                            let objs = try JSONSerialization.jsonObject(with: _data, options: .mutableContainers)
                          //MARK: observer onNext event
                            observer.onNext(objs as! [[String : Any]])
                        }
                        else {
                          observer.onError(error!)
                        }
                    } catch {
                        observer.onError(error)
                    }
                }
                observer.onCompleted()
            }
            task.resume()
            return Disposables.create{
                task.cancel()
            }
        }
    }
}
