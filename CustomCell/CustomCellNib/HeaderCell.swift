//
//  HeaderCell.swift
//  CustomCell
//
//  Created by Wang, Zewen on 2018-03-01.
//  Copyright © 2018 Wang, Zewen. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var dotHeight: NSLayoutConstraint!
    
    @IBOutlet weak var metricNameLabel: UILabel!
    
    @IBOutlet weak var metricDetailLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var arrowLabel: UILabel!
    @IBOutlet weak var metricDetailLabel: UILabel!
    
    @IBOutlet weak var dot1: UIImageView!
    @IBOutlet weak var dot2: UIImageView!
    @IBOutlet weak var dot3: UIImageView!
    @IBOutlet weak var dot4: UIImageView!
    @IBOutlet weak var dot5: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
