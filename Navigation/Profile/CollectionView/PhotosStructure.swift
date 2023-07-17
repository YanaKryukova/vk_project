//
//  PhotosStructure.swift
//  Navigation
//
//  Created by Яна Крюкова on 07.06.2023.
//

import Foundation

struct Photos {
    
    var image: String
    
    static func makePost() -> [Photos] {
        
        var photos = [Photos]()
        
        photos.append(Photos(image: "cat1"))
        photos.append(Photos(image: "cat2"))
        photos.append(Photos(image: "cat3"))
        photos.append(Photos(image: "cat4"))
        photos.append(Photos(image: "cat5"))
        photos.append(Photos(image: "cat6"))
        photos.append(Photos(image: "cat7"))
        photos.append(Photos(image: "cat8"))
        photos.append(Photos(image: "cat9"))
        photos.append(Photos(image: "cat10"))
        photos.append(Photos(image: "cat11"))
        photos.append(Photos(image: "cat12"))
        photos.append(Photos(image: "cat13"))
        photos.append(Photos(image: "cat14"))
        photos.append(Photos(image: "cat15"))
        photos.append(Photos(image: "cat16"))
        photos.append(Photos(image: "cat17"))
        photos.append(Photos(image: "cat18"))
        photos.append(Photos(image: "cat19"))
        photos.append(Photos(image: "cat20"))
        
        return photos
    }
        
}
