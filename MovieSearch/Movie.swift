//
//  Movie.swift
//  MovieSearch
//
//  Created by Patrick Pahl on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Movie {
    
    private let titleKey = "title"
    private let vote_averageKey = "vote_average"
    private let overviewKey = "overview"
    private let poster_pathKey = "poster_path"
    
    let title: String
    let vote_average: Float
    let overview: String
    let poster_path: String
    
    init?(jsonDictionary: [String: AnyObject]){
        
    guard let title = jsonDictionary[titleKey] as? String,
        let vote_average = jsonDictionary[vote_averageKey] as? Float,
        let overview = jsonDictionary[overviewKey] as? String,
        let poster_path = jsonDictionary[poster_pathKey] as? String else {
            return nil
        }
        
        self.title = title
        self.vote_average = vote_average
        self.overview = overview
        self.poster_path = poster_path
        
    }
}





//{
//    "poster_path": "\/aZeX4XNSqa08TdMHRB1gDLO6GOi.jpg",
//    "adult": false,
//    "overview": "Jerry, a small-town Minnesota car salesman is bursting at the seams with debt... but he's got a plan. He's going to hire two thugs to kidnap his wife in a scheme to collect a hefty ransom from his wealthy father-in-law. It's going to be a snap and nobody's going to get hurt... until people start dying. Enter Police Chief Marge, a coffee-drinking, parka-wearing - and extremely pregnant - investigator who'll stop at nothing to get her man. And if you think her small-time investigative skills will give the crooks a run for their ransom... you betcha!",
//    "release_date": "1996-04-05",
//    "genre_ids": [
//    80,
//    18,
//    53
//    ],
//    "id": 275,
//    "original_title": "Fargo",
//    "original_language": "en",
//    "title": "Fargo",
//    "backdrop_path": "\/lGAaaOzqw8nc14HOgSP58TWWo1y.jpg",
//    "popularity": 2.762226,
//    "vote_count": 889,
//    "video": false,
//    "vote_average": 7.53
//},