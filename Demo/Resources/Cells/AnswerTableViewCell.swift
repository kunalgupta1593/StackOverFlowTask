//
//  AnswerTableViewCell.swift
//  Demo
//
//  Created by Kunal Gupta on 02/08/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {
   
    //MARK::- OUTLETS
    
    @IBOutlet weak var labelVotes: UILabel!
    @IBOutlet weak var labelAuthorName: UILabel!
    @IBOutlet weak var labelAnswer: UILabel!
    @IBOutlet weak var imageViewAuthor: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(model : AnswersModel, index:NSIndexPath){
        labelVotes.text = String(format: "%@ votes",model.strScore ?? "");
        imageViewAuthor.sd_setImageWithURL(NSURL.init(string: model.strAuthorImage ?? ""))
        labelAuthorName.text = model.strAuthorName
//        labelAnswer.text = model.strAnswer
        
        let attrStr = try! NSAttributedString(
            data: (model.strAnswer ?? "").dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
            options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
            documentAttributes: nil)
        labelAnswer.attributedText = attrStr
        
    }
}
