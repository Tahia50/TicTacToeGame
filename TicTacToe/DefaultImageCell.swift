//
//  DefaultImageCell.swift
//  TicTacToe
//
//  Created by Tahia Ata on 5/19/16.
//  Copyright © 2016 Tahia Ata. All rights reserved.
//

import UIKit

class DefaultImageCell: UITableViewCell {

    @IBOutlet weak var defaultImageView: UIImageView!
    
    @IBAction func switchPlayerClicked(sender: AnyObject) {
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
