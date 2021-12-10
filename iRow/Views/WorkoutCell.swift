//
//  WorkoutCell.swift
//  iRow
//
//  Created by Jake Stone on 12/9/21.
//


import UIKit

class WorkoutMainTableViewCell: UITableViewCell {
    @IBOutlet weak var subName: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var translucentView: UIView!
    @IBOutlet weak var coverImage: UIImageView!
    
    let THEME_COLOR1 = UIColor.init(red:0.000, green:0.157, blue:0.216,
                                    alpha:1.00)  // DARK BLUE
    override func awakeFromNib() {
        super.awakeFromNib()
        self.coverImage.backgroundColor = THEME_COLOR1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
