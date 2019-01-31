//
//  DebugWindowSingleSelectionMenuItem.swift
//  DebugWindow
//
//  Created by Ryan Moniz on 1/30/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

/// Internal DebugWindowGenericMenu used for single selection menu.
internal final class DebugWindowSingleSelectionMenuItem: DebugGenericMenu {
    
    var title: String {
        return selection.title
    }
    
    var subtitle: String? {
        return selection.subtitle
    }
    
    private var selected: Bool
    private let selection: DebugWindowSingleSelection
    private var action: ((DebugWindowSingleSelection) -> Void)?
    
    init(selection: DebugWindowSingleSelection,
         selected: Bool,
         action: ((DebugWindowSingleSelection) -> Void)?) {
        self.selection = selection
        self.selected = selected
        self.action = action
    }
    
    var cellSource: DebugWindowReusableCellDataSource {
        return DebugWindowMenuCellDataSource(title: title, subtitle: subtitle, accessoryType: selected ? .checkmark : .none)
    }
    
    func execute() -> DebugWindowActionResult {
        action?(selection)
        return .pop
    }
}
