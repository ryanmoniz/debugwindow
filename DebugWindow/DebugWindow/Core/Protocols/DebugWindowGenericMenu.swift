//
//  DebugWindowGenericMenu.swift

/**
 Defines an object as a debug menu option
 */
public protocol DebugGenericMenu {
    
    /// Reuse identifier for the cell.
    var cellSource: DebugWindowReusableCellDataSource { get }
    
    /**
     Function to execute when the menu item is seleted.
     
     - returns: A result for handling the selected menu item.
     */
    func execute() -> DebugWindowActionResult
}
