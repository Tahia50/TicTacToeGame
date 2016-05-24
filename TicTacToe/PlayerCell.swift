//
//  PlayerCell.swift
//  TicTacToe
//
//  Created by Tahia Ata on 5/18/16.
//  Copyright © 2016 Tahia Ata. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {

    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerTypeLabel: UILabel!
    @IBOutlet weak var playerNameField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

