//
//  MediaItem.swift
//  MediaSearch
//
//  Created by Aziza Azizova on 14/10/24.
//


import Foundation

struct MediaItem: Decodable {
    let trackId: Int?
    let artistName: String?
    let trackName: String?
    let artworkUrl100: String?
    let primaryGenreName: String?
    let longDescription: String?
    let trackViewUrl: String?
    let wrapperType: String?
    let kind: String?
}

struct MediaResponse: Decodable {
    let results: [MediaItem]
}
