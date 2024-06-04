//
//  Result.swift
//  MovieSearch
//
//  Created by Oscar Hinojosa on 2/14/24.
//

import Foundation

struct Result: Codable, Identifiable{
        var id = UUID()
        let backdropPath: String
        let backdropURLs: BackdropURLs?
        let countries: [String]
        //val imdbRating: Int
        //val imdbVoteCount: Int
        //val originalLanguage: String
        let originalTitle: String
        let overview: String
        let posterPath: String
        let posterURLs: PosterURLs?
        let streamingInfo: StreamingInfo?
        let title: String
        let type: String
        let year: Int
    
    private enum CodingKeys: String, CodingKey {
        case backdropPath, backdropURLs, countries, originalTitle, overview, posterPath, posterURLs, streamingInfo, title, type, year
    }
}
