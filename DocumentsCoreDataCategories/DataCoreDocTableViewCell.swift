//
//  DataCoreDocTableViewCell.swift
//  DocumentsCoreDataCategories
//
//  Created by Liam Flaherty on 9/28/18.
//  Copyright © 2018 Liam Flaherty. All rights reserved.
//

import UIKit

class DataCoreDocTableViewCell: UITableViewCell {

    @IBOutlet weak var DocName: UILabel!
    
    @IBOutlet weak var DocSize: UILabel!
    
    @IBOutlet weak var DocDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
