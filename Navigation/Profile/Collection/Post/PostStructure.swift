//
//  PostStructure.swift
//  Navigation
//
//  Created by Яна Крюкова on 09.04.2023.
//

import Foundation
import UIKit

struct Post {
    
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    static func makePost() -> [Post] {
        var post = [Post]()
        post.append(Post(author: "Grumpy&myOwner", description: "Happy birthday to me", image: "pub4", likes: 100, views: 900))
        post.append(Post(author: "Grumpy", description: "Hello there", image: "pub1", likes: 40, views: 60))
        post.append(Post(author: "Grumpy", description: "just a random photo", image: "pub5", likes: 30, views: 50))
        post.append(Post(author: "Grumpy&HatBrand", description: "Look at my fantastic hat", image: "pub2", likes: 70, views: 100))
        post.append(Post(author: "Grumpy", description: "lookin grumpy as usual", image: "pub3", likes: 49, views: 100))
        
        return post
    }
}
