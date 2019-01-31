//
//  DebugWindowSingleSelectionMenu.swift
//  DebugWindow
//
//  Created by Ryan Moniz on 1/30/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

/// A tuple with a title and an optional subtitle representing a single selection.
public typealias DebugWindowSingleSelection = (title: String, subtitle: String?)

/// A DebugWindowSubmenu implementation used to host a group of single selection.
/// Once provided with initial selection and options, DebugWindow will maintain the selection and present them in a tableview.
open class DebugWindowSingleSelectionMenu: DebugWindowSubmenu {
    
    public let title: String
    
    open var subtitle: String? {
        return availableSelections[selectedIndex].title
    }
    
    open var options: [DebugGenericMenu] {
        return availableSelections.enumerated().map {
            DebugWindowSingleSelectionMenuItem(selection: $0.element,
                                         selected: $0.offset == selectedIndex,
                                         action: selectedAction)
        }
    }
    
    private let availableSelections: [DebugWindowSingleSelection]
    private var selectedIndex: Int
    private var selectedAction: ((DebugWindowSingleSelection) -> Void)?
    
    /// Initialize the YoshiSingleSelectionMenu with title, options, initial selected index,
    /// and the action when one of the options is selected.
    ///
    /// - Parameters:
    ///   - title: Title for the menu.
    ///   - options: Available options under this menu.
    ///   - selectedIndex: Initial selected index among the options.
    ///   - didSelect: Action executed when one of the selection is selected by Yoshi.
    public init(title: String,
                options: [DebugWindowSingleSelection],
                selectedIndex: Int,
                didSelect: ((DebugWindowSingleSelection) -> Void)?) {
        self.title = title
        self.selectedIndex = selectedIndex
        self.availableSelections = options
        self.selectedAction = { [weak self] selectedSelection in
            for (index, selection) in self?.availableSelections.enumerated() ?? [].enumerated() {
                if selectedSelection.title == selection.title && selectedSelection.subtitle == selection.subtitle {
                    self?.selectedIndex = index
                    break
                }
            }
            didSelect?(selectedSelection)
        }
    }
    
}
