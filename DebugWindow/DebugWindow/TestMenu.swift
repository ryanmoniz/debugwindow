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
    
    func didSelectRowAt() {
        
    }
    
    
    static var nib: UINib? {
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
