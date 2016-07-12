//
//  ViewController.swift
//  radioButtonTest
//
//  Created by namhyun on 2016. 7. 12..
//  Copyright © 2016년 2fworkshop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let SFW_LabelText: [String] = ["SELECTED 1", "SELECTED 2", "SELECTED 3", "NOT SELECT ANYTHING"]
    
    var SFW_selcetValueArray: [Int] = [0, 0, 0]
    
    @IBOutlet var SFW_outputLabel: UILabel!
    @IBOutlet var SFW_buttonBottomIMGArray: Array<UIImageView>!
    @IBOutlet var SFW_buttonLabelArray: Array<UIButton>!

    @IBAction func SFW_buttonTouch(sender: UIButton) {
        self.SFW_checkTag(sender.tag)
    }
    
    //-------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SFW_buttonBottomIMGArraySetup()
        
        // Do any additional setup after loading the view, typically from a nib.
        
    } // viewDidLoad end
    
    //-------------------------------
    
    func SFW_checkTag(buttonTag: Int) {
        
        if self.SFW_selcetValueArray[buttonTag] == 0 {
            self.SFW_buttonValueArrayDefault()
            self.SFW_selcetValueArray[buttonTag] = 1
        } else if self.SFW_selcetValueArray[buttonTag] == 1 {
            self.SFW_selcetValueArray[buttonTag] = 0
        }
        
        self.SFW_buttonControll()
    
    } // SFW_checkTag end
        
    
    func SFW_buttonControll() {
        
        let arrayCount: Int = SFW_selcetValueArray.count - 1
        
        for buttonNum: Int in 0...arrayCount {
            
            if self.SFW_selcetValueArray[buttonNum] == 1 {
                
                self.SFW_buttonBottomIMGArray[buttonNum].layer.backgroundColor = UIColor.blueColor().CGColor
                self.SFW_buttonLabelArray[buttonNum].setTitleColor(UIColor.whiteColor(), forState: .Normal)
                self.SFW_outputLabel.text = self.SFW_LabelText[buttonNum]
                
            } else if self.SFW_selcetValueArray[buttonNum] == 0 {
                
                self.SFW_buttonBottomIMGArray[buttonNum].layer.backgroundColor = UIColor.lightGrayColor().CGColor
                self.SFW_buttonLabelArray[buttonNum].setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
            }
        }
        
        if self.SFW_selcetValueArray[0] == 0 && self.SFW_selcetValueArray[1] == 0 && self.SFW_selcetValueArray[2] == 0 {
            let endLabelIndex: Int = self.SFW_LabelText.count - 1
            self.SFW_outputLabel.text = self.SFW_LabelText[endLabelIndex]
        }
        
    } // SFW_buttonControll
    
    
    func SFW_buttonValueArrayDefault() {
    
        let arrayCount: Int = SFW_selcetValueArray.count - 1
        
        for buttonNum: Int in 0...arrayCount {
            self.SFW_selcetValueArray[buttonNum] = 0
        }
        
    } // SFW_buttonValueArrayDefault end

    
    func SFW_buttonBottomIMGArraySetup() {
        
        let endLabelIndex: Int = self.SFW_LabelText.count - 1
        self.SFW_outputLabel.text = SFW_LabelText[endLabelIndex]
        
        let arrayCount: Int = SFW_buttonBottomIMGArray.count - 1
        
        for buttonNum: Int in 0...arrayCount {
            
            // Button Label
            self.SFW_buttonLabelArray[buttonNum].setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
            
            // Border
            self.SFW_buttonBottomIMGArray[buttonNum].layer.masksToBounds = true
            self.SFW_buttonBottomIMGArray[buttonNum].layer.borderColor = UIColor.whiteColor().CGColor
            self.SFW_buttonBottomIMGArray[buttonNum].layer.backgroundColor = UIColor.lightGrayColor().CGColor
            self.SFW_buttonBottomIMGArray[buttonNum].layer.cornerRadius = 30.0
            self.SFW_buttonBottomIMGArray[buttonNum].layer.borderWidth = 4.0
            
            
            // Shadow
            self.SFW_buttonBottomIMGArray[buttonNum].layer.shadowColor = UIColor.blackColor().CGColor
            self.SFW_buttonBottomIMGArray[buttonNum].layer.shadowOpacity = 1.0
            self.SFW_buttonBottomIMGArray[buttonNum].clipsToBounds = false
            self.SFW_buttonBottomIMGArray[buttonNum].layer.cornerRadius = 30.0
            self.SFW_buttonBottomIMGArray[buttonNum].layer.shadowOffset = CGSizeMake(0.0, 4.0)
            self.SFW_buttonBottomIMGArray[buttonNum].layer.shadowRadius = 4.0
            
        }
        
    } //buttonBottomIMGArraySetup end
    
    
    //-------------------------------

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //-------------------------------
    
} // ViewController end

