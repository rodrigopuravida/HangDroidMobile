//
//  ViewController.swift
//  HangDroidMobile
//
//  Created by Rodrigo Carballo on 9/28/15.
//  Copyright © 2015 Rodrigo Carballo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var winConditionTxt: UITextField!
    @IBOutlet weak var getWordTxt: UITextField!
    @IBOutlet weak var checkLetterTxt: UITextField!
    @IBOutlet weak var getTipTxt: UITextField!
    
    
    var tableData=[String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLetterTxt.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wildwest.jpg")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func getWord(sender: AnyObject) {
        
        print("I am at getWord - wtf")
        
        DataManager.getDataFromWordNikSiteWithSuccess { (wordData) -> Void in
            
            let json = JSON(data: wordData)
            
                let appTitle = json["word"]
                //print (appTitle)
            
            //do this on main queue otherwise we are hosed with a crash
            dispatch_async(dispatch_get_main_queue()) {
                self.getWordTxt.text = appTitle.string
                print(appTitle.string)
            }
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("I entered my letter")
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let length = (checkLetterTxt.text?.characters.count)! + string.characters.count
        
        if (length > 1) {
            return false
        }
        else {
            return true
        }
        
    }
    
}

