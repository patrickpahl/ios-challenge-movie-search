//
//  MovieController.swift
//  MovieSearch
//
//  Created by Patrick Pahl on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    //static let sharedController = MovieController()
    
    static let baseURL = "https://api.themoviedb.org/3/search/movie"
    static let apiKey = "?api_key=561a7ba994f46221b923777ab939ca18"
    static let resultsKey = "results"
    
    
    static func getMovie(searchTerm: String, completion: (movies: [Movie]) -> Void){
        
    var movieSearchURLString = MovieController.baseURL + MovieController.apiKey
    
        movieSearchURLString += "&query=" + searchTerm.stringByReplacingOccurrencesOfString(" ", withString: "+")
        
        if let url = NSURL(string: movieSearchURLString){
            
            //NetworkController.performRequestForURL(url, httpMethod: .Get, completion: { (data, error) in
            NetworkController.dataAtURL(url, completion: { (data) in
     
                if let data = data,
                rawJSON = try? NSJSONSerialization.JSONObjectWithData(data, options: []),
                    
                jsonDictionary = rawJSON as? [String: AnyObject],
                
                resultsArray = jsonDictionary[MovieController.resultsKey] as? [[String:AnyObject]]{
                    var movies = [Movie]()
                    for resultsDictionary in resultsArray {
                        if let movie = Movie(jsonDictionary: resultsDictionary) {
                    movies.append(movie)
                }
            }
                completion(movies:movies)
                } else {
                completion(movies: [])
            }
            
            })
                } else {
                completion(movies: [])
        }
    }
}






