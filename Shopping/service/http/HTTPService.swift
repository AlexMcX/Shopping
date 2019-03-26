//
//  HttpService.swift
//  Shopping
//
//  Created by Alexey Oleksandrovich on 3/23/19.
//  Copyright © 2019 Alexey Oleksandrovich. All rights reserved.
//

import UIKit

class HTTPService: Service {    
    // **************** GET ****************
//    func get(url urlPath:String, parameters:[String: String]?, headerValues:[String: String]?) {
//        request(urlPath, .GET, parameters, headerValues);
//    }
//
//    func get(url urlPath:String, parameters:[String: String]?) {
//        get(url: urlPath, parameters: parameters, headerValues: nil)
//    }
//
//    func get(url urlPath:String)  {
//        get(url: urlPath, parameters: nil);
//    }
    
    
    
    // **************** POST ****************
//    func post(url urlPath:String, parameters:[String: String]?, headerValues:[String: String]?) {
//        request(urlPath, .POST, parameters, headerValues);
//    }
//
//    func post(url urlPath:String, parameters:[String: String]?) {
//        post(url: urlPath, parameters: parameters, headerValues: nil)
//    }
//
//    func post(url urlPath:String)  {
//        post(url: urlPath, parameters: nil);
//    }
    
    public func request(route:Route, parameters:[String: String]? = nil, headerValues:[String: String]? = nil) {
        requestRoute(route, parameters, headerValues);
    }
    
    // PRIVATE
    private func requestRoute(_ route:Route, _ parameters: [String: String]?, _ headerValues: [String: String]? = nil) {
        let session = URLSession.shared;
        
        guard let request = getRequest(route, parameters, headerValues) else { return }
        
        session.dataTask(with: request) { (data, response, error) in
            guard   let data = data,
                    let response = response as? HTTPURLResponse,
                    (200..<300) ~= response.statusCode,
                    error == nil else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                print("GET data as json: \(json)")
            }catch{
                print("Get parse data error: \(error)")
            }
            }.resume()
    }
    
    private func getRequest(_ route:Route, _ parameters: [String: String]?, _ headerValues: [String: String]? = nil) -> URLRequest? {
        var result:URLRequest;
        
        guard let url = URL(string: route.path) else { return nil}
        
        result = URLRequest(url: url,
                            cachePolicy: .useProtocolCachePolicy,
                            timeoutInterval: 5.0);
        
        result.httpMethod = route.method.rawValue;
        
        if let params = parameters {
            switch route.method {
                case .POST:
                        do {
                            result.addValue("application/json", forHTTPHeaderField: "Content-Type")
                            result.addValue("*/*", forHTTPHeaderField: "Accept")
                            result.addValue("no-cache", forHTTPHeaderField: "cache-control")

                            result.httpBody = try JSONSerialization.data(withJSONObject: params, options: []);
                            
                        }catch let error {
                            print("ERROR: HttpService::getRequest \(error)");
                        }
                case .GET:
                        var components = URLComponents(string: route.path)!;
                    
                        if let params = parameters {
                            components.queryItems = params.map { (key, value) in
                                URLQueryItem(name: key, value: value)
                            }
                        }
                    
                        result.url = components.url;
            }
        }
        
        guard (headerValues != nil) else { return result; }
        
        for (key, value) in headerValues! {
            result.addValue(value, forHTTPHeaderField: key)
        }
        
        return result;
    }
}
