//
//  APIManager.swift
//  TrendMedia
//
//  Created by useok on 2022/08/28.
//

import Foundation
import Alamofire
import SwiftyJSON


class APIManger {
    
    static let shared = APIManger()
    private init() { }
    
    func request(page: Int, query: String, completionHandler: @escaping ([String],Int) -> ()) {
        
        let url = "\(EndPoint.url)page=\(page)&query=\(query)"
        print(url)
        let headers: HTTPHeaders = [
            "Accept-Version": "v1",
            "Authorization": "Client-ID \(APIKey.apikey)"
        ]
        
        AF.request(url, method: .get, headers: headers).validate().responseData(queue: .global()) { response in
            switch response.result {
                
            case .success(let value):
                var urls: [String] = []
                let json = JSON(value)
//                print(json)
                print("=======")
                for image in json["results"].arrayValue{
                    let url = DataStruct(imageurl: image["urls"]["small"].stringValue)
                    urls.append(url.imageurl)
                }
                print("urls.count:",urls.count)
                let totalCount = json["total"].intValue
                completionHandler(urls,totalCount)
                
//                let json = JSON(value)["results"].arrayValue
//                print(json)
//                for i in json {
//                    let url = i["urls"]["small"].stringValue
                    
//                }
                
//                completionHandler(urls)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
    
    

  

            



            
