//
//  TestViewController.swift
//  DebugWindow
//
//  Created by Ryan Moniz on 1/30/19.
//  Copyright © 2019 Ryan Moniz. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    var picker = UIPickerView()
    var pickerData  = ["test/1", "test/2", "test/3", "test/4", "test/5","test/6", "test/7"]
    var actionView: UIView = UIView()
    var window: UIWindow? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let delegate = UIApplication.shared
        let myWindow: UIWindow? = delegate.keyWindow
        let myWindow2: NSArray = delegate.windows as NSArray
        
        if let myWindow: UIWindow = myWindow {
            window = myWindow
        }
        else {
            window = myWindow2[0] as? UIWindow
        }
        
        picker.backgroundColor = UIColor.white
        actionView.frame = CGRect(x:0, y:UIScreen.main.bounds.size.height, width:UIScreen.main.bounds.size.width, height:260.0)

    }

    @IBAction func testAction(_ sender: Any) {
        NSLog("a button was clicked!!!")
        self.openPicker(sender: sender as! UIButton)
    }
    
    @IBAction func openPicker(sender : UIButton)
    {
        let kSCREEN_WIDTH  = UIScreen.main.bounds.size.width
        
        picker.frame = CGRect(x:0.0, y:44.0,width:kSCREEN_WIDTH, height:216.0)
        picker.dataSource = self
        picker.delegate = self
        picker.showsSelectionIndicator = true;
        picker.backgroundColor = UIColor.white
        
        let pickerDateToolbar = UIToolbar(frame: CGRect(x:0, y:0, width:kSCREEN_WIDTH, height:44))
        pickerDateToolbar.barStyle = UIBarStyle.black
        pickerDateToolbar.barTintColor = UIColor.black
        pickerDateToolbar.isTranslucent = true
        
        let barItems = NSMutableArray()
        
        var flexSpace1: UIBarButtonItem
        flexSpace1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: self, action: nil)
        flexSpace1.width = 10
        barItems.add(flexSpace1)
        
        let labelCancel = UILabel()
        labelCancel.text = "Cancel"
        let titleCancel = UIBarButtonItem(title: labelCancel.text, style: UIBarButtonItem.Style.plain, target: self, action: #selector(TestViewController.cancelPickerSelectionButtonClicked(sender:)))
        barItems.add(titleCancel)
        
        var flexSpace2: UIBarButtonItem
        flexSpace2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        barItems.add(flexSpace2)
        
        picker.selectRow(1, inComponent: 0, animated: false)
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(TestViewController.doneClicked(sender:)))
        barItems.add(doneBtn)
        
        var flexSpace3: UIBarButtonItem
        flexSpace3 = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fixedSpace, target: self, action: nil)
        flexSpace3.width = 10
        barItems.add(flexSpace3)
        
        pickerDateToolbar.setItems((barItems as! [UIBarButtonItem]), animated: true)
        
        actionView.addSubview(pickerDateToolbar)
        actionView.addSubview(picker)
        
        if (window != nil) {
            window!.addSubview(actionView)
        }
        else
        {
            self.view.addSubview(actionView)
        }
        
        UIView.animate(withDuration: 0.2) {
            self.actionView.frame = CGRect(x:0, y:UIScreen.main.bounds.size.height - 260.0, width:UIScreen.main.bounds.size.width, height:260.0)
        }
    }
    
    @objc func cancelPickerSelectionButtonClicked(sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.2
            , animations: {
                self.actionView.frame = CGRect(x:0, y:UIScreen.main.bounds.size.height, width:UIScreen.main.bounds.size.width, height:260.0)
        }) { (_) in
            for obj: AnyObject in self.actionView.subviews {
                if let view = obj as? UIView
                {
                    view.removeFromSuperview()
                }
            }
        }
    }
    
    @objc func doneClicked(sender: UIBarButtonItem) {
        _ = picker.selectedRow(inComponent: 0)

        UIView.animate(withDuration: 0.2, animations: {
            self.actionView.frame = CGRect(x:0, y:UIScreen.main.bounds.size.height, width:UIScreen.main.bounds.size.width, height:260.0)
        }) { (_) in
            for obj: AnyObject in self.actionView.subviews {
                if let view = obj as? UIView
                {
                    view.removeFromSuperview()
                }
            }
        }
    }

}

extension TestViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK - Picker delegate
    
    func pickerView(_ _pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
}
