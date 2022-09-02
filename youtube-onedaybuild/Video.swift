//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by batoul karaki on 01/09/2022.
//

import Foundation

struct Video : Decodable {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case  description
        case thumbnail = "url"
        case videoId
    }
    
    //the program doesnot enter this functions
    
    init(from decoder: Decoder) throws {
        
        print(" in decoder")
        
        let container =  try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse the title
        
        self.title =  try snippetContainer.decode(String.self, forKey: .title)
        //parse the description
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        //parse the published key
        
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        //Parse thumbnails
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //parse the video id
        let resourceIdcontainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdcontainer.decode(String.self, forKey: .videoId)
    }
}
