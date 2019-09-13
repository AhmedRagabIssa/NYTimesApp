//
//  NetworkManager+Articles.swift
//  NYTimesApp
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import Foundation

extension NetworkManager {
    
    static func requestMostPopularArticles(_ baseURLStr: String = "https://api.nytimes.com/svc/mostpopular/v2/viewed/", forLastDays:Int = 7, using networkManager: NetworkManager = NetworkManager(), completion: @escaping (_ articles: [Article]?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: "\(baseURLStr)\(forLastDays).json?api-key=\(aPIKey)") else {
            let err = NSError(domain:"", code:123, userInfo:nil)
            completion(nil, err)
            return
        }
        
        networkManager.RequestService(url, parameters: [:]) { (res, err) in
            do {
                let result = try networkManager.decoder.decode(Response.self, from: res?.data ?? Data())
                if let articles = result.results {
                    completion(articles, nil)
                } else {
                    completion(nil, err)
                }
            } catch {
                completion(nil, error)
            }
            
        }
    }
    
}

