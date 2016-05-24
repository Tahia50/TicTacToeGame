//
//  ViewController.swift
//  TicTacToe
//
//  Created by Tahia Ata on 5/16/16.
//  Copyright © 2016 Tahia Ata. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var ticCollectionView: UICollectionView!
    @IBOutlet weak var firstPlayerLabel: UILabel!
    @IBOutlet weak var secondPlayerLabel: UILabel!

    var ticArray = [UIImage?](count: Constants.gameInfo.totalGridNumber, repeatedValue: UIImage(named: Constants.gameInfo.defaultImageName))
    let firstPlayer = Constants.PlayerInfo.playerOne
    let secondPlayer = Constants.PlayerInfo.playerTwo
    var firstPlayerName = Constants.PlayerInfo.firstPlayerName
    var secondPlayerName = Constants.PlayerInfo.secondPlayerName
    var currentPlayer = Constants.PlayerInfo.playerOne
    var count: Int = 0
    var checkArray: [[Int]] = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    var win = false
    let numberOfRowColumn: Int = 3
    let ticCellIdentifier = "TicCellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: Constants.gameInfo.backGroundImageName)!)
        firstPlayerLabel.text = firstPlayerName
        secondPlayerLabel.text = secondPlayerName
        commentLabel.text = Constants.showTurn(firstPlayerName)
        ticCollectionView.layer.borderColor = UIColor.grayColor().CGColor
        ticCollectionView.layer.borderWidth = 2.0
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        layout.headerReferenceSize = CGSizeZero;
        layout.footerReferenceSize = CGSizeZero;
        layout.itemSize = CGSize(width: ticCollectionView.frame.size.width / CGFloat(numberOfRowColumn), height: ticCollectionView.frame.size.height / CGFloat(numberOfRowColumn))
        layout.minimumLineSpacing = 0.0
        layout.minimumInteritemSpacing = 0.0
        ticCollectionView.collectionViewLayout = layout;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - CollectionView Data Source methods

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return numberOfRowColumn;
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfRowColumn;
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ticCellIdentifier, forIndexPath: indexPath) as! TicCollectionViewCell
        cell.backgroundColor = UIColor.grayColor()
        cell.ticImageView?.image = ticArray[indexPath.row]
        return cell
    }

    // MARK: - CollectionView Delegate methods

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell: TicCollectionViewCell = collectionView.cellForItemAtIndexPath(indexPath) as! TicCollectionViewCell
        checkArray[indexPath.section][indexPath.row] = currentPlayer
        let toImage = currentPlayer == firstPlayer ? UIImage(named: Constants.PlayerInfo.playerOneImageName) : UIImage(named: Constants.PlayerInfo.playerTwoimageName)
        UIView.transitionWithView(cell.ticImageView, duration: 0.4, options: UIViewAnimationOptions.TransitionFlipFromRight, animations: {
            collectionView.userInteractionEnabled = false
            cell.userInteractionEnabled = false
            cell.ticImageView.image = toImage},
                                  completion: { (value: Bool) in
                                    self.win = self.checkForWin(indexPath.section, column: indexPath.row, playerNumber: self.currentPlayer, path: indexPath)
                                    if (self.win == true) {
                                        self.commentLabel.text = self.currentPlayer == self.firstPlayer ? Constants.showWin(self.firstPlayerName) : Constants.showWin(self.secondPlayerName)
                                        self.ticCollectionView.userInteractionEnabled = false
                                        return
                                    }
                                    if self.currentPlayer == self.firstPlayer {
                                        self.currentPlayer = self.secondPlayer
                                        self.commentLabel.text = Constants.showTurn(self.secondPlayerName)
                                    } else {
                                        self.currentPlayer = self.firstPlayer
                                        self.commentLabel.text = Constants.showTurn(self.firstPlayerName)
                                    }
                                    self.count = self.count + 1
                                    if (self.count == Constants.gameInfo.totalGridNumber ) {
                                        self.commentLabel.text = Constants.State.draw
                                    }
                                    collectionView.userInteractionEnabled = true
        })
    }

    // MARK: - Custom methods

    func checkForWin(row: Int, column: Int, playerNumber: Int, path: NSIndexPath) -> Bool {
        if count >= 3 {
            if checkArray[0][0] == playerNumber && checkArray[1][1] == playerNumber && checkArray[2][2] == playerNumber {
                let drawArray: [CGPoint] = [CGPointMake(0.0, 0.0), CGPointMake(1.0, 1.0), CGPointMake(2.0, 2.0)]
                drawOverlay(drawArray)
                return true
            } else if checkArray[0][2] == playerNumber && checkArray[1][1] == playerNumber && checkArray[2][0] == playerNumber {
                let drawArray: [CGPoint] = [CGPointMake(0.0, 2.0), CGPointMake(1.0, 1.0), CGPointMake(2.0, 0.0)]
                drawOverlay(drawArray)
                return true
            } else if checkArray[0][0] == playerNumber && checkArray[0][1] == playerNumber && checkArray[0][2] == playerNumber {
                let drawArray: [CGPoint] = [CGPointMake(0.0, 0.0), CGPointMake(0.0, 1.0), CGPointMake(0.0, 2.0)]
                drawOverlay(drawArray)
                return true
            } else if checkArray[1][0] == playerNumber && checkArray[1][1] == playerNumber && checkArray[1][2] == playerNumber {
                let drawArray: [CGPoint] = [CGPointMake(1.0, 0.0), CGPointMake(1.0, 1.0), CGPointMake(1.0, 2.0)]
                drawOverlay(drawArray)
                return true
            } else if checkArray[2][0] == playerNumber && checkArray[2][1] == playerNumber && checkArray[2][2] == playerNumber {
                let drawArray: [CGPoint] = [CGPointMake(2.0, 0.0), CGPointMake(2.0, 1.0), CGPointMake(2.0, 2.0)]
                drawOverlay(drawArray)
                return true
            } else if checkArray[0][0] == playerNumber && checkArray[1][0] == playerNumber && checkArray[2][0] == playerNumber {
                let drawArray: [CGPoint] = [CGPointMake(0.0, 0.0), CGPointMake(1.0, 0.0), CGPointMake(2.0, 0.0)]
                drawOverlay(drawArray)
                return true
            } else if checkArray[0][1] == playerNumber && checkArray[1][1] == playerNumber && checkArray[2][1] == playerNumber {
                let drawArray: [CGPoint] = [CGPointMake(0.0, 1.0), CGPointMake(1.0, 1.0), CGPointMake(2.0, 1.0)]
                drawOverlay(drawArray)
                return true
            } else if checkArray[0][2] == playerNumber && checkArray[1][2] == playerNumber && checkArray[2][2] == playerNumber {
                let drawArray: [CGPoint] = [CGPointMake(0.0, 2.0), CGPointMake(1.0, 2.0), CGPointMake(2.0, 2.0)]
                drawOverlay(drawArray)
                return true
            }
        }
        return false
    }

    func drawOverlay(drawArray: [CGPoint]) {
        for i in 0..<drawArray.count {
            let xPosition = drawArray[i].y
            let yPosition = drawArray[i].x
            let defaultDistance = ticCollectionView.frame.size.width / CGFloat(numberOfRowColumn)
            let demoView = UIView(frame: CGRectMake(ticCollectionView.frame.origin.x + xPosition * defaultDistance, ticCollectionView.frame.origin.y + yPosition * defaultDistance, defaultDistance, defaultDistance))
            demoView.backgroundColor = UIColor.blueColor()
            demoView.alpha = 0.2
            demoView.tag = i + 1
            self.view.addSubview(demoView)
        }
    }

    //MARK: - IBAction 

    @IBAction func goToSettings(sender: AnyObject) {

    }

    @IBAction func restartGame(sender: AnyObject) {
        for cell in ticCollectionView.visibleCells() as! [TicCollectionViewCell] {
            cell.userInteractionEnabled = true
        }
        ticCollectionView.reloadData()
        firstPlayerLabel.text = firstPlayerName
        secondPlayerLabel.text = secondPlayerName
        commentLabel.text = Constants.showTurn(firstPlayerName)
        currentPlayer = Constants.PlayerInfo.playerOne
        count = 0
        win = false
        checkArray = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
        ticCollectionView.userInteractionEnabled = true
        for subview in self.view.subviews {
            if subview.tag > 0 {
                subview.removeFromSuperview()
            }
        }
    }
    
}
