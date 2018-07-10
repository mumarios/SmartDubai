//
//  ApiManager.swift
//  SmartDubai
//
//  Created by Muhammad Umar on 09/07/2018.
//  Copyright © 2018 Muhammad Umar. All rights reserved.
//

import Foundation
import TrafficBase
import Alamofire


class apiManager : AFManagerProtocol{
    
    var isSuccess = false
    var modelData:JSONData?
    var resultData:[Result]?
    
    
    func api(_ param: AFParam, completion: @escaping () -> Void) {
        self.isSuccess = false
        
        //Request
        AFNetwork.shared.apiRequest(param, isSpinnerNeeded: true, success: { (response) in
            
            guard let data = response else { return }
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(JSONData.self, from: data)
                self.modelData = model
                //check success case from server
                if model.status == "OK" {
                    self.resultData = model.results
                    self.isSuccess = true
     
                }
            } catch let err {
                print("Err", err)
            }
            
            completion()
        }) { (error) in
            
            completion()
        }
    }
    
    
}
extension apiManager{
    func params() -> AFParam{
        
        let headers: [String : String]? = [:]
        let parameters : [String : AnyObject]? = [:]
        
        
        let param = AFParam(endpoint: "", params: parameters!, headers: headers!, method: .get, parameterEncoding: URLEncoding(destination: .methodDependent), images: [])
        
        return param
}
}

