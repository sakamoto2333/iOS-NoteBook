//
//  NoteCell.swift
//  ios NoteBook
//
//  Created by 123 on 16/10/24.
//  Copyright © 2016年 123. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Date: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
