//
//  ViewController.swift
//  Roshambo
//
//  Created by Jefferson Bonnaire on 24/09/2015.
//  Copyright © 2015 Jefferson Bonnaire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showGameControllerModalWithCodeAndSegue" {
            let controller = segue.destinationViewController as! GameController
            controller.userHand = "paper"
        } else if segue.identifier == "showGameControllerModalWithSegueOnly" {
            let controller = segue.destinationViewController as! GameController
            controller.userHand = "scissors"
        }
    }

    @IBAction func launchGameWithCodeOnly(sender: AnyObject) {
        var controller: GameController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("GameController") as! GameController

        if let title = sender.currentTitle {
            controller.userHand = title
        }

        self.presentViewController(controller, animated: true, completion: nil)
    }

    @IBAction func launchGameWithCodeAndSegue(sender: AnyObject?) {
        self.performSegueWithIdentifier("showGameControllerModalWithCodeAndSegue", sender: self)
    }
}
