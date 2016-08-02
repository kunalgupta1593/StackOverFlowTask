//
//  AnswerViewController.swift
//  Demo
//
//  Created by Kunal Gupta on 02/08/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit
import SwiftyJSON

class AnswerViewController: UIViewController {

    //MARK::- OUTLETS
    
    @IBOutlet weak var labelTitle: UILabel!

    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var viewHeader: UIView!
    //MARK::- VARIABLES
    
    var strQuestionID :String?
    var strQuestionTitle :String?
    var strQuestion:String?
    var tableViewDataSource :TableViewDataSource?

    //MARK::- PRE DEFINED
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = strQuestionTitle
        hitAPI()
        setQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let viewHeader = tableView.tableHeaderView {
            let height = viewHeader.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
            var headerFrame = viewHeader.frame
            
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                viewHeader.frame = headerFrame
                tableView.tableHeaderView = viewHeader
            }
        }
    }
    
    //MARK::- SELF MADE
    
    func setQuestion(){
        let attrStr = try! NSAttributedString(
            data: (strQuestion ?? "").dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
            options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
            documentAttributes: nil)
        labelQuestion.attributedText = attrStr
    }
    
    func hitAPI(){
        ApiDetector.getDataOfURL(String(format: ApiCollection.apiAnswers,strQuestionID ?? ""), dict: ["":""], failure: { (error) in
            print(error)
            }, success: { (data) in
                print(data)
                self.handleSuccess(data)
            }, method: "GET", viewControl: self, pic: UIImage())
    }
    
    func handleSuccess(response :AnyObject){
        let data = JSON(response)
        let dict : Dictionary = data.dictionaryValue
        let arr : [JSON] = dict["items"]?.arrayValue ?? []
        print(response)
        let SingleUserArray = AnswersModel.changeDictToUserArray(arr) ?? []
        setValueToTable((SingleUserArray as? [AnswersModel])!)
    }
    
    func setValueToTable(arr:[AnswersModel]){
        
        tableViewDataSource = TableViewDataSource.init(items: arr, height: UITableViewAutomaticDimension, estimatedHeight: 88, tableView: tableView, cellIdentifier: "AnswerTableViewCell", configureCellBlock: { (cell, item, indexpath) in
            
            let model  = arr[indexpath.row]
            let cell = cell as? AnswerTableViewCell
            cell?.configureCell(model, index: indexpath)
            }, aRowSelectedListener: { (indexPath) in
                
        })
        tableView.delegate = tableViewDataSource
        tableView.dataSource = tableViewDataSource
    }
    
    //MARK::- ACTION BUTTONS
    
    @IBAction func actionBtnBack(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
}
