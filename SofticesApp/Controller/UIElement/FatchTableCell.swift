//
//  FatchTableCell.swift
//  SofticesApp
//
//  Created by sa13 on 21/12/18.
//  Copyright © 2018 sa13. All rights reserved.
//

import UIKit

class FatchTableCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblMobileNo: UILabel!
    @IBOutlet weak var btnRemove: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
