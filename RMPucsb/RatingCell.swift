//
//  RatingCell.swift
//  RMPucsb
//
//  Created by Hao Yi on 11/26/21.
//

import UIKit

class RatingCell: UITableViewCell {

    @IBOutlet var qualityLabel: UILabel!
    @IBOutlet var difficultyLabel: UILabel!
    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var attendanceLabel: UILabel!
    @IBOutlet var takeAgainLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
