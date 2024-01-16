//
//  TwitterHomeViewTableCell.swift
//  TwitterSampleApp5
//
//  Created by 高橋真悟 on 2024/01/07.
//

import UIKit

class TwitterHomeViewTableCell: UITableViewCell {
    
    @IBOutlet private weak var userName: UILabel!
    @IBOutlet private weak var recordDateLabel: UILabel!
    @IBOutlet weak var twitterText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setup(userName: String, recordDateLabel: Date, twitterText: String)  {
        self.userName.text = userName
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let formattedDate = dateFormatter.string(from: recordDateLabel)
        self.recordDateLabel.text = formattedDate
        self.twitterText.text = twitterText
    }
    
}
