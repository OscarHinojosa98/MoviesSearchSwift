//
//  ContentView.swift
//  MovieSearch
//
//  Created by Oscar Hinojosa on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var resultFetcher = ResultFetcher()
    @State var searchName: String = ""
    @State var movieList = [Result]()
    @State var emptyStr: String = " "
    
    var body: some View {
        NavigationStack() {
            Spacer()
            Text("Movie Search")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .fontDesign(.rounded)
            
            Spacer()
            
            TextField("Enter movie name!", text: $searchName)
                .textFieldStyle(.roundedBorder)
                .padding()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            
            /*Button(action: {
                emptyStr = searchName
            }, label: {
                NavigationLink(destination: ResultView(movies: resultFetcher.fetchMovies(for: emptyStr))){
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                }
            })*/
            
            NavigationLink("Next"){
                ResultView(resultFetcher: resultFetcher, searchName: searchName)
            }
            .padding()
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
