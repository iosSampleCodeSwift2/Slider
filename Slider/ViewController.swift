//
//  ViewController.swift
//  Slider
//
//  Created by Daesub Kim on 2016. 10. 11..
//  Copyright © 2016년 DaesubKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Properties
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var tf1: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        slider1.value = 50.00
        label1.text = "50.00"
        tf1.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
        label1.text = tf1.text
        slider1.value = tf1.text!.toFloat()
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        print("textFieldShouldReturn")
        textField.resignFirstResponder()
        print(tf1.text!)
        
        return true
    }
    
    
    
    // Actions
    @IBAction func updateLabel(sender: AnyObject) {
        if let slider1 = sender as? UISlider {
            label1.text = String.localizedStringWithFormat("%.2f", slider1.value)
            tf1.text = String.localizedStringWithFormat("%.2f", slider1.value)
        }
    }

}

// extesion 은 존재하는 클래스를 확장하는 기능
extension String {
    func toFloat() -> Float {
        if let unwrappedNum = Float(self) {
            return unwrappedNum
        } else {
            print("Error converting \"" + self + "\" to Float"  )
            return 0.0
        }
    }
}

