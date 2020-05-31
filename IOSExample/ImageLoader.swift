//
//  ImageLoader.swift
//  IOSExample
//
//  Created by Carlos Alba Gutierrez on 5/30/20.
//  Copyright © 2020 Carlos Alba Gutierrez. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct AsyncImage<PlaceHolder: View>: View {
    @ObservedObject private var loader: ImageLoader
    private let placeholder: PlaceHolder?
    
    init(url:URL, placeholder: PlaceHolder? = nil ){
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }
    
    var body: some View {
        image
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            }
            else {
                placeholder
            }
        }
    }
}

class ImageLoader: ObservableObject{
    
    @Published var image: UIImage?
    private let url: URL
    
    init(url: URL){
        self.url = url
    }
    
    private var cancellable: AnyCancellable?
    
    deinit {
        cancellable?.cancel()
    }
    
    func load(){
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    func cancel(){
        cancellable?.cancel()
    }
}
