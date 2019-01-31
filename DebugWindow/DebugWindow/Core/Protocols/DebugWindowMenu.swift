//
//  DebugWindowMenu.swift
//  DebugWindow
//
//  Created by Ryan Moniz on 1/30/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

/**
 Defines an object as a normal Yoshi style YoshiGenericMenu.
 */
public protocol DebugWindowMenu: DebugGenericMenu {
    
    /// The display name for the menu option.
    var title: String { get }
    
    /// The value for the option. This will be displayed as the subtitle in the menu.
    var subtitle: String? { get }
}

public extension DebugWindowMenu {
    
    /// Default implementation for the cell data source, it will use the system cell with the given title and subtitle
    var cellSource: DebugWindowReusableCellDataSource {
        return DebugWindowMenuCellDataSource(title: title, subtitle: subtitle)
    }
}
