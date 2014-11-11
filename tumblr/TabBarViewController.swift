//
//  TabBarViewController.swift
//  tumblr
//
//  Created by Hearsay Guest on 11/10/14.
//  Copyright (c) 2014 John Barkis. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var tabView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    var accountViewController: AccountViewController!
    var composeViewController: ComposeViewController!
    var searchViewController: SearchViewController!
    var homeViewController: HomeViewController!
    var trendViewController: TrendViewController!
    
    var currentViewController: UIViewController!
    var currentButton: UIButton!
    
    var isPresenting: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as AccountViewController
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as SearchViewController
        trendViewController = storyboard.instantiateViewControllerWithIdentifier("TrendViewController") as TrendViewController

        contentView.addSubview(homeViewController.view)
        currentViewController = homeViewController
        currentButton = homeButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onTabButton(sender: UIButton) {
        currentButton.selected = false
        currentButton = sender
        currentButton.selected = true
        currentViewController.view.removeFromSuperview()
        
        switch (currentButton.tag) {
        case 2:
            currentViewController = searchViewController
            break;
        case 3:
            currentViewController = accountViewController
            break;
        case 4:
            currentViewController = trendViewController
            break;
        default:
            currentViewController = homeViewController
        }

        contentView.addSubview(currentViewController.view)
        
    }
    
 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }

    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.7
    }


    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            var composeVC = toViewController as ComposeViewController
            composeVC.view.alpha = 0
            
            composeVC.textButton.frame.origin.y = 1400
            composeVC.quoteButton.frame.origin.y = 2800
            composeVC.videoButton.frame.origin.y = 2000
            composeVC.linkButton.frame.origin.y = 1200
            composeVC.photoButton.frame.origin.y = 1700
            composeVC.chatButton.frame.origin.y = 1500
            
            UIView.animateWithDuration(0.7, animations: { () -> Void in
                composeVC.view.alpha = 1
                composeVC.iconView.alpha = 0.7
                composeVC.nevermindButton.alpha = 1
                
                composeVC.textButton.frame.origin.y = 155
                composeVC.quoteButton.frame.origin.y = 155
                composeVC.videoButton.frame.origin.y = 273
                composeVC.linkButton.frame.origin.y = 273
                composeVC.photoButton.frame.origin.y = 155
                composeVC.chatButton.frame.origin.y = 273
                
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.7, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    
    
    
    

}
