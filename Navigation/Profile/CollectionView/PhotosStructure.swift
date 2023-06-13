//
//  PhotosStructure.swift
//  Navigation
//
//  Created by Яна Крюкова on 07.06.2023.
//

import Foundation

struct Photos {
    
    var name: String
    
    static func makePost() -> [Photos] {
        
        var photos = [Photos]()
        
        photos.append(Photos(name: "cat1"))
        photos.append(Photos(name: "cat2"))
        photos.append(Photos(name: "cat3"))
        photos.append(Photos(name: "cat4"))
        photos.append(Photos(name: "cat5"))
        photos.append(Photos(name: "cat6"))
        photos.append(Photos(name: "cat7"))
        photos.append(Photos(name: "cat8"))
        photos.append(Photos(name: "cat9"))
        photos.append(Photos(name: "cat10"))
        photos.append(Photos(name: "cat11"))
        photos.append(Photos(name: "cat12"))
        photos.append(Photos(name: "cat13"))
        photos.append(Photos(name: "cat14"))
        photos.append(Photos(name: "cat15"))
        photos.append(Photos(name: "cat16"))
        photos.append(Photos(name: "cat17"))
        photos.append(Photos(name: "cat18"))
        photos.append(Photos(name: "cat19"))
        photos.append(Photos(name: "cat20"))
        
        return photos
    }
        
}
