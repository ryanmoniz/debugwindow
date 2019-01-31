//
//  TestMenu.swift
//  DebugWindow
//
//  Created by Ryan Moniz on 1/30/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

/// A menu with custom UI.
internal struct TestMenu: DWGenericMenu {
    
    var reuseIdentifier: String {
        return "TestCellIdentifier"
    }
    
    func didSelectRowAt(navigationController:UINavigationController) {
        let testVC = TestViewController(nibName: "TestViewController", bundle: nil)
        //let testVC = Bundle.main.loadNibNamed("TestViewController", owner: self, options: nil)[0] as? TestViewController

        navigationController.pushViewController(testVC, animated: true)
    }
    
    
    var nib: UINib? {
        return UINib(nibName: "TestCell", bundle: nil)
    }
    
    func cellFor(tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestCellIdentifier") as? TestCell else {
            fatalError()
        }
        cell.textLabel?.text = "Show Test"

        return cell
    }

}

/// A custom UITableViewCell.
internal final class TestCell: UITableViewCell {
    //using basic
}
