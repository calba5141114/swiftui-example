//
//  ContentView.swift
//  IOSExample
//
//  Created by Carlos Alba Gutierrez on 5/30/20.
//  Copyright © 2020 Carlos Alba Gutierrez. All rights reserved.
//

import SwiftUI

struct MusicDataObject {
    var url: URL
    var artist: String
    var title: String
}

let data = [
    MusicDataObject(url: URL(string: "https://i.redd.it/37ry0mutqhn21.jpg")!, artist: "Nav", title: "Bad Habits" ),
    MusicDataObject(url: URL(string: "https://i.pinimg.com/originals/be/04/41/be044161d94a6368da28ad3f94a5a957.jpg")!, artist: "Petit Biscuit", title: "Sunset Lover" ),
    MusicDataObject(url: URL(string: "https://f4.bcbits.com/img/a3817413205_10.jpg")!, artist: "Alaclair Ensemble", title: "QDBV" ),
    MusicDataObject(url: URL(string: "https://scontent-sjc3-1.cdninstagram.com/v/t51.2885-15/sh0.08/e35/s640x640/95266825_712207749606954_61108540069085131_n.jpg?_nc_ht=scontent-sjc3-1.cdninstagram.com&_nc_cat=106&_nc_ohc=e4ExB-nDYrsAX_qvHqp&oh=dcd92ef6ae5c755f7396963f43ea8bd1&oe=5EFD11D8")!, artist: "Clubhouse", title: "Weekend" ),
]

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Bushwik pop-up")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(data, id: \.title){ DataObject in
                            NavigationLink(destination: SingleSongView(url: DataObject.url, artist: DataObject.artist, title: DataObject.title)) {
                                Cover(url: DataObject.url, artist: DataObject.artist, title: DataObject.title)
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                } .frame(height: 150)
                    .padding(.leading)
                    .padding(.bottom)
                Text("I'm baby bespoke direct trade hammock marfa kinfolk slow-carb green juice lyft you probably haven't heard of them wayfarers ramps butcher street art small batch. Swag prism cornhole man braid vape blue bottle godard chillwave migas truffaut gluten-free vexillologist austin disrupt. Kinfolk lo-fi drinking vinegar slow-carb. Prism next level sartorial, shabby chic meditation tumblr cornhole franzen vegan air plant palo santo iceland microdosing. Schlitz +1 retro, banh mi bespoke YOLO enamel pin synth. Coloring book pok pok scenester, intelligentsia readymade pop-up paleo dreamcatcher ennui taiyaki poutine viral bespoke mustache.")
                    .font(.body)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .padding(.leading)
                
                
                Button(action: {
                    self.showingAlert = true
                }) {
                    Text("Show Alert")
                        .foregroundColor(ColorManager.lavenderButton)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Alert Title"), message: Text("My Alert Msg"), dismissButton: .default(Text("Ok")))
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.top)
                
                
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(ColorManager.backgroundPrimary.edgesIgnoringSafeArea(.all))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
