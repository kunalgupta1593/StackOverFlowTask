 
 //
 //  ApiDetector.swift
 //  GoHobo
 //
 //  Created by CBL24pc on 4/9/16.
 //  Copyright © 2016 GCode. All rights reserved.
 //
 
 import UIKit
 import SwiftyJSON
 
 class ApiDetector: NSObject {
    
    //Mark::- Variables
    
    static var SingleUserArray: AnyObject? = ""
    
    //Mark::- Class Functions
    class func getDataOfURL(url: String,dict: NSDictionary, failure: (NSError) ->(), success:(AnyObject)->(), method:String, viewControl: UIViewController, pic: UIImage){
        
        ApiCaller.sendUserDetailsOfHoboSignUp(url, success: { (response) -> () in
                success(response)

            }, failure: { (error) -> () in
                failure(error)

            }, dict: (dict as? [String : AnyObject])! , method: method, img:pic)
    }
    

    

    
 }
