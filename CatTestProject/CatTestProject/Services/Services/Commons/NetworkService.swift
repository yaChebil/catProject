//
//  NetworkService.swift
//  CatTestProject
//
//  Created by Yassine Chebil on 15/01/2018.
//  Copyright © 2018 Yassine Chebil. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class NetworkService {
    
    // MARK:- Variables & Constants
    static let sharedInstance = NetworkService()
    
    
    // MARK:- Methods
    
    //Generic func for sending all API Requests
    func sendDataFetchRequest(url:String,
                              methodType:HTTPMethod,
                              params:Parameters,
                              urlEncoding:ParameterEncoding,
                              headers:HTTPHeaders?,
                              callbackSuccess: @escaping (JSON) -> Void,
                              callbackFailure:@escaping (AFError) -> Void)
    {
        
        //usage of alamofire Global server configuration for sending request
        ServerConfiguration.manager.request(url,
                                            method: methodType,
                                            parameters: params,
                                            encoding: urlEncoding,
                                            headers: headers)
            
            .validate()
            .responseJSON { response in
                
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    callbackSuccess(json)
                case .failure:
                    if let error: AFError = response.result.error as? AFError {
                        callbackFailure(error)
                    }
                    
                }
        }
        
    }
}
