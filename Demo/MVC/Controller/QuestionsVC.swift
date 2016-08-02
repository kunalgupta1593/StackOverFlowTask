//
//  QuestionsVC
//  Demo
//
//  Created by Kunal Gupta on 02/08/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit
import SwiftyJSON

class QuestionsVC: UIViewController,UISearchBarDelegate,UIGestureRecognizerDelegate {
    
    //MARK::- OUTLETS
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchvar: UISearchBar!

    //MARK::- VARIABLES

    var tableViewDataSource :TableViewDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar){
        print(searchBar.text)
        
    let searchText = searchBar.text?.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
        ApiDetector.getDataOfURL(String(format:ApiCollection.apiSearch,searchText ?? ""), dict: ["":""], failure: { (error) in
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
        
        
        let SingleUserArray = QuestionModel.changeDictToUserArray(arr) ?? []
        setValueToTable((SingleUserArray as? [QuestionModel])!)
    }
    
    func setValueToTable(arr:[QuestionModel]){
        print(arr)
        tableViewDataSource = TableViewDataSource.init(items: arr, height: UITableViewAutomaticDimension, estimatedHeight: 88, tableView: tableView, cellIdentifier: "QuestionsTableViewCell", configureCellBlock: { (cell, item, indexpath) in
            let model  = arr[indexpath.row]
            let cell = cell as? QuestionsTableViewCell
            cell?.configureCell(model, index: indexpath)
            }, aRowSelectedListener: { (indexPath) in
                let model  = arr[indexPath.row]
                guard let vc = self.storyboard?.instantiateViewControllerWithIdentifier("AnswerViewController") as? AnswerViewController else {return}
                vc.strQuestionID = model.strQuestionID
                vc.strQuestionTitle = model.strTitle
                vc.strQuestion = model.strQuestion
                self.navigationController?.pushViewController(vc, animated: true)
        })
        tableView.delegate = tableViewDataSource
        tableView.dataSource = tableViewDataSource
    }
    
}

