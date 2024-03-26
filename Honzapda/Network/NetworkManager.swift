//
//  NetworkManager.swift
//  Honzapda
//
//  Created by YOUJIM on 2/28/24.
//

import Foundation

import Alamofire


class APIManager: ObservableObject  {
    static let shared = APIManager()
    private var headers: HTTPHeaders = []
}


// MARK: T에는 요청값 데이터의 모델, U에는 응닶값 데이터의 모델 적기

extension APIManager {
    func getData<T: Codable, U: Decodable>(urlEndpointString: String,
                                           responseDataType: U.Type,
                                           requestDataType: T.Type,
                                           parameter: T?,
                                           completionHandler: @escaping (U)->Void
    ){
        
        guard let url = URL(string: BaseURL.baseURL + urlEndpointString) else { return }
        print("get 요청 URL --> \(url)")
        print("Request 쿼리 --> \(String(describing: parameter))")
        
        AF
            .request(url, method: .get, parameters: parameter, headers: self.headers)
            .responseDecodable(of: U.self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
    func postData<T: Codable, U: Decodable>(urlEndpointString: String,
                                            responseDataType: U.Type,
                                            requestDataType: T.Type,
                                            parameter: T?,
                                            completionHandler: @escaping (U)->Void) {
        guard let url = URL(string: BaseURL.baseURL + urlEndpointString) else { return }
        print("post 요청 URL --> \(url)")
        print("Request 쿼리 --> \(String(describing: parameter))")

        AF
            .request(url, method: .post, parameters: parameter, encoder: .json, headers: self.headers)
            .responseDecodable(of: U.self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
    
    func deleteData<T: Codable, U: Decodable>(urlEndpointString: String,
                                            responseDataType: U.Type,
                                            requestDataType: T.Type,
                                            parameter: T?,
                                            completionHandler: @escaping (U)->Void) {
        
        guard let url = URL(string: BaseURL.baseURL + urlEndpointString) else { return }
        print("patch 요청 URL --> \(url)")
        print("Request 쿼리 --> \(parameter)")
        
        AF
            .request(url, method: .delete, parameters: parameter, encoder: .json, headers: self.headers)
            .responseDecodable(of: U.self) { response in
                switch response.result {
                case .success(let success):
                    completionHandler(success)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}

