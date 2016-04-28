//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Deshmukh,Richa on 4/27/16.
//  Copyright © 2016 Richa. All rights reserved.
//

import UIKit

class ChooseViewController: UIViewController {
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func rockPaperScissorsButtonPressed(sender: UIButton) {
        
        //Code demonstrates 3 ways of navigating to the next view controller
        
        //1. Present the view controller through code if the user chooses Rock
        if(sender == rockButton){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultVC = storyboard.instantiateViewControllerWithIdentifier("ResultsViewController") as! ResultsViewController
            resultVC.userChoosenOption = Roshambo.Rock
            resultVC.phoneChoosenOption = getRandomOption()
            
            presentViewController(resultVC, animated: true, completion: nil)
            
        //2. Perform segue through code if user chooses Paper
        }else if(sender == paperButton){
            performSegueWithIdentifier("paperSegue", sender: self)
        }
        
        //3. Use direct segue if the user chooses Scissors
    }

    func getRandomOption() -> Roshambo{
        let randomNo = arc4random() % 3
        var random : Roshambo
        switch randomNo{
        case 0:
            random = Roshambo.Rock
        case 1:
            random = Roshambo.Paper
        default:
            random = Roshambo.Scissors
        }
        return random
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "scissorsSegue"){
            let resultsVC = segue.destinationViewController as! ResultsViewController
            resultsVC.userChoosenOption = Roshambo.Scissors
            resultsVC.phoneChoosenOption = getRandomOption()
            
        }else if(segue.identifier == "paperSegue"){
            let resultsVC = segue.destinationViewController as! ResultsViewController
            resultsVC.userChoosenOption = Roshambo.Paper
            resultsVC.phoneChoosenOption = getRandomOption()
        }
    }

}

