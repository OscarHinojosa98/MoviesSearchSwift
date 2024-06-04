//
//  ResultFetcher.swift
//  MovieSearch
//
//  Created by Oscar Hinojosa on 2/14/24.
//

import Foundation

class ResultFetcher:ObservableObject {
    
    @Published var movies = [Result]()
    var isLoading: Bool = false
    var errorMessage: String? = nil
    //var tmpList = [Result]()
    
    //init(){
        //fetchMovies(name: name)
    //}
    
    func fetchMovies(name: String){
        
        isLoading = true
        //https://streaming-availability.p.rapidapi.com/v2/search/title?title=hulk&country=us&show_type=movie&output_language=en
        //TODO show error if cannot create url
        let url = URL(string: "https://streaming-availability.p.rapidapi.com/v2/search/title?title=\(name)&country=us&show_type=movie&output_language=en")!
        
        var request  = URLRequest(url: url)
        request.httpMethod = "GET"
        //request.setValue("application/octet-stream", forHTTPHeaderField: "content-type")
        request.setValue("7a3c7f6ae9msh8d8abb68de23261p1f3bc5jsn864e4d11ff31", forHTTPHeaderField: "X-RapidAPI-Key")
        request.setValue("streaming-availability.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        
        let task = URLSession.shared.dataTask(with: request) {[unowned self] (data, response, error) in
            
            self.isLoading = false
            let decoder = JSONDecoder( )
            if let data = data {
                do {
                    let movies = try decoder.decode(Movies.self, from: data)
                    //print(movies.result as Any)
                    DispatchQueue.main.async {
                        self.movies = movies.result!
                        //self.tmpList = movies.result!
                    }
                    
                }catch {
                    //TODO: show error
                    print (error)
                }
            }
        }
        task.resume()
        //return movies
    }
    
}
