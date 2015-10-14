//
//  ViewController.swift
//  HangDroidMobile
//
//  Created by Rodrigo Carballo on 9/28/15.
//  Copyright © 2015 Rodrigo Carballo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var winConditionTxt: UITextField!
    @IBOutlet weak var getWordTxt: UITextField!
    @IBOutlet weak var checkLetterTxt: UITextField!
    @IBOutlet weak var getTipTxt: UITextField!
    
    var word = [Word]();

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wildwest.jpg")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func getWord(sender: AnyObject) {
//        fetchWord();
    }
    
//    func fetchWord() {
//        let url = NSURL(string:"http://api.wordnik.com:80/v4/words.json/randomWord?hasDictionaryDef=true&minCorpusCount=10000&maxCorpusCount=-1&minDictionaryCount=20&maxDictionaryCount=-1&minLength=5&maxLength=-1&api_key=b68d7ebcb9910f3b8700c0b331f02428eb2fc4e009e697928");
//        
//        let session = NSURLSession.sharedSession();
//        let task = session.dataTaskWithURL(url!) { data, response, error in
//            if let httpResponse = response as? NSHTTPURLResponse {
//                switch httpResponse.statusCode {
//                case 200..<300:
//                    print("good status: \(httpResponse.statusCode)")
//                    if let unwrappedData = data {
//                        self.handleHTTPResult(.Value(Box(unwrappedData)))
//                    } else {
//                        self.handleHTTPResult(.Error(error))
//                    }
//                default:
//                    print("error occured: \(httpResponse.statusCode)")
//                    self.handleHTTPResult(.Error(error))
//                }
//            }
//        }
//        task.resume();
//        
//    }
    
//    private func handleHTTPResult(result: Result<NSData>) {
//        switch  result {
//        case .Error(let error):
//            print("An error occured: \(error.code)")
//        case .Value(let dataBox):
//            let data = dataBox.value
//            word = parseWord(data:data)
//        }
//    }
    
//    private func parseWord(data data: Nsdata) -> [Word] {
//        var repos = [Word]()
//        
//        if let json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: .allZeros, error: nil),
//        
//    }
}

