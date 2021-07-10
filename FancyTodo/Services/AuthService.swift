//
//  WebService.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/9/21.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials(message: String)
    case custom(message: String)
}

struct SignUpRequestBody: Codable {
    let name: String
    let email: String
    let password: String
}
struct SignInRequestBody: Codable {
    let email: String
    let password: String
}

struct SignUpResponseBody: Codable {
    let message: String?
    let user: User?
    let act: String?
    let rft: String?
}
struct SignInResponseBody: Codable {
    let message: String?
    let user: User?
    let act: String?
    let rft: String?
}
struct SyncResponseBody: Codable {
    let message: String?
    let user: User?
}

class AuthService {
    func signUp(name: String, email: String, password: String, completion: @escaping (Result<SignUpResponseBody, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://localhost:3010/api/v1/auth/signup") else {
            return
        }
        
        let body = SignUpRequestBody(name: name, email: email, password: password)
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: req) { (data, res, err) in
            guard let data = data, err == nil else {
                completion(.failure(.custom(message: "No data.")))
                return
            }
            
            guard let data = try? JSONDecoder().decode(SignUpResponseBody.self, from: data) else {
                completion(.failure(.custom(message: "Validation error!")))
                return
            }
            
            completion(.success(data))
        }
        .resume()
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<SignInResponseBody, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://localhost:3010/api/v1/auth/signin") else {
            return
        }
        
        let body = SignInRequestBody(email: email, password: password)
        
        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: req) { (data, res, err) in
            guard let data = data, err == nil else {
                completion(.failure(.custom(message: "No data.")))
                return
            }
            
            guard let data = try? JSONDecoder().decode(SignInResponseBody.self, from: data) else {
                completion(.failure(.invalidCredentials(message: "Wrong email or password!")))
                return
            }
            
            completion(.success(data))
        }
        .resume()
    }
    
    func sync(completion: @escaping (Result<SyncResponseBody, AuthenticationError>) -> Void) {
        let defaults = UserDefaults.standard
        let act = defaults.string(forKey: "act")
        
        guard let url = URL(string: "http://localhost:3010/api/v1/auth/sync") else {
            return
        }
        
        var req = URLRequest(url: url)
        req.httpMethod = "GET"
        req.addValue("Bearer \(String(describing: act))", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: req) { (data, res, err) in
            guard let data = data, err == nil else {
                completion(.failure(.custom(message: "No data.")))
                return
            }
            
            guard let data = try? JSONDecoder().decode(SyncResponseBody.self, from: data) else {
                return
            }
            
            completion(.success(data))
        }
        .resume()
    }
}
