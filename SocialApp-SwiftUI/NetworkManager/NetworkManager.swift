//
//  NetworkManager.swift
//  SocialApp
//
//  Created by Oleksandr Bretsko on 1/2/2021.
//

import Foundation
import Combine


//TODO:
//public enum NetServiceError: Error {
//
//    case network(Error)
//
//    case decoding(Error)
//
//    case unexpectedStatus(Int)
//
//    /// contains optional error message
//    case unknown(String?)
//}

protocol NetworkingService {
    
    func loadUsers() -> AnyPublisher<[User], Error>
    
    func loadComments() -> AnyPublisher<[Comment], Error>
    
    func loadPosts() -> AnyPublisher<[Post], Error>
}

class NetworkManager: NetworkingService {
    static let shared: NetworkManager = { .init() }()

    func loadUsers() -> AnyPublisher<[User], Error> {
        load(.users).map(\.value).eraseToAnyPublisher()
    }
    
    func loadComments() -> AnyPublisher<[Comment], Error> {
        load(.comments).map(\.value).eraseToAnyPublisher()
    }
    
    func loadPosts() -> AnyPublisher<[Post], Error> {
        load(.posts).map(\.value).eraseToAnyPublisher()
    }
    
    
    //MARK: - private
    
    // based on https://www.vadimbulavin.com/modern-networking-in-swift-5-with-urlsession-combine-framework-and-codable/
    
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func load<T: Decodable>(_ endPoint: EndPoint) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: endPoint.makeURLRequest())
            .tryMap { result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
//    private func load<T: Decodable>(,
//                                    _ completion: @escaping (Result<T, NetServiceError>) -> ()) {
//
//        let request = endPoint.makeURLRequest()
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            if let error = error {
//                completion(.failure(.network(error)))
//                return
//            }
//            guard let httpResponse = response as? HTTPURLResponse,
//                  let data = data else {
//                let message = "Fetch failed: \(error?.localizedDescription ?? "Unknown error")"
//                completion(.failure(.unknown(message)))
//                return
//            }
//
//            guard (200...299).contains(httpResponse.statusCode) else {
//                completion(.failure(.unexpectedStatus(httpResponse.statusCode)))
//                return
//            }
//
//            do {
//                let decodedData = try JSONDecoder().decode(T.self, from: data)
//                completion(.success(decodedData))
//            } catch  {
//                completion(.failure(.decoding(error)))
//            }
//        }.resume()
//    }
}

