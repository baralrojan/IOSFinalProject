//
//  APIHelper.swift
//  NewsPortal
//
//  Created by user231854 on 3/25/23.
//

import Foundation

final class APIHelper{
    static let shared = APIHelper()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=fc1b5e8749cc44ac9c8f023248140a7a")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[String], Error>) -> Void){
        guard let url = Constants.topHeadlinesURL else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                
                do{
                    
                }
            }
        }
    }
}
