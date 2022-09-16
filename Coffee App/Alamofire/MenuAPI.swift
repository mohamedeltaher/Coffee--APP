//
//  NetWork.swift
//  testApi
//
//  Created by Mohamed Eltaher on 07/09/2022.
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
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzZXd3d0BnbWFpbC5jb20iLCJleHAiOjE2NjMyNjkyNTAsImlhdCI6MTY2MzIzMzI1MH0.j5ZC0oXP7csbYXLYzwCzJuiyDgsihcEjdMIZ5kXNBBw"
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
  


