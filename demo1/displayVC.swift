//
//  displayVC.swift
//  demo1
//
//  Created by jcrzry on 9/15/17.
//  Copyright © 2017 jcrzry. All rights reserved.
//

import UIKit
import SKPhotoBrowser
class DisplayViewController: UIViewController {
    
    
    //var passedJSON: JSON;
    var images: [gettyImg] = []
    var searchText: String!
    var imgUrls = [SKPhoto]()
    	
    override func viewDidLoad() {
        super.viewDidLoad()
        print("DISPLAY CONTROLLER\n")
        print(searchText)
        searchAPI(searchText: searchText)

    }
    
    func searchAPI(searchText : String){
        print("inside search api")
        //initialize additional headers to be used in config
        let headers = [
            "API-Key" : "sy3238q9x4k27edjk5n7grt9"]
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = headers
        //init session with set configuration
        let session = URLSession(configuration: config)
        //append api url with the
        let searchableURL = "https://api.gettyimages.com/v3/search/images?phrase=" + searchText
        
        let url = URL(string: searchableURL)
        let task = session.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if error != nil{
                print(error!)
            }else{
                do {
                    if let jsonResponse = try JSONSerialization.jsonObject(with: data!,options: .allowFragments) as? [String: Any]{
                        //print(jsonResponse)
                        //var taskImages: [gettyImg] = []
                        for i in (jsonResponse["images"] as? [[String:Any]])!{
                            let dimensions = i["display_sizes"] as! [[String:Any]]
                            let imgUrl = dimensions[0]["uri"]!
                            let cap: String
                            if i["caption"] is NSNull{
                                cap = "None"
                            }else{
                                cap = i["caption"] as! String
                            }
                            let temp = gettyImg(title: i["title"] as! String,url: imgUrl as! String,id: Int((i["id"] as! NSString).intValue),caption: cap)
                            self.images.append(temp)
                            let photo = SKPhoto.photoWithImageURL(imgUrl as! String)
                            photo.caption = cap
                            self.imgUrls.append(photo)
                            
                            //print(self.images)
                            //print("Size of images inside", self.images.count)
                        }
                        //self.images = taskImages
                        let browser = SKPhotoBrowser(photos: self.imgUrls)
                        browser.initializePageIndex(0)
                        self.present(browser, animated: true, completion: {})
                    }
                }catch{
                    print("error in json")
                }
                
            }
        })
        task.resume()
        print("size of images: ",self.images.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
