//
//  gettyImg.swift
//  demo1
//
//  Created by jcrzry on 9/16/17.
//  Copyright © 2017 jcrzry. All rights reserved.
//

import Foundation

class gettyImg{
    var title = "title"
    //var dimensions = (height: 0, width: 0)
    var url = "no url"
    var id = 0
    var caption = "no cap"
}
extension gettyImg{
    convenience init(title: String,url: String,id: Int,caption: String){
        self.init()
        self.title = title
        //self.dimensions = dimensions
        self.id = id
        self.caption = caption
        self.url = url
    }
}

extension gettyImg{
    convenience init?(json: [String: Any]){
        self.init()
        guard let title = json["title"] as? String,
        //let dimensionsJSON = json["max_dimensions"] as? [String: Int],
        //let height = dimensionsJSON["height"],
        //let width = dimensionsJSON["width"],
        let id = json["id"],
        let caption = json["caption"],
        let jsonSizes = json["display_sizes"] as? [String: Any?],
        let url = jsonSizes["uri"]
        else{
                return nil
        }
        self.title = title
        //self.dimensions = (height, width)
        self.id = (id as? Int)!
        self.url = (url as? String)!
        self.caption = (caption as? String ?? "No Caption")!
    }
    
}
