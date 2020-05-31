//
//  SingleSongView.swift
//  IOSExample
//
//  Created by Carlos Alba Gutierrez on 5/30/20.
//  Copyright © 2020 Carlos Alba Gutierrez. All rights reserved.
//

import SwiftUI

struct ButtonSongView: View {
    @State private var playing = false
    
    func togglePlaying(){
        if(self.playing) {
            self.playing = false
        }
        else {
            self.playing = true
        }
    }
    
    
    var body: some View {
        Button(action: {
            self.togglePlaying()
        }) {
            Image(self.playing ? "PauseIcon" : "PlayIcon" )
                .resizable()
                .scaledToFit()
        }
        .buttonStyle(PlainButtonStyle())
        .frame(width: 100, height: 100)
    }
}


struct SingleSongView: View {
    
    var url: URL
    var artist: String
    var title: String
    
    
    init(url: URL, artist: String, title: String) {
        self.url = url
        self.artist = artist
        self.title = title
    }
    
    
    var body: some View {
        VStack {
            Text(self.title)
                .font(.title)
                .foregroundColor(.white)
                .fontWeight(.semibold)
            AsyncImage(url: self.url, placeholder: Image(systemName: "photo"))
                .aspectRatio(contentMode: .fit)
                .overlay(ButtonSongView())
            
            Text(self.artist)
                .font(.headline)
                .foregroundColor(.gray)
                .fontWeight(.medium)
                .padding(.bottom)
            Text("I'm baby bespoke direct trade hammock marfa kinfolk slow-carb green juice lyft you probably haven't heard of them wayfarers ramps butcher street art small batch. Swag prism cornhole man braid vape blue bottle godard chillwave migas truffaut gluten-free vexillologist austin disrupt. Kinfolk lo-fi drinking vinegar slow-carb.")
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(.white)
                .padding(.leading)
                .padding(.bottom)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ColorManager.backgroundPrimary.edgesIgnoringSafeArea(.all))
    }
}

struct SingleSongView_Previews: PreviewProvider {
    static var previews: some View {
        SingleSongView(url: URL(string: "https://i.pinimg.com/originals/be/04/41/be044161d94a6368da28ad3f94a5a957.jpg")!, artist: "Petit Biscuit", title: "Sunset Lover")
    }
}
