//
//  SettingController.swift
//  TicTacToe
//
//  Created by Tahia Ata on 5/19/16.
//  Copyright © 2016 Tahia Ata. All rights reserved.
//

import UIKit

class SettingController: UITableViewController {

    let playerCellIdentifier = "PlayerCell"
    let defaultImageCellIdentifier = "DefaultImageCell"
    let backGroundImageCellIdentifier = "BackGroundImageCell"
    let totalSettingItem: Int = 4

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - TableView Data Source methods

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalSettingItem
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.row == 0 || indexPath.row == 1) {
            let cell = tableView.dequeueReusableCellWithIdentifier(playerCellIdentifier, forIndexPath: indexPath) as! PlayerCell
            if (indexPath.row == 0) {
                cell.playerTypeLabel.text = Constants.PlayerInfo.playerOneTitle
                cell.playerImageView.image = UIImage(named: Constants.PlayerInfo.playerOneImageName)
            } else {
                cell.playerTypeLabel.text = Constants.PlayerInfo.playerTwoTitle
                cell.playerImageView.image = UIImage(named: Constants.PlayerInfo.playerTwoimageName)
            }
            return cell
        } else if (indexPath.row == 2) {
            let cell = tableView.dequeueReusableCellWithIdentifier(defaultImageCellIdentifier, forIndexPath: indexPath) as! DefaultImageCell
            cell.defaultImageView.image = UIImage(named: Constants.gameInfo.defaultImageName)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(backGroundImageCellIdentifier, forIndexPath: indexPath) as! BackGroundImageCell
            return cell
        }
    }

    // MARK: - TableView Delegate methods

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85.0
    }

}

