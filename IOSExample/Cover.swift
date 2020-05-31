//
//  Cover.swift
//  IOSExample
//
//  Created by Carlos Alba Gutierrez on 5/30/20.
//  Copyright © 2020 Carlos Alba Gutierrez. All rights reserved.
//

import SwiftUI

struct Cover: View {
    
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
            AsyncImage(url: self.url, placeholder: Image(systemName: "photo"))
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(self.title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                Text(self.artist)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
            }
        } .frame(height: 150)
    }
    
}

struct Cover_Previews: PreviewProvider {
    static var previews: some View {
        Cover(url: URL(string: "https://i.pinimg.com/originals/be/04/41/be044161d94a6368da28ad3f94a5a957.jpg")!, artist: "Petit Biscuit", title: "Sunset Lover")
    }
}
