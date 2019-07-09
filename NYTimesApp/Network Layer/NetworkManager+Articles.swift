//
//  NetworkManager+Articles.swift
//  NYTimesApp
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import Foundation

extension NetworkManager {
    
    static func requestMostPopularArticles(_ forLastDays:Int = 7, using networkManager: NetworkManager = NetworkManager(), completion: @escaping (_ articles: [Article]?, _ error: Error?) -> Void) {
        
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(forLastDays).json?api-key=\(aPIKey)") else {
            return
        }
        
        networkManager.RequestService(url, parameters: [:]) { (res, err) in
            if let articles = (res as? Response)?.results {
                completion(articles, nil)
            } else {
                completion(nil, err)
            }
        }
    }
    
}
