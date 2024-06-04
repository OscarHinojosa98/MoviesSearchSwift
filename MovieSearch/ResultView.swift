//
//  ResultView.swift
//  MovieSearch
//
//  Created by Oscar Hinojosa on 2/14/24.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var resultFetcher: ResultFetcher
    
    //var movies: [Result]
    var searchName: String
    
    var body: some View{
    NavigationStack {
        Text("Results for \(searchName)")
        List {
            ForEach(resultFetcher.movies){ movie in
                NavigationLink(destination: {MovieView(movie: movie)}){
                    HStack{
                        if (movie.posterURLs?.original != nil){
                            AsyncImage(url: URL(string: movie.posterURLs!.original!)){image in
                                image.image?.resizable()}
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: 75, maxHeight: 100)
                        }
                        else{
                            Rectangle()
                                .foregroundColor(.primary)
                                .frame(maxWidth: 75, maxHeight: 100)
                                
                                
                            /*Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(maxWidth: 25, maxHeight: 50)*/
                        }
                        
                        VStack{
                            Text("\(movie.title) (\(movie.year.description))")
                                .font(.title3)
                            Text(movie.overview)
                                .font(.caption)
                                .lineLimit(3)
                        }
                    }
                }
            }
        }
        
    }
    .onAppear(perform: {resultFetcher.fetchMovies(name: searchName)})
    
}
}

#Preview {
    ResultView(resultFetcher: ResultFetcher(), searchName: "Hulk")
}
