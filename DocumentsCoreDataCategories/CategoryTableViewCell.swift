//
//  CategoryTableViewCell.swift
//  DocumentsCoreDataCategories
//
//  Created by Liam Flaherty on 9/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
