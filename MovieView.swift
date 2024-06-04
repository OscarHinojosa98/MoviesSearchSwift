//
//  MovieView.swift
//  MovieSearch
//
//  Created by Oscar Hinojosa on 2/23/24.
//

import SwiftUI

struct MovieView: View {
    var movie: Result
    var body: some View {
        VStack{
            Text("\(movie.title) (\(movie.year.description))")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            AsyncImage(url: URL(string: movie.posterURLs!.original!)){image in
                image.image?.resizable()}
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: 200, maxHeight: 300)
                .padding()
            HStack(alignment: .top){
                Spacer()
                //Netflix
                if (movie.streamingInfo?.us?.netflix != nil){
                    VStack(alignment: .leading){
                        Text("Netflix")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Subs")
                            .font(.footnote)
                    }
                    Spacer()
                }
                
                //Disney
                if (movie.streamingInfo?.us?.disney != nil){
                    VStack(alignment: .leading){
                        Text("Disney")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text("Subs")
                            .font(.footnote)
                    }
                    Spacer()
                }
                
                //Prime
                if (movie.streamingInfo?.us?.prime != nil){
                    VStack(alignment: .leading){
                        Text("Prime")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        //var buy = false
                        //var rent = false
                        let temps = movie.streamingInfo?.us?.prime
                        if let temps = temps{
                            ForEach(temps) { temp in
                                if  (temp.type == "subscription")
                                {
                                    Text("Subs")
                                        .font(.footnote)
                                }
                                else if  (temp.type == "buy")
                                {
                                    Text("Buy: \(temp.price!.amount)(\(temp.quality))")
                                        .font(.footnote)
                                    //do{buy = true}
                                }
                                else if  (temp.type == "rent")
                                {
                                    Text("Rent: \(temp.price!.amount)(\(temp.quality))")
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                
                //Apple
                if (movie.streamingInfo?.us?.apple != nil){
                    VStack(alignment: .leading){
                        Text("Apple")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        //var buy = false
                        //var rent = false
                        let temps = movie.streamingInfo?.us?.apple
                        if let temps = temps{
                            ForEach(temps) { temp in
                                if  (temp.type == "subscription")
                                {
                                    Text("Subs")
                                        .font(.footnote)
                                }
                                if  (temp.type == "buy")
                                {
                                    Text("Buy: \(temp.price!.amount)(\(temp.quality))")
                                        .font(.footnote)
                                    //do{buy = true}
                                }
                                if  (temp.type == "rent")
                                {
                                    Text("Rent: \(temp.price!.amount)(\(temp.quality))")
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                
                //Hulu
                if (movie.streamingInfo?.us?.hulu != nil){
                    VStack(alignment: .leading){
                        Text("Hulu")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        //var buy = false
                        //var rent = false
                        let temps = movie.streamingInfo?.us?.hulu
                        if let temps = temps{
                            ForEach(temps) { temp in
                                if  (temp.type == "subscription")
                                {
                                    Text("Subs")
                                        .font(.footnote)
                                }
                                if  (temp.type == "buy")
                                {
                                    Text("Buy: \(temp.price!.amount)(\(temp.quality))")
                                        .font(.footnote)
                                    //do{buy = true}
                                }
                                if  (temp.type == "rent")
                                {
                                    Text("Rent: \(temp.price!.amount)(\(temp.quality))")
                                        .font(.footnote)
                                }
                                if  (temp.type == "addon")
                                {
                                    Text("Addon: \(temp.addOn)")
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                
                //HBO
                if (movie.streamingInfo?.us?.hbo != nil){
                    VStack(alignment: .leading){
                        Text("HBO")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        //var buy = false
                        //var rent = false
                        let temps = movie.streamingInfo?.us?.hbo
                        if let temps = temps{
                            ForEach(temps) { temp in
                                if  (temp.type == "subscription")
                                {
                                    Text("Subs")
                                        .font(.footnote)
                                }
                                if  (temp.type == "buy")
                                {
                                    Text("Buy: \(temp.price!.amount)")
                                        .font(.footnote)
                                    //do{buy = true}
                                }
                                if  (temp.type == "rent")
                                {
                                    Text("Rent: \(temp.price!.amount)")
                                        .font(.footnote)
                                }
                                if  (temp.type == "addon")
                                {
                                    Text("Addon: \(temp.addOn)")
                                        .font(.footnote)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                
            }
            Spacer()
            
        }
    }
}

//#Preview {
//    MovieView()
//}
