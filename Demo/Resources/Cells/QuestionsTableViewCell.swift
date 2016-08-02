//
//  QuestionsTableViewCell.swift
//  Demo
//
//  Created by Kunal Gupta on 02/08/16.
//  Copyright © 2016 Kunal Gupta. All rights reserved.
//

import UIKit
import SDWebImage

class QuestionsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelVotes: UILabel!
    @IBOutlet weak var labelQuestionsNumber: UILabel!
    @IBOutlet weak var labelAuthorName: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var imageViewAuthor: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(model : QuestionModel, index:NSIndexPath){
        labelVotes.text = String(format: "%@ votes",model.strScore ?? "");
        labelQuestion.text = model.strTitle;
        imageViewAuthor.sd_setImageWithURL(NSURL.init(string: model.strAuthorImage ?? ""))
        labelAuthorName.text = model.strAuthorName
    }
}
