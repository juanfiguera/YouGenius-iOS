//
//  FirstViewController.swift
//  YouGenius
//
//  Created by Juan Figuera on 10/30/14.
//  Copyright (c) 2014 Central Park Labs, LLC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var input: UITextField!
    
    @IBOutlet var notificationLabel: UILabel!
    
    @IBAction func addToPlaylist(sender: AnyObject) {
        var url = NSURL(string: "https://yougenius.herokuapp.com/add_to_playlist.js")
        var request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        
        var song = input.text
        var dataString = "search=\(song)"
        let data = (dataString as NSString).dataUsingEncoding(NSUTF8StringEncoding)
        var requestBodyData: NSData = data!
        
        request.HTTPBody = requestBodyData
        
        var connection = NSURLConnection(request: request, delegate: self, startImmediately: false)
        
        connection?.start()
        
        notificationLabel.text = "Successfully added \(song)!"
        input.text = ""
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        input.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

