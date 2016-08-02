//
//  ApiCaller.swift
//  GoHobo
//
//  Created by CBL24pc on 4/9/16.
//  Copyright © 2016 GCode. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ApiCaller: NSObject {
    
    static var dicti:[String:AnyObject]?
    
    class func sendUserDetailsOfHoboSignUp(url:String,success:(AnyObject)->(),failure: (NSError)->(), dict:[String:AnyObject],method:String, img:UIImage?){
        dicti = dict
        HttpManager.callApiWithParameters(url, withParameters: dicti!, success: { (data) -> () in
            let response = data
            success(response)
            }, failure: { (error) -> () in
                 failure(error)
                print(error)
            }, method: method, img:img)
    }
}
