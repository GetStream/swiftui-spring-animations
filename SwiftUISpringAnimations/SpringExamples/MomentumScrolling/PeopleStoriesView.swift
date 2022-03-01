//
//  PeopleStoriesView.swift
//  Created by Amos from getstream.io on 19/01/2022.

//  Inertial: The inertia animation is used to gradually decelerate a number. Think of it like smartphone's scroll momentum.

import SwiftUI

struct PeopleStoriesView: View {
    
    var stories: [PeopleStoriesStructure] = []
    let columns = [
        GridItem(.adaptive(minimum: 140))
    ]
    
    var body: some View {
        VStack {
            PeopleHeader()
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(stories) { item in
                        AsyncImage(url: URL(string: item.storiesImagePreview))
                            .frame(width: 186, height: 258)
                            .cornerRadius(12)
                            .overlay(
                                VStack(alignment: .leading) {
                                    HStack(alignment: .top) {
                                        ZStack(alignment: .bottomTrailing) {
                                            Image(item.storiesProfile)
                                                .resizable()
                                                .frame(width: 32, height: 32)
                                            
                                            Image(item.onlineNow)
                                                .scaleEffect(0.6)
                                                .offset(x: 5, y: 5)
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "15.circle.fill")
                                            .foregroundColor(.white)
                                    }
                                    
                                    Spacer()
                                    
                                    Text("\(item.storiesTitle)")
                                }.padding(8)
                            )
                    }
                }
            }
        }
    }
}

struct PeopleStoriesView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleStoriesView(stories: PeopleStoriesData)
            .previewDevice("iPhone 13 Pro")
            .preferredColorScheme(.dark)
    }
}
