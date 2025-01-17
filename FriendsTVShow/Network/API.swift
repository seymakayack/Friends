//
//  API.swift
//  Friends
//
//  Created by Seyma on 15.01.2025.
//

import Foundation
import Moya

enum API {
    case movie
    case actors(movieId: Int)
}

extension API: TargetType {
    var path: String {
        switch self {
        case .movie:
            return APIConfig().movie
        case .actors(let movieId):
            return APIConfig().actors.replacingOccurrences(of: "{tv_id}", with: "\(movieId)")
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Moya.Task {
        switch self {
        case .movie:
            return .requestPlain
        case .actors:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return [
            "Content-Type": "application/json",
            "Authorization": "Bearer \(ConstantsConfig().bearerToken)",
        ]
    }

    var baseURL: URL {
        guard let url = URL(string: APIConfig().baseUrl) else { fatalError() }
        return url
    }

    // Struct'lar static kullanılmadan sabitlerin saklanması için.
    struct ConstantsConfig {
        let apiKey = "862958fce951db84103f74cfc070a27e"
        let bearerToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NjI5NThmY2U5NTFkYjg0MTAzZjc0Y2ZjMDcwYTI3ZSIsIm5iZiI6MTczNjkyNDM3Mi40NjU5OTk4LCJzdWIiOiI2Nzg3NWNkNGNhYTUzZTkwOTg3YWY2YWYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.FdFtGuCEAArrkQiR1ZU3QEW15bfIWGYo_rbTHG4olig"
    }

    struct APIConfig {
        let baseUrl = "https://api.themoviedb.org/3/"
        let movie = "tv/1668"
        let actors = "tv/{tv_id}/credits"
    }
}
