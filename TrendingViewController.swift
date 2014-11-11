//
//  TrendingViewController.swift
//  tumblr
//
//  Created by Hearsay Guest on 11/10/14.
//  Copyright (c) 2014 John Barkis. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var trendingFeedView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.ContentSize = CGSize(width: 320, height: 1217)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
