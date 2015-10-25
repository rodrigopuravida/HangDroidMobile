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
    
    @IBOutlet weak var hangImage: UIImageView!
    @IBOutlet weak var resultsText: UITextField!
    
    //set of lettesrs go here
    
    @IBOutlet weak var txt1: UITextField!
    
    @IBOutlet weak var txt2: UITextField!
    
    @IBOutlet weak var txt3: UITextField!
    
    @IBOutlet weak var txt4: UITextField!
    
    @IBOutlet weak var txt5: UITextField!
    
    @IBOutlet weak var txt6: UITextField!
    
    @IBOutlet weak var txt7: UITextField!
    
    @IBOutlet weak var txt8: UITextField!
    
    @IBOutlet weak var txt9: UITextField!
    
    @IBOutlet weak var txt10: UITextField!
    
    @IBOutlet weak var txt11: UITextField!
    
    @IBOutlet weak var txt12: UITextField!
    
    @IBOutlet weak var txt13: UITextField!
    
    @IBOutlet weak var txt14: UITextField!
    
    
    @IBAction func checkLetter(sender: AnyObject) {
        
        checkGuessedLetter()
        
        print("I clicked on check letter")
    }
    
    //variables *****************************
    var tableData=[String]()
    var letterArray = [UITextField]()
    var numberCorrectGuesses = 0
    var numberMissedGuesses = 0
    var initialImage = "droidL0.jpg"
    
    
    
    
    
    // **************************************

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numberLettersInWord : UInt

        checkLetterTxt.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wildwest.jpg")!)
        
        //we add all the text fields to array here
        letterArray.append(txt1)
        letterArray.append(txt2)
        letterArray.append(txt3)
        letterArray.append(txt4)
        letterArray.append(txt5)
        letterArray.append(txt6)
        letterArray.append(txt7)
        letterArray.append(txt8)
        letterArray.append(txt9)
        letterArray.append(txt10)
        letterArray.append(txt11)
        letterArray.append(txt12)
        letterArray.append(txt13)
        letterArray.append(txt14)
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
                //print(appTitle.string)
            }
        }
        
        //setting the image to blank
        hangImage.image = UIImage(named: "droidLBlank.jpg")
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        checkGuessedLetter()
        
         print("I entered my letter")
        
        return true
    }
    
    
    
    //this restricts the amount of letters that user can input while guessing
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let length = (checkLetterTxt.text?.characters.count)! + string.characters.count
        
        if (length > 1) {
            return false
        }
        else {
            return true
        }
        
    }
    
    func checkGuessedLetter() -> Bool {
        
       
//        print("word to be guessed is")
//        print(self.getWordTxt.text)
//        
//        print("letter entered is")
//        print(checkLetterTxt.text)
        
        let index = checkLetterTxt.text!.startIndex.advancedBy(0)
        checkLetterTxt.text![index]
//        print("this is the letter to be checked after gettign index")
//        print(checkLetterTxt.text![index])
        
        
        //need to do validation here to see if letter is in world
        
        var numberLettersInWord = self.getWordTxt.text?.characters.count
        print("the number of letters in word is")
        print(numberLettersInWord)
        
        //in this next following section we need to figure out if letter guessed exists in the word generate 
        // if so then show th eletter in bottom array where letters are displayed
        // if not then a new image appears as one hangs
        
        //this is the array of characters that used to form the word to be guessed
        var characters = Array(self.getWordTxt.text!.characters)
        
        
        for var counter = 0; counter < self.getWordTxt.text!.characters.count; counter++ {
            if checkLetterTxt.text![index] == characters[counter] {
                numberCorrectGuesses++;
                letterArray[counter].text = checkLetterTxt.text!;
                
                //checking to see if yuo have won
                if numberCorrectGuesses == self.getWordTxt.text!.characters.count {
                    resultsText.text = "YOU HAVE WON"
                }
           }
//            hangImage.image = UIImage(named: "droidL" + String(numberMissedGuesses) + ".jpg");
//            numberMissedGuesses++;
       }
        
        
        
            
//            if self.getWordTxt.text!.rangeOfString(checkLetterTxt.text!) != nil {
//                print("Exists!");
//                
//                var counter = 0;
//                for i in (self.getWordTxt.text?.characters)! {
//                    if i == checkLetterTxt.text![index] {
//                        numberCorrectGuesses++;
//                        letterArray[counter].text = checkLetterTxt.text!;
//                        print(numberCorrectGuesses)
//                        
//                        
//                        //checking to see if yuo have won
//                        if numberCorrectGuesses == self.getWordTxt.text!.characters.count {
//                            resultsText.text = "YOU HAVE WON"
//                        }
//                    counter++;
//                    }
//                }
//
//            } else {
//                
//                hangImage.image = UIImage(named: "droidL" + String(numberMissedGuesses) + ".jpg");
//                numberMissedGuesses++;
//                
//        }
        
        return true
        
    }
    
}

