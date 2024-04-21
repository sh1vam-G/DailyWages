//
//  BaseService.swift
//  DailyWages
//
//  Created by Shivam Gupta on 19/04/24.
//

import Foundation

enum RequestMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum ErrorType: Error {
    case networkError
    case serverError
    case incorrectRequest
    case unknownStatus
}

class BaseService {
    
    func executeRequest<T: Codable>(
        urlString: String,
        queryParams: [String: String],
        bodyParams: [String: Any],
        headers: [String: String],
        type: RequestMethods,
        completion: @escaping (Result<T?, ErrorType>) -> ()
    ) {
        let url = URL(string: urlString) ?? URL(fileURLWithPath: "")
        let queryItems = queryParams.map{ (key, value) in
            URLQueryItem(name: key,value: value)
        }
        var request = URLRequest(url: url)
        if !bodyParams.isEmpty {
            request.httpMethod = type.rawValue
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: bodyParams, options: [])
            } catch(let error) {
                print("error converting to data from json body")
                print(error)
                completion(Result.failure(.incorrectRequest))
            }
        }
        request.url?.append(queryItems: queryItems)
        headers.forEach{ (key,value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error {
                print(err)
                completion(.failure(.serverError))
            }
            
            if let httpResponse = response as? HTTPURLResponse{
                if (400...499).contains(httpResponse.statusCode) {
                    completion(.failure(.incorrectRequest))
                } else if (500...599).contains(httpResponse.statusCode) {
                    completion(.failure(.serverError))
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    completion(.failure(.unknownStatus))
                    return
                }
            }
            
            if let data = data {
                do {
                    let resp = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(resp))
                } catch(let error) {
                    print(error)
                    completion(.success(nil))
                }
            }
        }
        
        dataTask.resume()
    }
}
