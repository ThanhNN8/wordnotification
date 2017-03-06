//
//  ItemVocabularyCell.swift
//  WordNotification
//
//  Created by 11397236 on 3/6/17.
//  Copyright © 2017 SuriHome. All rights reserved.
//

import UIKit

class ItemVocabularyCell: UITableViewCell {
    
    @IBOutlet weak var lb_word: UILabel!
    @IBOutlet weak var lb_mean: UILabel!
    @IBOutlet weak var lb_example: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDataForCell(word: Vocabulary) {
        self.lb_word.text = word.word
        self.lb_mean.text = word.mean
        self.lb_example.text = word.example
        if word.status == 0 {
            self.lb_word.textColor = UIColor.black
        } else if word.status == 1 {
            self.lb_word.textColor = UIColor.blue
        } else {
            self.lb_word.textColor = UIColor.green
        }
    }
    
}
