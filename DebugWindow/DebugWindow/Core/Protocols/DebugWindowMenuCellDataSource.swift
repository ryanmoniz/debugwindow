//
//  DebugWindowMenuCellDataSource.swift
//  DebugWindow
//
//  Created by Ryan Moniz on 1/30/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

/// A normal cell data source defining the layout for YoshiMenu's cell.
/// By default it helps dequeue a system UITableViewCell with the given title, subtitle and the accessoryType.
public struct DebugWindowMenuCellDataSource: DebugWindowReusableCellDataSource {
    
    private let title: String
    
    private let subtitle: String?
    
    private let accessoryType: UITableViewCell.AccessoryType
    
    /// Initalize the DebugWindowMenuCellDataSource instance
    ///
    /// - Parameters:
    ///   - title: Main title for the cell
    ///   - subtitle: Subtitle for the cell
    public init(title: String, subtitle: String?, accessoryType: UITableViewCell.AccessoryType = .none) {
        self.title = title
        self.subtitle = subtitle
        self.accessoryType = accessoryType
    }
    
    public func cellFor(tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DebugWindowMenuCellDataSource.reuseIdentifier) ??
            UITableViewCell(style: .subtitle, reuseIdentifier: DebugWindowMenuCellDataSource.reuseIdentifier)
        
        cell.textLabel?.text = title
        cell.detailTextLabel?.text = subtitle
        
        cell.accessoryType = accessoryType
        
        return cell
    }
}
