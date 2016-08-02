//
//  AnswersModel.swift
//  Demo
//
//  Created by Kunal Gupta on 02/08/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit
import SwiftyJSON


class AnswersModel: NSObject {

    
    var strScore:String?
    var strAnswer:String?
    var strAuthorImage:String?
    var strAuthorName:String?

    class func changeDictionaryToUserArray(userDict : Dictionary<String,JSON>)->AnyObject{
        let userValues = AnswersModel(dict: userDict)
        return userValues
    }
    
    
    init(dict : Dictionary<String,JSON>) {
        
        let authorDict : [String:JSON]
        authorDict = dict["owner"]!.dictionaryValue
        

        strScore = dict["score"]?.stringValue
        strAnswer = dict["body"]?.stringValue
        strAuthorImage = authorDict["profile_image"]?.stringValue
        strAuthorName = authorDict["display_name"]?.stringValue
    }
    
    override init() {
        super.init()
    }
    
    static func changeDictToUserArray(array1 : [JSON] ) -> AnyObject{
        var tempArr : [AnswersModel] = []
        for dict in array1 {
            let placeValues = AnswersModel(dict: dict.dictionaryValue)
            tempArr.append(placeValues)
        }
        return tempArr
    }
    

    
}
