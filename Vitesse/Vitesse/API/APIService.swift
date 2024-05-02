//
//  APICallsConfiguration.swift
//  Vitesse
//
//  Created by Tristan Géhanne on 11/04/2024.
//

import Foundation


class APIService {
    
    let baseURL = URL(string: "http://127.0.0.1:8080")!
    static let shared = APIService()
    private(set) var token: String?
    private(set) var isAdmin: Bool?
    
    func updateSession(token: String?){
        self.token = token
    }
    
    enum EndPoint {
        case user(UserEndpoint)
        case candidate(CandidateEndpoint)
        
        var path: String {
            switch self {
            case .user(let endpoint):
                return "user/" + endpoint.rawValue
            case .candidate(let endpoint):
                return "candidate" + endpoint.path
            }
        }
    }
    
    enum UserEndpoint: String {
        
        case authentification = "auth"
        case register = "register"
    }
    
    enum CandidateEndpoint {
        case base
        case detail(String)
        case favorite(String)
        
        var path: String {
            switch self {
            case .base:
                return ""
            case .detail(let id):
                return "/\(id)"
            case .favorite(let id):
                return "/\(id)/favorite"
            }
        }
    }
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    func createRequest(method: HTTPMethod, endPoint: EndPoint, headers: [String: String]? = nil, includeToken: Bool = false, body: [String: Any]? = nil, completion: @escaping (Result<Data, Error>) -> Void) {
        let url = baseURL.appendingPathComponent(endPoint.path)
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        if includeToken, let token = token {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let headers = headers {
            request.allHTTPHeaderFields = headers
        }
        
        if let body = body {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                print("Error serializing body: \(error)")
                completion(.failure(error))
                return
            }
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let result = self.processResponse(data: data, response: response, error: error)
            DispatchQueue.main.async {
                completion(result)
            }
        }.resume()
    }
    
    func processResponse(data: Data?, response: URLResponse?, error: Error?) -> Result<Data, Error> {
        if let error = error {
            return .failure(error)
        }
        
        guard let httpResponse = response as? HTTPURLResponse, let data = data else {
            return .failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Invalid response or data"]))
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return .success(data)
        default:
            let errorDescription = String(data: data, encoding: .utf8) ?? "No error description available"
            return .failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: errorDescription]))
        }
    }
}
