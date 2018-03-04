//
//  Type1TableViewCell.swift
//  CustomCell
//
//  Created by Wang, Zewen on 2018-03-01.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import UIKit

class Type1TableViewCell: UITableViewCell {

    @IBOutlet weak var specialtyNameLabel: UILabel!
   
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var summaryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
