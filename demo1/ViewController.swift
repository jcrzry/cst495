//
//  ViewController.swift
//  demo1
//
//  Created by jcrzry on 9/12/17.
//  Copyright © 2017 jcrzry. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    var searchText : String!
    var doneEditing : Bool!
    var images: [gettyImg] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchBar.delegate = self
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    func searchBarTextDidEndEditing(_: UISearchBar){
        
        searchText = searchBar.text
    }
    func searchBarSearchButtonClicked(_: UISearchBar){
        self.searchText = searchBar.text
        let alert = UIAlertController(title: "View Results", message: "Continue to image results?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Go", style: UIAlertActionStyle.default, handler: {(alert: UIAlertAction!) in self.performSegue(withIdentifier: "segueToDisplay", sender: self)}))
        self.present(alert, animated: true, completion: nil)
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToDisplay"{
            if let destination = segue.destination as? DisplayViewController{
                destination.searchText = self.searchText
            }
        }

    }
}

