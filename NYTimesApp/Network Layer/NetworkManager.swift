//
//  NetworkManager.swift
//  NYTimesApp
//
//  Created by Ahmed Ragab on 7/9/19.
//  Copyright © 2019 Ahmed Ragab. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    let decoder = JSONDecoder()
    
    func RequestService(_ url: URL, method: HTTPMethod = .get, parameters: Parameters?, encoding: ParameterEncoding = URLEncoding.methodDependent, headers: HTTPHeaders = [:], withComplation complation: @escaping (_ response: DataResponse<Any>?, _ error: Error?) -> Void){
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).validate().responseJSON { (response) in
            
            switch response.result {
            case .success(_):
                complation(response, nil)
            case .failure(let error):
                print("\n\n===========Error===========")
                print("Error Code: \(error._code)")
                print("Error Messsage: \(error.localizedDescription)")
                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                    print("Server Error: " + str)
                }
                print("\n\n===========================")
                complation(nil,error)
                break
            }
        }
    }
    
}
