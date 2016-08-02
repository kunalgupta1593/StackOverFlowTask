//
//  HttpManager.swift
//  GoHobo
//
//  Created by CBL24pc on 4/9/16.
//  Copyright © 2016 GCode. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HttpManager: NSObject {
    class func callApiWithParameters(url: String , withParameters parameters:[String:AnyObject], success:(AnyObject)->(), failure: (NSError)->(), method: String, img: UIImage?){

        if(method == "post"){
            Alamofire.request(.POST, url,parameters:parameters,encoding: ParameterEncoding.URL,headers: nil).responseJSON {
                response in switch response.result{
                case .Success(let data):
                    success(data)
                    
                case .Failure(let error):
                    failure(error)
                }
            }
        }
        else{
            
            Alamofire.request(.GET, url).responseJSON { response
                in switch response.result{
                case .Success(let data):
                    success(data)
                case .Failure(let error):
                    failure(error)
                }
            }
        }
    }
    
    
    
    
//    class func postFileWithParameters(path : String , paramerters : [String : AnyObject] , profilePic : UIImage?, success : (AnyObject?) -> () , failure : (NSError) -> ()){
//        let manager = AFHTTPSessionManager()
//        manager.responseSerializer = AFHTTPResponseSerializer()
//        manager.POST(path, parameters: paramerters, constructingBodyWithBlock: { (formData) -> Void in
//            
//            if let ppic = profilePic,data = UIImageJPEGRepresentation(ppic, 0.5){
//                formData.appendPartWithFileData(data, name:"image" , fileName:"temp.png" , mimeType: "image/png")
//            }
//            }, success: { (operation, response) -> Void in
//                print("success block")
//                do{
//                    success( try NSJSONSerialization.JSONObjectWithData(response as! NSData, options: .MutableLeaves))
//                }catch{
//                    
//                }
//            }) { (operation, error) -> Void in
//                failure(error)
//        }
//    }
    
    
    
}
