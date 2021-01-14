//
//  Alanofire+XML.swift
//  AlamofireXMLRPC
//
//  Created by Jeremy Marchand on 08/10/2015.
//  Copyright © 2015 kodlian. All rights reserved.
//

import Foundation
import AEXML
import Alamofire

extension DataRequest {
    public func responseXMLDocument(queue: DispatchQueue? = nil,  completionHandler: @escaping (AFDataResponse<AEXMLDocument>) -> Void) -> Self {
        return responseData { (response) in
            let result: Result<AEXMLDocument, AFError>
            switch response.result {
            case .failure(let error):
                result = .failure(error)
            case .success(let data):
                do {
                    let XML = try AEXMLDocument(xml: data)
                    result = .success(XML)
                } catch let error {
                    result = .failure(AFError.responseValidationFailed(reason: .customValidationFailed(error: error)))
                }
            }
            completionHandler(AFDataResponse(request: response.request, response: response.response, data: response.data, metrics: response.metrics, serializationDuration: response.serializationDuration, result: result))
        }
    }
}


