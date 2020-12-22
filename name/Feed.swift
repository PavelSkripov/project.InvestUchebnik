//
//  Feed.swift
//  ИнвестУчебник
//
//  Created by Павел on 19.12.2020.
//

import Foundation
import UIKit

class Feed: Codable {

    public var cover: String
    public var bigText: String
    public var title: String
    public var subtitle: String
    public var subtitle2: String
    public var picture: String
   
    init(data d: [String:Any]) {
        self.cover = d["cover"] as! String
       self.bigText = d["bigText"] as! String
       self.title = d["title"] as! String
        self.subtitle = d["subtitle"] as! String
        self.subtitle2 = d["subtitle2"] as! String
        self.picture = d["picture"] as! String
    }
    
    private enum CodingKeys: String, CodingKey {
        case cover = "cover"
        case bigText = "bigText"
        case title = "title"
        case subtitle = "subtitle"
        case subtitle2 = "subtitle2"
        case picture = "picture"
    }
   

}
 
