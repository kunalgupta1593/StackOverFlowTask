//
//  QuestionModel.swift
//  Demo
//
//  Created by Kunal Gupta on 02/08/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit
import SwiftyJSON

class QuestionModel: NSObject {

    
    var strViewCount:String?
    var strAnswerCount:String?
    var strScore:String?
    var strLink:String?
    var strTitle:String?
    var strQuestionID:String?
    var strIsAnswered:String?
    var strAuthorImage:String?
    var strAuthorName:String?
    var strQuestion:String?

    class func changeDictionaryToUserArray(userDict : Dictionary<String,JSON>)->AnyObject{
        let userValues = QuestionModel(dict: userDict)
        return userValues
    }
    
    
    init(dict : Dictionary<String,JSON>) {
        
        let authorDict : [String:JSON]
        authorDict = dict["owner"]!.dictionaryValue
        
        strIsAnswered = dict["is_answered"]?.stringValue
        strViewCount = dict["view_count"]?.stringValue
        strAnswerCount = dict["answer_count"]?.stringValue
        strScore = dict["score"]?.stringValue
        strLink = dict["link"]?.stringValue
        strQuestion = dict["body"]?.stringValue
        strQuestionID = dict["question_id"]?.stringValue
        strTitle = dict["title"]?.stringValue
        strAuthorImage = authorDict["profile_image"]?.stringValue
        strAuthorName = authorDict["display_name"]?.stringValue
    }
    
    override init() {
        super.init()
    }
    
    static func changeDictToUserArray(array1 : [JSON] ) -> AnyObject{
        var tempArr : [QuestionModel] = []
        for dict in array1 {
            let placeValues = QuestionModel(dict: dict.dictionaryValue)
            tempArr.append(placeValues)
        }
        return tempArr
    }

}
