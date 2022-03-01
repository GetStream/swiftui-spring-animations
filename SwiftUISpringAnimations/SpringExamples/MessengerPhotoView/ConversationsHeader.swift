//
//  ConversationsHeader.swift
//  MessengerClone
//
//  Created by Amos from getstream.io on 21/01/2022.
//

import SwiftUI

struct  ConversationsHeader: View {
    
    let accentPrimary = Color(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1))
    let accentSecondary = Color(#colorLiteral(red: 0.6241646409, green: 0.2049524784, blue: 0.9971055388, alpha: 1))
    
    var body: some View {
        NavigationView{
            // A view that doesn’t contain any content. EmptyView is a special view that displays nothing and occupies no space
            EmptyView()
                //.navigationTitle("Conversations")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    
                    // Leading edge views
                    leading: Button {
                        print("Pressed profile image")
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(accentSecondary)
                            
                        Image("amos")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                            
                        VStack(alignment: .leading) {
                            Text("Amos Gyamfi")
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("Active now")
                                .font(.caption2)
                                .foregroundColor(.secondary)
                        }
                        
                    },
                    
                    // Trailing edge views
                    trailing: Button {
                            print("Pressed call")
                        } label: {
                            Image(systemName: "phone.fill")
                                .foregroundColor(accentSecondary)
                            
                            Image(systemName: "video.fill")
                                .foregroundColor(accentSecondary)
                            
                            Image("status")
                        }
                )
        }
        .frame(height: 80)
    }
}

struct  ConversationsHeader_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsHeader()
            .preferredColorScheme(.dark)
    }
}
