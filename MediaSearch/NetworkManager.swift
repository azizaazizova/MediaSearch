//
//  NetworkManager.swift
//  MediaSearch
//
//  Created by Aziza Azizova on 14/10/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://itunes.apple.com/search"
    
    func searchMedia(query: String, completion: @escaping (Result<[MediaItem], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)?term=\(query)&limit=30") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                // Handle missing data
                return
            }
            
            do {
                let mediaResponse = try JSONDecoder().decode(MediaResponse.self, from: data)
                completion(.success(mediaResponse.results))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }
        task.resume()
    }
}
