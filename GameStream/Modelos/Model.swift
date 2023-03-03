//
//  Model.swift
//  GameStream
//
//  Created by Michael Araujo on 2023-03-02.
//

import Foundation

struct Games: Codable {
    
    
    var games:[Game]
    
    
}

struct Game:Codable {
    
    var title          :String
    var studio         :String
    var contentRaiting :String
    var publicationYear:String
    var description    :String
    var platforms      :[String]
    var tags           :[String]
    var videosUrls     :videoUrl
    var galleryImages  :[String]
    
}


struct videoUrl:Codable {
    
    var mobile :String
    var tablet :String
    
}
