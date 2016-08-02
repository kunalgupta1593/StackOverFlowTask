//
//  ApiCollection.swift
//  GoHobo
//
//  Created by CBL24pc on 4/9/16.
//  Copyright © 2016 GCode. All rights reserved.
//

import UIKit

struct ApiCollection{
    
    static let apiSearch = "https://api.stackexchange.com/2.2/search/advanced?order=desc&sort=activity&q=%@&site=stackoverflow&filter=!b0OfNJc69poRsX"

    static let apiAnswers = "https://api.stackexchange.com/2.2/questions/%@/answers?order=desc&sort=activity&site=stackoverflow&filter=!9YdnSM64y"
}