//
//  WebService.swift
//  FancyTodo
//
//  Created by Adam Rafiandri on 7/9/21.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(message: String)
}

struct SignInRequestBody: Codable {
    let email: String
    let password: String
}

struct SignInResponseBody: Codable {
    let message: String?
    let user: User?
    let act: String?
    let rft: String?
}

class AuthService {
    func signIn(email: String, password: String, completion: @escaping (Result<SignInResponseBody, AuthenticationError>) -> Void) {
        guard let url = URL(string: "http://localhost:3010/api/v1/auth/signin") else {
            completion(.failure(.custom(message: "Invalid URL!")))
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
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(data))
        }
        .resume()
    }
}
