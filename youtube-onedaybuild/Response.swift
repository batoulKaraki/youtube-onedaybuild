//
//  Response.swift
//  youtube-onedaybuild
//
//  Created by batoul karaki on 01/09/2022.
//


//THIS TO GET THE WHOLE JSON OBJECT
import Foundation

struct Response:Decodable {
    
    var items:[Video]?
    //
    enum CodingKeys:String, CodingKey {
        
        case items
    }
    //
    init(from decoder: Decoder) throws {
        let container = try  decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
