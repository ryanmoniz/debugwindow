//
//  ViewController.swift
//  DebugWindow
//
//  Created by Ryan Moniz on 1/2/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit
import DebugWindowKit

class ViewController: UIViewController {

    @IBOutlet weak var revealMenuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func revealAction(_ sender: Any) {
        DebugWindow.sharedInstance.showDebugView()
    }
    
}

