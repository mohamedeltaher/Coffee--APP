//
//  NetWork.swift
//  testApi
//
//  Created by AhmedKhairy on 07/09/2022.
//

import Foundation
import UIKit
import Alamofire
//enum myerror : Error {
//    case somethingINvaild
//    case wrongWithAPI
//    case somethingRetureNIL
//}
class UserViewModel{
    func fatchingData(completion : @escaping (Result<[NetworkDataModel],Error>) ->Void){
        let header = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxMjM0MTI0QGdtYWlsLmNvbSIsImV4cCI6MTY2MzIxODI0MSwiaWF0IjoxNjYzMTgyMjQxfQ.4xxrY0NrLTVsZ5NQ41OEQQEQmJWUq1zX_Ge9rbNVQWQ"
        ]
        AF.request("https://bm-coffee-shop-api.herokuapp.com/api/v1/product/",method: .get,headers: HTTPHeaders(header)).response { response in
       
            if let data = response.data {
              do{
                let userResponse = try JSONDecoder().decode([NetworkDataModel].self, from: data)
                  
                  completion(.success(userResponse))

              }catch {
                  completion(.failure(error))
              }
                
              }
            
       
                }
            }
    }
  


