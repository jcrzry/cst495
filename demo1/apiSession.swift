//
//  apiSession.swift
//  demo1
//
//  Created by jcrzry on 9/13/17.
//  Copyright © 2017 jcrzry. All rights reserved.
//

import Foundation

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)
let url = URL(string: "https://api.gettyimages.com/v3/search/images")

let task = session.dataTask(with: url!, completionHandler: {
    (data, response, error) in
    if error != nil{
        print(error!)
    }else{
        do {
            if let jsonResponse = try JSONSerialization.jsonObject(with: data!,options:[]) as? [String: Any]{
                print(jsonResponse)
                for img in jsonResponse{
                    print(img)
                }
            }
        }catch{
            print("error in json")
        }
        
    }
})
//ssstask.resume()
