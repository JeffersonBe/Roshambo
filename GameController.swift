//
//  GameController.swift
//  Roshambo
//
//  Created by Jefferson Bonnaire on 24/09/2015.
//  Copyright © 2015 Jefferson Bonnaire. All rights reserved.
//

import UIKit
import Foundation

enum Hand {
    case rock, paper, scissors
}

class GameController: UIViewController {

    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    @IBOutlet weak var buttonPlayAgain: UIButton!
    var userHand: String!
    var opponentHand: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        opponentHand = ramdonOpponentHand()

        let fight = (userHand, opponentHand)
        print(fight)

        switch fight {
            case _ where fight.0 == "rock" && fight.1 == "paper":
                labelResult.text = "Paper covers rock. You lose!"
                imageResult.image = UIImage(named: "PaperCoversRock")
            case _ where fight.0 == "rock" && fight.1 == "scissors":
                labelResult.text = "Rock crushes scissors. You win!"
                imageResult.image = UIImage(named: "RockCrushesScissors")
            case _ where fight.0 == "paper" && fight.1 == "rock":
                labelResult.text = "Paper covers rock. You win!"
                imageResult.image = UIImage(named: "PaperCoversRock")
            case _ where fight.0 == "paper" && fight.1 == "scissors":
                labelResult.text = "Scissors cut Paper. You lose!"
                imageResult.image = UIImage(named: "ScissorsCutPaper")
            case _ where fight.0 == "scissors" && fight.1 == "rock":
                labelResult.text = "Rock crushes scissors. You lose!"
                imageResult.image = UIImage(named: "RockCrushesScissors")
            case _ where fight.0 == "scissors" && fight.1 == "paper":
                labelResult.text = "Scissors cut Paper. You win!"
                imageResult.image = UIImage(named: "ScissorsCutPaper")
            default:
                labelResult.text = "It's a tie"
                imageResult.image = UIImage(named: "itsATie")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func ramdonOpponentHand() -> String {
        let randomHand = arc4random_uniform(3) + 1
        let opponantHand: String

        switch randomHand {
            case 1: opponantHand = "rock"
            case 2: opponantHand = "paper"
            case 3: opponantHand = "scissors"
            default: opponantHand = "It's a tie"
        }
        return opponantHand
    }

    @IBAction func playAgain(sender: AnyObject?) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
