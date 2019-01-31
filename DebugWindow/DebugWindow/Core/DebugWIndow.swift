//
//  DebugWIndow.swift
//  DebugWindow
//
//  Created by Ryan Moniz on 1/2/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

public class DebugWindow {
    public static let sharedInstance = DebugWindow()
    
    private var menuItems = [DWGenericMenu]()
    private lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    private var debugVC: DebugTableViewController!
    
    //MARK: - Methods
    public func setup(menuItems:[DWGenericMenu]?) {
        NSLog("DebugWindow init")
        
        //configure swipe action
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedScreen))
        swipeGesture.direction = UISwipeGestureRecognizer.Direction.right
        swipeGesture.numberOfTouchesRequired = 3
        
        if let window = UIApplication.shared.delegate?.window {
            window?.addGestureRecognizer(swipeGesture)
        } else {
            NSLog("ERROR: app has no window defined in AppDelegate????")
        }
    }
    
    public func showDebugView() {
        let sb = UIStoryboard(name: "DebugTableViewController", bundle: nil)
        
        guard let debugNavVC = sb.instantiateInitialViewController() as? UINavigationController else {
            NSLog("ERROR: missing DebugTableViewController storyboard/initalizer")
            return
        }
        
        //configure uipresentationcontroller
        slideInTransitioningDelegate.direction = .left
        slideInTransitioningDelegate.disableCompactHeight = false
        debugNavVC.transitioningDelegate = slideInTransitioningDelegate
        debugNavVC.modalPresentationStyle = .custom
        
        //present debug view
        if let window = UIApplication.shared.delegate?.window {
            window?.rootViewController?.present(debugNavVC, animated: true, completion: nil)
        } else {
            NSLog("ERROR: app has no window defined in AppDelegate????")
        }
    }
    
    @objc private func swipedScreen(swipeGesture:UISwipeGestureRecognizer) {
        NSLog("swipedScreen called")
        
        showDebugView()
    }
}
