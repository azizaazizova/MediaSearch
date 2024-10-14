//
//  SearchHistory.swift
//  MediaSearch
//
//  Created by Aziza Azizova on 14/10/24.
//

import Foundation

struct SearchHistory {
    private let maxHistoryCount = 5
    private var history: [String] = []
    
    mutating func addSearchQuery(_ query: String) {
        if !history.contains(query) {
            if history.count == maxHistoryCount {
                history.removeFirst()
            }
            history.append(query)
        }
    }
    
    func getHistory() -> [String] {
        return history
    }
}
