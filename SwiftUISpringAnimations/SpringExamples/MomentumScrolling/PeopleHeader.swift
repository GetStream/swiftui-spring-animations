//
//  PeopleHeader.swift
//  Messenger Clone
//
//  Learning SwiftUI Spring Animations: The Basics and Beyond
//
//  Created by Amos from getstream.io

import SwiftUI

struct  PeopleHeader: View {
    let incomingMessaageBubble = Color(#colorLiteral(red: 0.1490196078, green: 0.1490196078, blue: 0.1607843137, alpha: 1))
    let accentPrimary = Color(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))
    @State private var searchText = ""
    @State private var active = 0
    var body: some View {
        VStack {
            NavigationView{
                Picker("Switch between active and stories", selection: $active) {
                    Text("Active (26)").tag(0)
                    Text("Stories (59)").tag(1)
                }
                .textCase(.uppercase)
                .pickerStyle(.segmented)
                .navigationTitle("People")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: Button {
                        print("Pressed profile image")
                    } label: {
                        Image("amos")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    },
                        
                    trailing: Button {
                            print("Pressed contacts")
                        } label: {
                            Image(systemName: "person.crop.rectangle.stack.fill")
                        }
                )
        }
        .frame(height: 80)
            
        }
    
    }
}

struct  PeopleHeader_Previews: PreviewProvider {
    static var previews: some View {
        PeopleHeader()
            .preferredColorScheme(.dark)
    }
}
