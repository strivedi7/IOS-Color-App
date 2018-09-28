//
//  ViewController.swift
//  Saurabh_Trivedi_Assignment2
//
//  Created by Trivedi on 9/11/18.
//  Copyright © 2018 Saurabh Trivedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redvalue: UITextField!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenValue: UITextField!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueValue: UITextField!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var viewColor: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let red = UserDefaults.standard.object(forKey: "redvalue"), let green = UserDefaults.standard.object(forKey: "greenValue"),let blue = UserDefaults.standard.object(forKey: "blueValue"){
            redSlider.setValue(Float(red as! String)!, animated: true)
            greenSlider.setValue(Float(green as! String)!, animated: true)
            blueSlider.setValue(Float(blue as! String)!, animated: true)            
            redvalue.text = red as? String
            greenValue.text = green as? String
            blueValue.text = blue as? String
            viewColor.backgroundColor = UIColor(red: CGFloat(Int(redvalue.text!)!)/100, green: CGFloat(Int(greenValue.text!)!)/100, blue: CGFloat(Int(blueValue.text!)!)/100, alpha: 1)
        }
    }
    
    @IBAction func onSliderChangeValue(sender: AnyObject) {
        redvalue.text = String(Int(redSlider.value))
        greenValue.text = String(Int(greenSlider.value))
        blueValue.text = String(Int(blueSlider.value))
        UserDefaults.standard.set(redvalue.text, forKey: "redvalue")
        UserDefaults.standard.set(greenValue.text, forKey: "greenValue")
        UserDefaults.standard.set(blueValue.text, forKey: "blueValue")
        viewColor.backgroundColor = UIColor(red: CGFloat(redSlider.value)/100, green: CGFloat(greenSlider.value)/100, blue: CGFloat(blueSlider.value)/100, alpha: 1)
    }
    
    @IBAction func onButtonClick(_ sender: UIButton){
        viewColor.backgroundColor = UIColor(red: CGFloat(Int(redvalue.text!)!)/100, green: CGFloat(Int(greenValue.text!)!)/100, blue: CGFloat(Int(blueValue.text!)!)/100, alpha: 1)
        UserDefaults.standard.set(redvalue.text, forKey: "redvalue")
        UserDefaults.standard.set(greenValue.text, forKey: "greenValue")
        UserDefaults.standard.set(blueValue.text, forKey: "blueValue")
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        self.view.endEditing(true)
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            print(currentPoint)
            viewColor.center = currentPoint
        }
    }


}

