//
//  DebugWindowSubmenu.swift
//  DebugWindow
//
//  Created by Ryan Moniz on 1/30/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

/// A submenu that contains an array of options.
/// Once selected, will push the navigation stack to display these options.
public protocol DebugWindowSubmenu: DebugWindowMenu {
    
    /// Options for the submenu to display.
    var options: [DebugGenericMenu] { get }
    
}

public extension DebugWindowSubmenu {
    
    func execute() -> DebugWindowActionResult {
        let sb = DebugTableViewController.DebugTableViewControllerStoryboard()
        
        if let debugVC = sb.instantiateInitialViewController() as? DebugTableViewController {
            debugVC.setup(options: options, isRootMenu: false, completion: nil)
            
            debugVC.title = self.title
            return .push(debugVC)
        } else {
            NSLog("ERROR: missing DebugTableViewController storyboard/initalizer")
        }
        return .push(sb.instantiateInitialViewController() ?? UIViewController())
    }
    
    var cellSource: DebugWindowReusableCellDataSource {
        return DebugWindowMenuCellDataSource(title: title, subtitle: subtitle, accessoryType: .disclosureIndicator)
    }
    
}
