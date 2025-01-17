//
//  NetworkManager.swift
//  Friends
//
//  Created by Seyma on 15.01.2025.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }

    func fetchMovie(completion: @escaping (Result<(Movie), Error>) -> Void)
    func fetchActors(movieId: Int, completion: @escaping (Result<Actor, Error>) -> Void)
}

class NetworkManager: Networkable {
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])

    func fetchMovie(completion: @escaping (Result<(Movie), Error>) -> Void) {
        request(target: .movie, completion: completion)
    }

    func fetchActors(movieId: Int, completion: @escaping (Result<Actor, Error>) -> Void) {
        request(target: .actors(movieId: movieId), completion: completion)
    }
}

private extension NetworkManager {
    private func request<T: Decodable>(target: API, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                
                if let jsonString = String(data: response.data, encoding: .utf8) {
                    print("Response JSON: \(jsonString)")
                } else {
                    print("Gelen veri okunamadı.")
                }
                
                do {
                    // JSON Decode işlemi
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    print("Decoded Data: \(results)")
                    completion(.success(results))
                } catch let decodingError {
                    // Decode hatası konsola yazdırılıyor
                    print("Decoding Error: \(decodingError.localizedDescription)")
                    print("Data: \(String(data: response.data, encoding: .utf8) ?? "Veri yok")")
                    completion(.failure(decodingError))
                }
                
            case let .failure(networkError):
                // Ağ hatasını konsola yazdır
                print("Network Error: \(networkError.localizedDescription)")
                completion(.failure(networkError))
            }
        }
    }
}


