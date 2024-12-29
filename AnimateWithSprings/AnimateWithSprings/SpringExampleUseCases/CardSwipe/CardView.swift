//
//  CardView.swift
//  Tryst
//


import SwiftUI

// Your imports remain the same

struct CardView: View {
    var person: String
    @State private var offset = CGSize.zero
    @State private var color: Color = .black
    @State private var showHeart = false
    @State private var showDislike = false // Added state for dislike emoji
    @State private var isDraggingLeft = false
    @State private var isDraggingRight = false
    
    var body: some View {
        ZStack {
            
            ZStack {
                Image("participant12")
                    .resizable()
                    .scaledToFit()
                    .border(.white, width: 6)
                    .cornerRadius(6)
                    .frame(width: 320, height: 420)
                    .shadow(radius: 4)
                    .hueRotation(.degrees(isDraggingRight ? 220 : 0))
                    .rotation3DEffect(
                        .degrees(isDraggingRight ? -30 : 0), axis: (x: -45, y: 45.0, z: -15.0),
                        perspective: 0.5
                    )
                    .blur(radius: isDraggingLeft ? 8 : 0)
                
                HStack {
                    if isDraggingLeft {
                        Image(systemName: "hand.thumbsdown.fill") // Added dislike emoji
                            .font(.system(size: 80))
                            .bold()
                            .foregroundColor(.red)
                            .scaleEffect(showDislike ? 1 : 0)
                            .animation(.snappy, value: showDislike)
                    } else {
                        Image(systemName: "heart.fill")
                            .font(.system(size: 80))
                            .bold()
                            .foregroundColor(.red)
                            .scaleEffect(showHeart ? 1 : 0)
                            .animation(.bouncy, value: showHeart)
                    }
                    Text(person)
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .offset(x: offset.width, y: 0.4)
            .rotationEffect(.degrees(Double(offset.width / 40)))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                        withAnimation {
                            changeColor(width: offset.width)
                            showHeart = offset.width > 130
                            showDislike = offset.width < -130 // Added showDislike animation trigger
                            isDraggingLeft = offset.width < -130
                            isDraggingRight = offset.width > 130
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.bouncy(duration: 0.5, extraBounce: 0.5)) {
                            swipeCard(width: offset.width)
                            changeColor(width: offset.width)
                            showHeart = false
                            showDislike = false // Reset showDislike
                            isDraggingLeft = false
                            isDraggingRight = false
                        }
                    }
            )
        }
    }
    
    func swipeCard(width: CGFloat) {
        switch width {
        case -500...(-150):
            print("\(person) removed")
            offset = CGSize(width: -300, height: 0)
        case 150...300:
            print("\(person) added")
            offset = CGSize(width: 500, height: 0)
        default:
            offset = .zero
        }
    }
    
    func changeColor(width: CGFloat) {
        switch width {
        case -500...(-130):
            color = .red
        case 130...500:
            color = .green
        default:
            color = .black
        }
    }
}

// Preview remains the same

#Preview {
    CardView(person: "Awo Yaa")
        .preferredColorScheme(.dark)
}
