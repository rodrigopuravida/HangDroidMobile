//
//  DataManager.swift
//  HangDroidMobile
//
//  Created by Rodrigo Carballo on 10/14/15.
//  Copyright © 2015 Rodrigo Carballo. All rights reserved.
//


import Foundation

let wordNikUrl = "http://api.wordnik.com:80/v4/words.json/randomWord?hasDictionaryDef=true&minCorpusCount=10000&maxCorpusCount=-1&minDictionaryCount=20&maxDictionaryCount=-1&minLength=5&maxLength=-1&api_key=b68d7ebcb9910f3b8700c0b331f02428eb2fc4e009e697928"

class DataManager {
    
    class func getDataFromMockySiteWithSuccess(success: ((worddata: NSData!) -> Void)) {
        //1
        loadDataFromURL(NSURL(string: wordNikUrl)!, completion:{(data, error) -> Void in
            //2
            if let urlData = data {
                //            print(data)
                //3
                success(worddata: urlData)
            }
        })
    }
    
    
    class func loadDataFromURL(url: NSURL, completion:(data: NSData?, error: NSError?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        // Use NSURLSession to get data from an NSURL
        let loadDataTask = session.dataTaskWithURL(url, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if let responseError = error {
                completion(data: nil, error: responseError)
            } else if let httpResponse = response as? NSHTTPURLResponse {
                print(httpResponse.statusCode)
                if httpResponse.statusCode != 200 {
                    let statusError = NSError(domain:"com.rodrigocarballo", code:httpResponse.statusCode, userInfo:[NSLocalizedDescriptionKey : "HTTP status code has unexpected value."])
                    completion(data: nil, error: statusError)
                } else {
                    
                    completion(data: data, error: nil)
                }
            }
        })
        
        loadDataTask.resume()
    }
}

