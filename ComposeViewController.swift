//
//  ComposeViewController.swift
//  tumblr
//
//  Created by Hearsay Guest on 11/10/14.
//  Copyright (c) 2014 John Barkis. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var nevermindButton: UIButton!
    @IBOutlet weak var nevermindView: UIView!
    @IBOutlet weak var iconView: UIView!
    
    var textButtonY: CGFloat!
    var photoButtonY: CGFloat!
    var quoteButtonY: CGFloat!
    var linkButtonY: CGFloat!
    var chatButtonY: CGFloat!
    var videoButtonY: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textButton.frame.origin.y = 155
        photoButton.frame.origin.y = 155
        quoteButton.frame.origin.y = 155
        linkButton.frame.origin.y = 273
        chatButton.frame.origin.y = 273
        videoButton.frame.origin.y = 273
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onNevermindButton(sender: UIButton) {
        textButtonY = textButton.frame.origin.y - 568
        photoButtonY = photoButton.frame.origin.y - 700
        quoteButtonY = quoteButton.frame.origin.y - 1000
        linkButtonY = linkButton.frame.origin.y - 1200
        chatButtonY = chatButton.frame.origin.y - 1500
        videoButtonY = videoButton.frame.origin.y - 2000
        
        UIView.animateWithDuration(0.7, animations: { () -> Void in
            self.photoButton.frame.origin.y = self.photoButtonY
            self.chatButton.frame.origin.y = self.chatButtonY
        })
        
        UIView.animateWithDuration(0.7, delay: 0.1, options: nil, animations: { () -> Void in
            self.videoButton.frame.origin.y = self.videoButtonY
            self.quoteButton.frame.origin.y = self.quoteButtonY
        }, completion: nil)
        
        UIView.animateWithDuration(0.7, delay: 0.2, options: nil, animations: { () -> Void in
            self.linkButton.frame.origin.y = self.linkButtonY
            self.textButton.frame.origin.y = self.textButtonY
            }, completion: nil)
        
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
   
    

}
